#===============================================================================
# Battle Cutscene Helpers
#-------------------------------------------------------------------------------
# Small tools for EBDX-style cinematic moments inside DBK midbattle scripts.
#
# Midbattle script key:
#   "runCode" => proc { |battle, idxBattler, idxTarget| ... }
#     Runs any Ruby you want, in order with the other keys in the hash.
#     Inside the proc, use `scene = battle.scene` for the helpers below.
#
# Scene helpers (call on battle.scene):
#   scene.pbCutsceneFadeOut(seconds = 0.4)    # fade battle to black
#   scene.pbCutsceneFadeIn(seconds = 0.4)     # fade back in
#   scene.pbCutsceneWait(seconds)             # wait while keeping sprites animated
#   scene.pbCharacterSlide("Friend_Luke", true) # slide a Graphics/Pictures image in
#                                             # (true = from left). Returns the sprite.
#   scene.pbCutsceneMessages(["\\shLine 1", "Line 2"])  # full message window,
#                                             # supports \\sh, \\c[n], \\se[...] etc.
#===============================================================================
class Battle::Scene
  CUTSCENE_BLACKOUT_Z = 190   # above battlers/databoxes, below message box (195)
  CUTSCENE_SLIDE_Z    = 192

  def pbCutsceneWait(seconds)
    start = System.uptime
    pbUpdate while System.uptime - start < seconds
  end

  def pbCutsceneFadeOut(seconds = 0.4)
    if !@sprites["cutsceneBlackout"]
      s = Sprite.new(@viewport)
      s.bitmap = Bitmap.new(Graphics.width, Graphics.height)
      s.bitmap.fill_rect(0, 0, Graphics.width, Graphics.height, Color.new(0, 0, 0))
      s.z = CUTSCENE_BLACKOUT_Z
      s.opacity = 0
      @sprites["cutsceneBlackout"] = s
    end
    s = @sprites["cutsceneBlackout"]
    s.visible = true
    pbShowWindow(BLANK) if defined?(BLANK)
    start = System.uptime
    loop do
      s.opacity = lerp(0, 255, seconds, start, System.uptime)
      pbUpdate
      break if s.opacity >= 255
    end
  end

  def pbCutsceneFadeIn(seconds = 0.4)
    s = @sprites["cutsceneBlackout"]
    return if !s
    start = System.uptime
    loop do
      s.opacity = lerp(255, 0, seconds, start, System.uptime)
      pbUpdate
      break if s.opacity <= 0
    end
    s.visible = false
  end

  def pbCharacterSlide(filename, fromLeft = true, seconds = 0.35)
    sprite = Sprite.new(@viewport)
    sprite.bitmap = RPG::Cache.picture(filename)
    sprite.y = (Graphics.height - 96) / 2 - sprite.bitmap.height / 2 + 20
    sprite.z = CUTSCENE_SLIDE_Z
    if fromLeft
      startX  = -sprite.bitmap.width
      targetX = Graphics.width / 4
    else
      startX  = Graphics.width
      targetX = Graphics.width * 3 / 4 - sprite.bitmap.width
    end
    sprite.x = startX
    start = System.uptime
    loop do
      sprite.x = lerp(startX, targetX, seconds, start, System.uptime)
      pbUpdate
      break if sprite.x == targetX
    end
    return sprite
  end

  # Windowskin for regular (non-speech) battle text. nil = normal battle box.
  def pbSetTextWindowSkin(skin)
    @cutscene_text_skin = skin
    return if skin
    cw = @sprites["messageWindow"]
    cw.opacity     = 0
    cw.baseColor   = MESSAGE_BASE_COLOR
    cw.shadowColor = MESSAGE_SHADOW_COLOR
  end

  alias battle_aura_pbShowWindow pbShowWindow
  def pbShowWindow(windowType)
    battle_aura_pbShowWindow(windowType)
    return if !@cutscene_text_skin || windowType != MESSAGE_BOX
    return if respond_to?(:pbInCinematicSpeech?) && pbInCinematicSpeech?
    cw = @sprites["messageWindow"]
    @sprites["messageBox"].visible = false
    if @cutscene_text_skin == :none
      # No box at all: just white text (with a dark shadow) on the screen.
      cw.opacity     = 0
      cw.baseColor   = Color.new(248, 248, 248)
      cw.shadowColor = Color.new(40, 40, 40)
      return
    end
    cw.setSkin("Graphics/Windowskins/#{@cutscene_text_skin}")
    cw.opacity = 255
    colors = getDefaultTextColors(cw.windowskin)
    cw.baseColor   = colors[0]
    cw.shadowColor = colors[1]
  end

  # Closing a paused message with Use/Back only clears its text and leaves the
  # window visible. With a custom skin (opaque window) that shows as an empty
  # box lingering through waits/slides/fades, so hide it once it's empty.
  alias battle_aura_pbDisplayPausedMessage pbDisplayPausedMessage
  def pbDisplayPausedMessage(msg, &block)
    battle_aura_pbDisplayPausedMessage(msg, &block)
    cw = @sprites["messageWindow"]
    cw.visible = false if cw && nil_or_empty?(cw.text)
  end

  # Slams a Graphics/Pictures image over the whole battle with a white flash
  # and a quick shake, holds it, then fades it away.
  def pbFlashImage(filename, hold = 0.4, se = nil, opacity = 160)
    sprite = Sprite.new(@viewport)
    sprite.bitmap = RPG::Cache.picture(filename)
    sprite.ox = sprite.bitmap.width / 2
    sprite.oy = sprite.bitmap.height / 2
    sprite.x = Graphics.width / 2
    sprite.y = Graphics.height / 2
    sprite.z = 999
    sprite.opacity = opacity
    fit = [Graphics.width.to_f / sprite.bitmap.width, Graphics.height.to_f / sprite.bitmap.height].min
    pbSEPlay(se) if se
    @viewport.color = Color.new(255, 255, 255, 255)
    start = System.uptime
    loop do
      t = System.uptime - start
      zoom = lerp(fit * 1.4, fit, 0.12, 0, t)
      sprite.zoom_x = sprite.zoom_y = zoom
      @viewport.color.alpha = lerp(255, 0, 0.3, 0, t)
      shake = (t < 0.35) ? (rand(9) - 4) : 0
      sprite.x = Graphics.width / 2 + shake
      sprite.y = Graphics.height / 2 + ((t < 0.35) ? (rand(9) - 4) : 0)
      pbUpdate
      break if t >= 0.35 + hold
    end
    start = System.uptime
    loop do
      sprite.opacity = lerp(opacity, 0, 0.15, start, System.uptime)
      pbUpdate
      break if sprite.opacity <= 0
    end
    sprite.dispose
    @viewport.color = Color.new(0, 0, 0, 0)
  end

  def pbCharacterSlideHide
    @cutscene_slide.dispose if @cutscene_slide && !@cutscene_slide.disposed?
    @cutscene_slide = nil
  end

  def pbCutsceneMessages(lines)
    lines = [lines] if !lines.is_a?(Array)
    pbShowWindow(BLANK) if defined?(BLANK)
    msgwindow = pbCreateMessageWindow(@viewport)
    msgwindow.z = 200
    if @cutscene_text_skin == :none
      msgwindow.opacity     = 0
      msgwindow.baseColor   = Color.new(248, 248, 248)
      msgwindow.shadowColor = Color.new(40, 40, 40)
    elsif @cutscene_text_skin
      msgwindow.setSkin("Graphics/Windowskins/#{@cutscene_text_skin}")
      colors = getDefaultTextColors(msgwindow.windowskin)
      msgwindow.baseColor   = colors[0]
      msgwindow.shadowColor = colors[1]
    end
    $cutscene_msg_bottom = true
    begin
      lines.each { |line| pbMessageDisplay(msgwindow, line) }
    ensure
      $cutscene_msg_bottom = false
    end
    pbDisposeMessageWindow(msgwindow)
  end
end

# BW Speech Bubble forces message windows to the top of the screen in battle.
# Keep cutscene messages at the bottom like normal battle text.
alias battle_aura_pbRepositionMessageWindow pbRepositionMessageWindow
def pbRepositionMessageWindow(msgwindow, linecount = 2)
  battle_aura_pbRepositionMessageWindow(msgwindow, linecount)
  msgwindow.y = Graphics.height - msgwindow.height if $cutscene_msg_bottom
end

#-------------------------------------------------------------------------------
# "cutsceneFade" => :Out / :In   (optional seconds: [:Out, 1.0])
# Fades the battle to black (text box still shows on top) or back in.
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "cutsceneFade",
  proc { |battle, idxBattler, idxTarget, params|
    dir, secs = params.is_a?(Array) ? params : [params, 0.4]
    battle.scene.pbForceEndSpeech
    if dir == :In
      battle.scene.pbCharacterSlideHide
      battle.scene.pbCutsceneFadeIn(secs)
    else
      battle.scene.pbCutsceneFadeOut(secs)
    end
    next nil
  }
)

#-------------------------------------------------------------------------------
# "characterSlide" => ["Friend_Luke", :Left]   (or :Right)
# "characterSlide" => :Hide
# Slides in a Graphics/Pictures image. It stays up until the next slide,
# :Hide, or "cutsceneFade" => :In.
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "characterSlide",
  proc { |battle, idxBattler, idxTarget, params|
    scene = battle.scene
    scene.pbCharacterSlideHide
    next nil if params == :Hide || !params
    file, side = params.is_a?(Array) ? params : [params, :Left]
    scene.instance_variable_set(:@cutscene_slide, scene.pbCharacterSlide(file, side != :Right))
    next nil
  }
)

#-------------------------------------------------------------------------------
# "shoutText" => ["Benino: Keith!!", "Luke: Do the thing!!!"]
# Like "text", but the lines shake (\sh). Other message codes work too.
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "shoutText",
  proc { |battle, idxBattler, idxTarget, params|
    battle.scene.pbForceEndSpeech
    lines = params.is_a?(Array) ? params : [params]
    battle.scene.pbCutsceneMessages(lines.map { |l| "\\sh" + l })
    next nil
  }
)

#-------------------------------------------------------------------------------
# New trigger: "BeforeMoveAnim" - fires right before a move's animation plays
# (after the "X used Y!" message), so you can interrupt just before the hit.
#   "BeforeMoveAnim_FRIENDSHIPSUPERNOVA_player" => { ... }
# Also works with species/type like DBK's other move triggers:
#   "BeforeMoveAnim_player", "BeforeMoveAnim_DRAGON_foe", etc.
#-------------------------------------------------------------------------------
class Battle
  alias battle_aura_pbAnimation pbAnimation
  def pbAnimation(move, user, targets, hitNum = 0)
    if hitNum == 0 && user && !@battle_aura_in_anim_trigger && @midbattleScript
      move_data = GameData::Move.try_get(move.respond_to?(:id) ? move.id : move)
      if move_data
        target = targets.is_a?(Array) ? targets.first : targets
        idxTarget = target.respond_to?(:index) ? target.index : nil
        @battle_aura_in_anim_trigger = true
        begin
          pbDeluxeTriggers(user, idxTarget, "BeforeMoveAnim", user.species, move_data.type, move_data.id)
        ensure
          @battle_aura_in_anim_trigger = false
        end
      end
    end
    battle_aura_pbAnimation(move, user, targets, hitNum)
  end
end

#-------------------------------------------------------------------------------
# "flashImage" => "Haxorus_Shock"                      (Graphics/Pictures file)
# "flashImage" => ["Haxorus_Shock", 0.4, nil, 160]     (file, hold seconds,
#                                                       SE or nil, opacity 0-255)
# Defaults: 0.4s hold, no sound, 160 opacity.
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "flashImage",
  proc { |battle, idxBattler, idxTarget, params|
    file, hold, se, opacity = params.is_a?(Array) ? params : [params]
    hold    = 0.4 if hold.nil?
    opacity = 160 if opacity.nil?
    battle.scene.pbForceEndSpeech
    battle.scene.pbFlashImage(file, hold, se, opacity)
    next nil
  }
)

#-------------------------------------------------------------------------------
# "stopSE" => true   - stops all sound effects that are currently playing.
# (Essentials can't stop one specific SE, so any value works, e.g. the name
#  of the SE as a reminder.)
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "stopSE",
  proc { |battle, idxBattler, idxTarget, params|
    pbSEStop
    PBDebug.log("     'stopSE': stopping all sound effects")
    next nil
  }
)

#-------------------------------------------------------------------------------
# "textWindow" => "bw choice"   (any Graphics/Windowskins file)
# "textWindow" => :None         (no box, just white text)
# "textWindow" => :Default      (back to the normal battle text box)
# Skins regular "text" messages. Stays on until you set it back.
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "textWindow",
  proc { |battle, idxBattler, idxTarget, params|
    skin = (params.is_a?(String) && !params.empty?) ? params : nil
    skin = :none if params == :None
    battle.scene.pbSetTextWindowSkin(skin)
    next nil
  }
)

#-------------------------------------------------------------------------------
# "battlerStatsSilent" => [:DEFENSE, 6, :SPEED, -1]
# Same format as DBK's "battlerStats", but with no animation or message.
# Use :Reset to silently clear all stat stages.
#-------------------------------------------------------------------------------
MidbattleHandlers.add(:midbattle_triggers, "battlerStatsSilent",
  proc { |battle, idxBattler, idxTarget, params|
    battler = battle.battlers[idxBattler]
    next if !battler || battler.fainted?
    if params == :Reset
      GameData::Stat.each_battle { |s| battler.stages[s.id] = 0 }
      next nil
    end
    next nil if !params.is_a?(Array)
    params.each_slice(2) do |stat, stage|
      next if !stat.is_a?(Symbol) || !stage.is_a?(Integer) || stage == 0
      next if !GameData::Stat.exists?(stat)
      if stage > 0
        battler.pbRaiseStatStageBasic(stat, stage, true)
      else
        battler.pbLowerStatStageBasic(stat, -stage, true)
      end
    end
    PBDebug.log("     'battlerStatsSilent': #{battler.name} (#{battler.index})'s stats silently changed")
    next nil
  }
)

MidbattleHandlers.add(:midbattle_triggers, "runCode",
  proc { |battle, idxBattler, idxTarget, params|
    next if !params.respond_to?(:call)
    PBDebug.log("     'runCode': running custom code")
    params.call(battle, idxBattler, idxTarget)
    next nil
  }
)
