#===============================================================================
# Battle Aura
#-------------------------------------------------------------------------------
# Port of EBDX's AURAFLARE: a big "power up" burst on a battler, followed by a
# lingering aura (pulsing tint + rising flame particles) that stays on the
# Pokémon until it switches out, faints, or you turn it off.
#
# Midbattle script keys (Deluxe Battle Kit):
#   "auraFlare"   => :Red        # play the flare, then leave a lingering aura
#   "battlerAura" => :Blue       # just turn the lingering aura on (no flare)
#   "battlerAura" => false       # turn the lingering aura off
#
# Colors can be :Red, :Blue, :Purple, :Green, :Gold, :Black, or [r, g, b].
# Passing true uses :Red. Applies to the triggering battler (or "setBattler").
#
# From Ruby (e.g. in a MidbattleHandlers script):
#   battle.scene.pbAuraFlare(battler.index, :Red)
#   battler.aura_color = BattleAura.color(:Blue)   # or nil to remove
#===============================================================================
module BattleAura
  PATH = "Graphics/Plugins/Battle Aura/"

  COLORS = {
    :Red    => [221, 68, 92],
    :Blue   => [80, 140, 230],
    :Purple => [150, 60, 220],
    :Green  => [70, 200, 90],
    :Gold   => [240, 190, 50],
    :Black  => [40, 20, 50]
  }

  def self.color(value)
    case value
    when nil, false then return nil
    when Color      then return value.clone
    when Array      then return Color.new(value[0], value[1], value[2])
    when Symbol
      rgb = COLORS[value] || COLORS[:Red]
      return Color.new(*rgb)
    end
    return Color.new(*COLORS[:Red])
  end
end

#===============================================================================
# Battler: stores the aura color. Cleared when the Pokémon switches in fresh.
#===============================================================================
class Battle::Battler
  attr_accessor :aura_color

  alias battle_aura_pbInitEffects pbInitEffects
  def pbInitEffects(batonPass)
    battle_aura_pbInitEffects(batonPass)
    @aura_color = nil if !batonPass
  end
end

#===============================================================================
# Battler sprite: draws the lingering aura.
#===============================================================================
class Battle::Scene::BattlerSprite
  PARTICLE_COUNT = 12
  attr_accessor :aura_suspended

  alias battle_aura_update update
  def update
    battle_aura_update
    update_aura
  end

  alias battle_aura_dispose dispose
  def dispose
    dispose_aura
    battle_aura_dispose
  end

  def dispose_aura
    @aura_particles&.each { |s| s.dispose if !s.disposed? }
    @aura_particles = nil
  end

  def aura_color
    return nil if @substitute || !@battler || @battler.fainted?
    return @battler.aura_color
  end

  def update_aura
    return if disposed?
    color = aura_color
    shown = color && self.visible && self.opacity > 0 && self.bitmap && !@aura_suspended
    # Pulsing tint. Only touch the color if nothing else (move animations,
    # damage flashes) is currently using it.
    if color && !@aura_suspended
      @aura_pulse ||= 0.0
      @aura_pulse += 0.05
      alpha = 40 + (Math.sin(@aura_pulse) + 1) * 50
      if self.color.alpha == 0 || self.color == @aura_last_color
        @aura_last_color = Color.new(color.red, color.green, color.blue, alpha)
        self.color = @aura_last_color
      end
    elsif @aura_last_color
      self.color = Color.new(0, 0, 0, 0) if self.color == @aura_last_color
      @aura_last_color = nil
    end
    # Rising flame particles.
    if !shown
      @aura_particles&.each { |s| s.visible = false }
      @aura_frame = 0
      return
    end
    if !@aura_particles
      bmp = RPG::Cache.load_bitmap(BattleAura::PATH, "ebCharged")
      @aura_particles = []
      PARTICLE_COUNT.times do
        s = Sprite.new(self.viewport)
        s.bitmap = bmp
        s.src_rect.set(0, 0, bmp.width / 4, bmp.height)
        s.ox = bmp.width / 8
        s.oy = bmp.height
        s.opacity = 0
        @aura_particles.push(s)
      end
      @aura_frame = 0
    end
    @aura_frame ||= 0
    @aura_frame += 1 if @aura_frame < 1000
    zx = self.zoom_x
    zy = self.zoom_y
    w = self.bitmap.width * zx
    h = self.bitmap.height * zy
    left = @spriteX - self.ox * zx
    top  = @spriteY - self.oy * zy
    @aura_particles.each_with_index do |s, i|
      next if i > @aura_frame / 10   # stagger them in
      s.visible = true
      if s.opacity <= 0
        x = left + rand(w.to_i.clamp(1, 9999) * 0.8) + w * 0.1
        y = top + h * 0.3 + rand((h * 0.7).to_i.clamp(1, 9999))
        s.x = x
        s.y = y
        s.z = (rand(2) == 0) ? self.z - 1 : self.z + 1
        s.src_rect.x = rand(4) * s.bitmap.width / 4
        s.zoom_x = zx
        s.zoom_y = 0.6 * zy
        s.opacity = 166 + rand(90)
        s.mirror = (x >= @spriteX)
        s.color = Color.new(color.red, color.green, color.blue, 200)
      end
      s.zoom_y += 0.07 * zy
      s.opacity -= 11
    end
  end
end

#===============================================================================
# Scene: the flare burst animation.
#===============================================================================
class Battle::Scene
  def pbAuraFlare(idxBattler, color_param = :Red)
    battler = @battle.battlers[idxBattler]
    sprite = @sprites["pokemon_#{idxBattler}"]
    return if !battler || !sprite || !sprite.bitmap || battler.fainted?
    aura = BattleAura.color(color_param) || BattleAura.color(:Red)
    path = BattleAura::PATH
    # Hide databoxes.
    boxes = []
    @battle.battlers.each_with_index do |b, i|
      box = @sprites["dataBox_#{i}"]
      next if !b || !box || !box.visible
      boxes.push(box)
      box.visible = false
    end
    sprite.aura_suspended = true
    factor = sprite.zoom_x
    cx = sprite.x - sprite.ox * sprite.zoom_x + sprite.bitmap.width * sprite.zoom_x / 2
    cy = sprite.y - sprite.oy * sprite.zoom_y + sprite.bitmap.height * sprite.zoom_y / 2
    fp = {}
    # Converging particles
    16.times do |i|
      s = Sprite.new(@viewport)
      s.bitmap = RPG::Cache.load_bitmap(path, sprintf("ebMega%03d", rand(4) + 1))
      s.ox = s.bitmap.width / 2
      s.oy = s.bitmap.height / 2
      s.z = sprite.z + 10
      s.opacity = 0
      fp["c#{i}"] = s
    end
    # Rays
    angles = (0...8).map { |i| (360 / 8) * i + 15 }
    8.times do |j|
      s = Sprite.new(@viewport)
      s.bitmap = RPG::Cache.load_bitmap(path, "ebMega005")
      s.ox = 0
      s.oy = s.bitmap.height / 2
      s.color = aura
      s.opacity = 0
      s.zoom_x = s.zoom_y = 0
      s.x = cx
      s.y = cy
      s.angle = angles.delete_at(rand(angles.length))
      s.z = sprite.z + 2
      fp["r#{j}"] = s
    end
    # Ripples
    toggles = []
    3.times do |j|
      s = Sprite.new(@viewport)
      s.bitmap = RPG::Cache.load_bitmap(path, "ebMega006")
      s.ox = s.bitmap.width / 2
      s.oy = s.bitmap.height / 2
      s.x = cx
      s.y = cy
      s.opacity = 0
      s.zoom_x = s.zoom_y = 2 * factor
      s.z = sprite.z + 1
      s.color = aura
      fp["v#{j}"] = s
      toggles[j] = 1
    end
    pbSEPlay("Anim/Harden", 120)
    tint = Color.new(aura.red, aura.green, aura.blue, 0)
    # --- Charge phase (ticks at 40/sec, like EBDX) ---
    aura_ticks(104) do |i|
      tint.alpha = [tint.alpha + 8, 255].min
      sprite.color = tint
      16.times do |j|
        next if j > i / 8
        s = fp["c#{j}"]
        if s.opacity == 0 && i < 72
          s.opacity = 255
          ang = rand * Math::PI * 2
          r = 96 * factor
          s.x = cx + Math.cos(ang) * r
          s.y = cy + Math.sin(ang) * r
        end
        s.x += (cx - s.x) * 0.1
        s.y += (cy - s.y) * 0.1
        s.opacity -= 16
      end
      8.times do |j|
        s = fp["r#{j}"]
        if s.opacity == 0 && j <= (i % 128) / 16 && i < 96
          s.opacity = 255
          s.zoom_x = s.zoom_y = 0
        end
        s.opacity -= 4
        s.zoom_x += 0.05
        s.zoom_y += 0.05
      end
      pbSEPlay("Anim/Twine", 80) if i == 40
      pbSEPlay("Anim/Refresh") if i == 56
      if i >= 24
        3.times do |j|
          next if j > (i - 32) / 12
          s = fp["v#{j}"]
          next if s.zoom_x <= 0
          s.opacity += 16 * toggles[j]
          s.zoom_x -= 0.05
          s.zoom_y -= 0.05
          toggles[j] = -0.2 if s.zoom_x < 1.6 * factor
        end
      end
    end
    pbDisposeSpriteHash(fp)
    # --- Impact phase ---
    @viewport.color = Color.new(255, 255, 255, 255)
    sprite.color = Color.new(0, 0, 0, 0)
    battler.aura_color = aura
    sprite.aura_suspended = false
    impact = Sprite.new(@viewport)
    impact.bitmap = RPG::Cache.load_bitmap(path, "impact")
    impact.ox = impact.bitmap.width / 2
    impact.oy = impact.bitmap.height / 2
    impact.x = Graphics.width / 2
    impact.y = Graphics.height / 2
    impact.z = 999
    impact.opacity = 0
    impact.color = Color.new(aura.red, aura.green, aura.blue, 160)
    battler.displayPokemon.play_cry rescue nil
    k = -2
    aura_ticks(24) do |i|
      impact.opacity += 64
      impact.angle += 180 if i % 4 == 0
      impact.mirror = !impact.mirror if i % 4 == 2
      k *= -1 if i % 4 == 0
      @viewport.color.alpha -= 16 if i > 1
      @viewport.oy = k
    end
    @viewport.oy = 0
    aura_ticks(16) do |i|
      impact.opacity -= 64
      impact.angle += 180 if i % 4 == 0
      impact.mirror = !impact.mirror if i % 4 == 2
      @viewport.color.alpha -= 16
    end
    impact.dispose
    @viewport.color = Color.new(0, 0, 0, 0)
    boxes.each { |box| box.visible = true }
  end

  # Runs the block once per "tick" at 40 ticks/sec, independent of frame rate.
  def aura_ticks(count)
    start = System.uptime
    done = 0
    while done < count
      target = [((System.uptime - start) * 40).floor + 1, count].min
      while done < target
        yield done
        done += 1
      end
      pbUpdate
    end
  end
end

#===============================================================================
# Midbattle script triggers.
#===============================================================================
MidbattleHandlers.add(:midbattle_triggers, "auraFlare",
  proc { |battle, idxBattler, idxTarget, params|
    battler = battle.battlers[idxBattler]
    next if !battler || battler.fainted? || battle.decision > 0
    battle.scene.pbForceEndSpeech
    color = (params == true) ? :Red : params
    PBDebug.log("     'auraFlare': #{battler.name} (#{battler.index})'s aura flared")
    battle.scene.pbAuraFlare(idxBattler, color)
  }
)

MidbattleHandlers.add(:midbattle_triggers, "battlerAura",
  proc { |battle, idxBattler, idxTarget, params|
    battler = battle.battlers[idxBattler]
    next if !battler
    color = (params == true) ? :Red : params
    battler.aura_color = BattleAura.color(color)
    PBDebug.log("     'battlerAura': #{battler.name} (#{battler.index})'s aura set to #{color.inspect}")
  }
)
