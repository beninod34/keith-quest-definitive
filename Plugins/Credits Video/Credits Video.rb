def pbPlayCreditsVideo(fps = 20)
  folder = "Graphics/Credits/"
  frames = Dir.glob(folder + "frame_*.png").length
  viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
  viewport.z = 99999
  sprite = Sprite.new(viewport)
  pbBGMPlay("CreditsVideo")
  wait = [Graphics.frame_rate / fps, 1].max
  frames.times do |i|
    old = sprite.bitmap
    sprite.bitmap = Bitmap.new(sprintf("%sframe_%04d", folder, i + 1))
    old&.dispose
    wait.times { Graphics.update; Input.update }
    break if Input.trigger?(Input::BACK)
  end
  pbBGMFade(1.0)
  sprite.bitmap&.dispose
  sprite.dispose
  viewport.dispose
end