BEAT_GAME_SWITCH = 75
BEAT_GAME_STAR_X = 170   # adjust left/right
BEAT_GAME_STAR_Y = 70   # adjust up/down

class PokemonLoadScreen
  alias __star_pbStartLoadScreen pbStartLoadScreen
  def pbStartLoadScreen
    switches = @save_data && @save_data[:switches]
    $save_beat_game = switches ? switches[BEAT_GAME_SWITCH] : false
    __star_pbStartLoadScreen
  end
end

class PokemonLoadPanel
  alias __star_refresh refresh
  def refresh
    redraw = @refreshBitmap
    __star_refresh
    return if !redraw || !@isContinue || !$save_beat_game || disposed?
    pbDrawImagePositions(self.bitmap,
      [["Graphics/UI/Load/star", BEAT_GAME_STAR_X, BEAT_GAME_STAR_Y]])
  end
end


def pbPlayCreditsVideo(fps = 20, fade_seconds = 4)
  folder = "Graphics/Credits/"
  song = "Audio/BGM/CreditsVideo"
  vol = $PokemonSystem.bgmvolume + 20
  frames = Dir.glob(folder + "frame_*.png").length
  viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
  viewport.z = 99990
  sprite = Sprite.new(viewport)
  Audio.bgm_play(song, vol, 100)
  wait = [Graphics.frame_rate / fps, 1].max
  i = 0
  while i < frames
    old = sprite.bitmap
    sprite.bitmap = Bitmap.new(sprintf("%sframe_%04d", folder, i + 1))
    old&.dispose
    wait.times { Graphics.update; Input.update }
    if Input.trigger?(Input::BACK)
      Audio.bgm_stop
      break if pbConfirmMessage(_INTL("Skip the credits?"))
      Audio.bgm_play(song, vol, 100, i.to_f / fps)   # resume from this point
    end
    i += 1
  end
  # Slow fade to black on the last frame
  fade_frames = (fade_seconds * Graphics.frame_rate).to_i
  Audio.bgm_fade(1)
  fade_frames.times do |f|
    sprite.color = Color.new(0, 0, 0, 255 * (f + 1) / fade_frames)
    Graphics.update
    Input.update
  end
  # Make the map black too, so it doesn't flash when the video is removed
  $game_screen.start_tone_change(Tone.new(-255, -255, -255, 0), 0)
  pbUpdateSceneMap
  sprite.bitmap&.dispose
  sprite.dispose
  viewport.dispose
end
