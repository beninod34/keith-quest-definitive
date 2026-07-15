#===============================================================================
#                 B2W2 Trainer Card by KleinStudio
#
#      Modified By LackDeJurane/CharizardThree3 for Essentials v18
#
#    If used, much of the credit goes to KleinStudio, would be kind of you 
#                            to credit me 
#===============================================================================
class Player
  attr_writer(:cardlevel)
  def cardlevel
    @cardlevel ||= 0
  end
end

#===============================================================================
# Trainer card info for leaders
#===============================================================================
LEADERINFO = [
["DAD", "Home","Dad","\"You can't leave without this\ntrusty cap.\"","Megaman Cap"],
["MOM", "Home","Mom","\"Never forget how pizza is\nsupposed to be eaten.\"","Forkless Pizza"],
["GRANDMASTER", "Fairy Vale","Barry","\"I don't know what this is\, but\nZandra thought it was funny.\"","Best Character Badge"],
["CROWNLESSKING", "Purgatorium","Luke","\"NAIDES!\"","Egg of Enlightenment"],
["SILKYSAINT", "Promethean Kiln","Lascelles","\"Not as cool as my durag, but\nit ain't bad either.\"","Drug of Greed"],
["LITESKINLEGEND", "Grand Schism","Brandon","\"I know now\, without a doubt\, that\nyou are swag!\"","Keyblade"],
["LABMONGER", "Atelier Acceleratus","Benino","\"Welcome to the Mix Masters. Now if\nonly you played FighterZ...\"","Shmoovement License"],
["PRIMORDIALEMPEROR", "Mare Insularum","Alex","\"...\"","Eldritch Horrors"],
]

BADGE_NAMES=[
"Megaman Cap",
"Forkless Pizza",
"Best Character Badge",
"Egg of Enlightenment",
"Drug of Greed",
"Keyblade",
"Shmoovement License",
"Eldritch Horrors"
]
#===============================================================================
#
#Utilities and Methods by Klein and Luka S.J
#
#===============================================================================
class Sprite
  def pos(x2,y2)
    self.x=x2
    self.y=y2
  end
end

def globalIconAnim(sprite, buttom=nil)
  sprite.tone.red+=80
  sprite.tone.green+=80
  sprite.tone.blue+=80
  2.times do
    Graphics.update
    Input.update
  end
  sprite.tone.red-=80
  sprite.tone.green-=80
  sprite.tone.blue-=80
end

def pbCardLevelIncrease
  $player.cardlevel+=1
end

def pbCardLevelDecrease
  $player.cardlevel-=1 if $player.cardlevel!=0
end

def pbPositionPokemonSprite(sprite,left,top)
  if sprite.bitmap && !sprite.bitmap.disposed?
    sprite.x=left+(128-sprite.bitmap.width)/2
    sprite.y=top+(128-sprite.bitmap.height)/2
  else
    sprite.x=left
    sprite.y=top
  end
end

class PokemonSpriteBW
  attr_accessor :selected
  attr_accessor :shadow
  attr_accessor :sprite
  attr_accessor :src_rect
  attr_accessor :showshadow
  attr_accessor :status
  attr_reader :loaded

  def initialize(viewport=nil)
    @viewport=viewport
    @selected=0
    
    @status=0
    @loaded=false
    @showshadow=true
    @altitude=0
    @yposition=0
    @sprite=Sprite.new(@viewport)
    @overlay=Sprite.new(@viewport)
    @lock=false
  end
  
  def x; @sprite.x; end
  def y; @sprite.y; end
  def z; @sprite.z; end
  def ox; @sprite.ox; end
  def oy; @sprite.oy; end
  def ox=(val);;end
  def oy=(val);;end
  def zoom_x; @sprite.zoom_x; end
  def zoom_y; @sprite.zoom_y; end
  def visible; @sprite.visible; end
  def opacity; @sprite.opacity; end
  def width; @bitmap.width; end
  def height; @bitmap.height; end
  def tone; @sprite.tone; end
  def bitmap; @bitmap.bitmap; end
  def actualBitmap; @bitmap; end
  def disposed?; @sprite.disposed?; end
  def color; @sprite.color; end
  def src_rect; @sprite.src_rect; end
  def blend_type; @sprite.blend_type; end
  def angle; @sprite.angle; end
  def mirror; @sprite.mirror; end
  def lock
    @lock=true
  end
  def unlock
    @lock=false
  end
  def bitmap=(val)
    @bitmap.bitmap=val
  end
  def x=(val)
    @sprite.x=val
  end
  def ox=(val)
    @sprite.ox=val
  end
  def oy=(val)
    @sprite.oy=val
  end
  def y=(val)
    @sprite.y=val
  end
  def z=(val)
    @sprite.z=val
  end
  def zoom_x=(val)
    @sprite.zoom_x=val
  end
  def zoom_y=(val)
    @sprite.zoom_y=val
  end
  def visible=(val)
    @sprite.visible=val
  end
  def opacity=(val)
    @sprite.opacity=val
  end
  def tone=(val)
    @sprite.tone=val
  end
  def color=(val)
    @sprite.color=val
  end
  def blend_type=(val)
    @sprite.blend_type=val
  end
  def angle=(val)
    @sprite.angle=(val)
  end
  def mirror=(val)
    @sprite.mirror=(val)
  end
  def dispose
    @sprite.dispose
  end
    
  def setPokemonBitmap(pokemon,back=false)
    @bitmap=pbLoadPokemonBitmap(pokemon,back)
    @sprite.bitmap=@bitmap.bitmap.clone
    @sprite.ox=@bitmap.width/2
    @sprite.oy=@bitmap.height/2
    @loaded=true
  end
  
  def update
    return if @lock
    if @bitmap
      @bitmap.update
      @sprite.bitmap=@bitmap.bitmap.clone
    end
  end  
  
end

class TrainerSpriteBW 
  
  attr_accessor :selected
  attr_accessor :shadow
  attr_accessor :sprite
  attr_accessor :src_rect
  attr_accessor :showshadow
  attr_accessor :status
  attr_reader :loaded

  def initialize(x,y,viewport=nil)
    @viewport=viewport
    @selected=0
    @status=0
    @loaded=false
    @showshadow=false
    @altitude=0
    @yposition=0
    @shadow=Sprite.new(@viewport)
    @sprite=Sprite.new(@viewport)
    @sprite.x=x
    @sprite.y=y

    @overlay=Sprite.new(@viewport)
    @lock=false
  end
  
  def x; @sprite.x; end
  def y; @sprite.y; end
  def z; @sprite.z; end
  def ox; @sprite.ox; end
  def oy; @sprite.oy; end
  def ox=(val);;end
  def oy=(val);;end
  def zoom_x; @sprite.zoom_x; end
  def zoom_y; @sprite.zoom_y; end
  def visible; @sprite.visible; end
  def opacity; @sprite.opacity; end
  def width; @bitmap.width; end
  def height; @bitmap.height; end
  def tone; @sprite.tone; end
  def bitmap; @bitmap.bitmap; end
  def actualBitmap; @bitmap; end
  def disposed?; @sprite.disposed?; end
  def color; @sprite.color; end
  def src_rect; @sprite.src_rect; end
  def blend_type; @sprite.blend_type; end
  def angle; @sprite.angle; end
  def mirror; @sprite.mirror; end
  def lock
    @lock=true
  end
  def unlock
    @lock=false
  end
  def bitmap=(val)
    @bitmap.bitmap=val
  end
  
  def finished?
    return @bitmap.finished?
  end
  
  def x=(val)
    @sprite.x=val
    @shadow.x=val
  end
  def ox=(val)
    @sprite.ox=val
    self.formatShadow
  end
  def oy=(val)
    @sprite.oy=val
    self.formatShadow
  end
  def y=(val)
    @sprite.y=val
    @shadow.y=val
  end
  def z=(val)
    @shadow.z=10
    @sprite.z=val
  end
  def zoom_x=(val)
    @sprite.zoom_x=val
    self.formatShadow
  end
  def zoom_y=(val)
    @sprite.zoom_y=val
    self.formatShadow
  end
  def visible=(val)
    @sprite.visible=val
    self.formatShadow
  end
  def opacity=(val)
    @sprite.opacity=val
    self.formatShadow
  end
  def tone=(val)
    @sprite.tone=val
    self.formatShadow
  end
  def color=(val)
    @sprite.color=val
    self.formatShadow
  end
  def blend_type=(val)
    @sprite.blend_type=val
    self.formatShadow
  end
  def angle=(val)
    @sprite.angle=(val)
    self.formatShadow
  end
  def mirror=(val)
    @sprite.mirror=(val)
    self.formatShadow
  end
  def dispose
    @sprite.dispose
    @shadow.dispose
  end
  
  def totalFrames; @bitmap.animationFrames; end
  def toLastFrame; @bitmap.toFrame("last"); end
  def selected; end
    
  def setBitmap(file)
    @bitmap=AnimatedBitmapWrapperLast.new(file)
    @sprite.bitmap=@bitmap.bitmap.clone
    @shadow.bitmap=@bitmap.bitmap.clone
    self.formatShadow
  end
  
  def formatShadow
    @shadow.zoom_x=@sprite.zoom_x*1.1-(0.011*@altitude)
    @shadow.zoom_y=@sprite.zoom_y*0.32-(0.0032*@altitude)
    @shadow.ox=@sprite.ox-4
    @shadow.oy=@sprite.oy-@altitude
    @shadow.opacity=@sprite.opacity*0.3
    @shadow.angle=@sprite.angle-6
    @shadow.tone=Tone.new(-255,-255,-255,255)
    @shadow.visible=@sprite.visible
    @shadow.mirror=@sprite.mirror
    
    @shadow.visible=false if !@showshadow
  end
  
  def update
    return if @lock
    if @bitmap
      @bitmap.update
      @sprite.bitmap=@bitmap.bitmap.clone
      @shadow.bitmap=@bitmap.bitmap.clone
    end
    self.formatShadow
  end  
end


class AnimatedBitmapWrapperAnim
  attr_reader :width
  attr_reader :height
  attr_reader :totalFrames
  attr_reader :animationFrames
  attr_reader :currentIndex
  attr_reader :scale
  
  def initialize(file,twoframe=false)
    raise "filename is nil" if file==nil
    @scale = 1
    @width = 0
    @height = 0
    @frame = 0
    @frames = 2
    @direction = +1
    @twoframe = twoframe
    @animationFinish = false
    @totalFrames = 0
    @currentIndex = 0
    @speed = 1
    @finished=false
    @middle=false
      # 0 - not moving at all
      # 1 - normal speed
      # 2 - medium speed
      # 3 - slow speed
    @bitmapFile=RPG::Cache.load_bitmap("",file)
      # initializes full Pokemon bitmap
    @bitmap=Bitmap.new(@bitmapFile.width,@bitmapFile.height)
    @bitmap.blt(0,0,@bitmapFile,Rect.new(0,0,@bitmapFile.width,@bitmapFile.height))
    @width=@bitmap.height*@scale
    @height=@bitmap.height*@scale
    
    @totalFrames=@bitmap.width/@bitmap.height
    @animationFrames=@totalFrames*@frames
      # calculates total number of frames
    @loop_points=[0,@totalFrames]
      # first value is start, second is end
    
    @actualBitmap=Bitmap.new(@width,@height)
    @actualBitmap.clear
    @actualBitmap.stretch_blt(Rect.new(0,0,@width,@height),@bitmap,Rect.new(@currentIndex*(@width/@scale),0,@width/@scale,@height/@scale))
    
    end
    
  def length; @totalFrames; end
  def disposed?; @actualBitmap.disposed?; end
  def dispose; @actualBitmap.dispose; end
  def copy; @actualBitmap.clone; end
  def bitmap; @actualBitmap; end
  def bitmap=(val); @actualBitmap=val; end
  def each; end
  def alterBitmap(index); return @strip[index]; end
    
  def prepareStrip
    @strip=[]
    for i in 0...@totalFrames
      bitmap=Bitmap.new(@width,@height)
      bitmap.stretch_blt(Rect.new(0,0,@width,@height),@bitmapFile,Rect.new((@width/@scale)*i,0,@width/@scale,@height/@scale))
      @strip.push(bitmap)
    end
  end
  def compileStrip
    @bitmap.clear
    for i in 0...@strip.length
      @bitmap.stretch_blt(Rect.new((@width/@scale)*i,0,@width/@scale,@height/@scale),@strip[i],Rect.new(0,0,@width,@height))
    end
  end
  
  def reverse
    if @direction  >  0
      @direction=-1
    elsif @direction < 0
      @direction=+1
    end
  end
  
  def setLoop(start, finish)
    @loop_points=[start,finish]
  end
  
  def setSpeed(value)
    @speed=value
  end
  
  def update
    return false if @speed < 1
    case @speed
    # frame skip
    when 1
      @frames=2
    when 2
      @frames=4
    when 3
      @frames=5
    end
    @frame+=1
    
    if @frame >=@frames
      # processes animation speed
      if @currentIndex < @totalFrames
      @currentIndex+=@direction 
      end
      @frame=0
    end
    
    @currentIndex=@totalFrames if @currentIndex > @totalFrames
    @finished=true if @currentIndex==@totalFrames
    @middle=true if @currentIndex==@totalFrames/2
    
    @actualBitmap.clear
    @actualBitmap.stretch_blt(Rect.new(0,0,@width,@height),@bitmap,Rect.new(@currentIndex*(@width/@scale),0,@width/@scale,@height/@scale))
      # updates the actual bitmap
    end
    
    def finished?
      return @finished
    end
    
    def middle?
      return @middle
    end
    
  # returns bitmap to original state
  def deanimate
    @frame=0
    @currentIndex=0
    @actualBitmap.clear
    @actualBitmap.stretch_blt(Rect.new(0,0,@width,@height),@bitmap,Rect.new(@currentIndex*(@width/@scale),0,@width/@scale,@height/@scale))
  end
end

class AnimatedBitmapWrapperLast < AnimatedBitmapWrapperAnim
    def update
    return false if @speed < 1
    case @speed
        # frame skip
      when 1
        @frames=2
      when 2
        @frames=4
      when 3
        @frames=5
    end
    @frame+=1
    
    if @frame >=@frames
      # processes animation speed
      if @currentIndex < @totalFrames-1
      @currentIndex+=@direction 
      end
      @frame=0
    end
    
    @currentIndex=@totalFrames-1 if @currentIndex > @totalFrames-1
    @finished=true if @currentIndex==@totalFrames-1
    
    @actualBitmap.clear
    @actualBitmap.stretch_blt(Rect.new(0,0,@width,@height),@bitmap,Rect.new(@currentIndex*(@width/@scale),0,@width/@scale,@height/@scale))
      # updates the actual bitmap
    end
  end  
  
  
def pbCreateAnimatedPicture(species,x,y)
  $pokeani=PokemonSpriteDex.new(@viewport)
  $pokeani.loadPokemonBitmap(species)
  $pokeani.opacity=0
  $pokeani.z=99999
  $pokeani.x=x
  $pokeani.y=y
  $pokeani.ox=$pokeani.sprite.bitmap.width/2
  $pokeani.oy=$pokeani.sprite.bitmap.height/2
end

def pbShowPokemon(species,x,y,cry=true)
  pbCreateAnimatedPicture(species,x,y)
  10.times do 
    Graphics.update
    Input.update
    $pokeani.update
    $pokeani.opacity+=25.5
  end
  pbPlayCry(species) if cry
end

def pbDisposePokemon
  return if !$pokeani
  10.times do 
    Graphics.update
    Input.update
    $pokeani.update
    $pokeani.opacity-=25.5
  end
  $pokeani.dispose
end

def pbUpdatePokemonInMap
  $pokeani.update if $pokeani && !$pokeani.disposed?
end

class GifAnim
  attr_accessor :selected
  attr_accessor :shadow
  attr_accessor :sprite
  attr_accessor :src_rect
  attr_accessor :showshadow
  attr_accessor :status
  attr_reader :loaded

  def initialize(x,y,viewport=nil,repeat=false)
    @viewport=viewport
    @selected=0
    @status=0
    @loaded=false
    @repeat=repeat
    @showshadow=false
    @altitude=0
    @yposition=0
    @sprite=Sprite.new(@viewport)
    @sprite.x=x
    @sprite.y=y

    @overlay=Sprite.new(@viewport)
    @lock=false
  end
  
  def x; @sprite.x; end
  def y; @sprite.y; end
  def z; @sprite.z; end
  def ox; @sprite.ox; end
  def oy; @sprite.oy; end
  def ox=(val);;end
  def oy=(val);;end
  def zoom_x; @sprite.zoom_x; end
  def zoom_y; @sprite.zoom_y; end
  def visible; @sprite.visible; end
  def opacity; @sprite.opacity; end
  def width; @bitmap.width; end
  def height; @bitmap.height; end
  def tone; @sprite.tone; end
  def bitmap; @bitmap.bitmap; end
  def actualBitmap; @bitmap; end
  def disposed?; @sprite.disposed?; end
  def color; @sprite.color; end
  def src_rect; @sprite.src_rect; end
  def blend_type; @sprite.blend_type; end
  def angle; @sprite.angle; end
  def mirror; @sprite.mirror; end
  def lock
    @lock=true
  end
  def unlock
    @lock=false
  end
  def bitmap=(val)
    @bitmap.bitmap=val
  end
  
  def finished?
    return @bitmap.finished?
  end
  
  def middle?
    return @bitmap.middle?
  end
  
  def x=(val)
    @sprite.x=val
  end
  def ox=(val)
    @sprite.ox=val
  end
  def oy=(val)
    @sprite.oy=val
  end
  def y=(val)
    @sprite.y=val
  end
  def zoom_x=(val)
    @sprite.zoom_x=val
  end
  def zoom_y=(val)
    @sprite.zoom_y=val
  end
  def visible=(val)
    @sprite.visible=val
  end
  def opacity=(val)
    @sprite.opacity=val
  end
  def tone=(val)
    @sprite.tone=val
  end
  def color=(val)
    @sprite.color=val
  end
  def blend_type=(val)
    @sprite.blend_type=val
  end
  def angle=(val)
    @sprite.angle=(val)
  end
  def mirror=(val)
    @sprite.mirror=(val)
  end
  def dispose
    @sprite.dispose
  end
  def z=(val)
    @sprite.z=val
  end
  
  def totalFrames; @bitmap.animationFrames; end
  def toLastFrame; @bitmap.toFrame("last"); end
  def selected; end
    
  def setBitmap(file)
    if !@repeat
    @bitmap=AnimatedBitmapWrapperAnim.new(file)
    @sprite.ox=@bitmap.width/2
    @sprite.oy=@bitmap.height/2
    else
    @bitmap=AnimatedBitmapWrapper.new(file)
    @bitmap.setSpeed(2)
    @sprite.oy=@bitmap.height/2
    end
    @sprite.bitmap=@bitmap.bitmap.clone
  end
  
  
  def update
    return if @lock
    if @bitmap
      @bitmap.update
      @sprite.bitmap=@bitmap.bitmap.clone
    end
  end  
end

#===============================================================================
# 
# Starts here
# 
#===============================================================================

class PokemonTrainerCard_Scene
  def update
    pbUpdateSpriteHash(@sprites)
    @sprites["bg"].x-=1.4
    @sprites["bg"].y-=1.4
    @sprites["bg"].x=0 if @sprites["bg"].x<=-64
    @sprites["bg"].y=0 if @sprites["bg"].y<=-64
  end

  def pbStartScene
    @sprites={}
    @viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z=99999
    @scene=0
    @selectedleader = 0
    @showleader=false
    
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","trainercardbg")

    @sprites["card"]=IconSprite.new(8,0,@viewport)
    @sprites["card"].setBitmap("Graphics/UI/TrainerCard/trainercard0")
    @sprites["card"].visible=true
    @sprites["darkbg"] = Sprite.new(@viewport)
    @sprites["darkbg"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","Darkbg")
    @sprites["darkbg"].visible = false
    @sprites["trainer"]=Sprite.new(@viewport)
    @sprites["trainer"].x=336
    @sprites["trainer"].y=42
    @sprites["trainer"].bitmap=RPG::Cache.load_bitmap("Graphics/Trainers/","KEITH")
    @sprites["trainer"].zoom_x=1.0; @sprites["trainer"].zoom_y=1.0
    @totalframe=@sprites["trainer"].bitmap.width/@sprites["trainer"].bitmap.height
  
    realwidth=@sprites["trainer"].bitmap.width/@totalframe
    
    @sprites["trainer"].src_rect.set((@totalframe-1)*realwidth, 0,
    realwidth,@sprites["trainer"].bitmap.height)
    
    @sprites["trainer"].z=2
    @sprites["trainer"].visible=true
    
    @sprites["bgbadge"] = Sprite.new(@viewport)
    @sprites["bgbadge"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","trainerbadges")
    @sprites["bgbadge"].y=0
    @sprites["bgbadge"].visible=false
    
    @sprites["blackleader"] = Sprite.new(@viewport)
    @sprites["blackleader"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","leaderfaces")
    @sprites["blackleader"].y=26
    @sprites["blackleader"].src_rect.set(0,150,512,150)
    @sprites["blackleader"].visible=false

    @sprites["overlayfaces"]=BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    @sprites["overlayfaces"].visible=false

    @sprites["gyminfo"] = Sprite.new(@viewport)
    @sprites["gyminfo"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","trainercardgyminfo")
    @sprites["gyminfo"].y=160
    @sprites["gyminfo"].visible=false

    @sprites["normalbar"]=IconSprite.new(0,Graphics.height-48,@viewport)#
    @sprites["normalbar"].setBitmap("Graphics/UI/TrainerCard/normalbar")
    @sprites["cancelbuttom"]=Sprite.new(@viewport)
    @sprites["cancelbuttom"].bitmap= RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","globalicons")
    @sprites["cancelbuttom"].x=460; @sprites["cancelbuttom"].y=Graphics.height-74
    @sprites["cancelbuttom"].src_rect.set(0, 0, 64, 64) 
    @sprites["badgeicon"] = Sprite.new(@viewport)
    @sprites["badgeicon"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","trainercardicons")
    @sprites["badgeicon"].x = 8
    @sprites["badgeicon"].y = 316
    @sprites["badgeicon"].src_rect.set(0,64,64,64)  
    
    @sprites["leadersprite"] = TrainerSpriteBW.new(380+30,270,@viewport)
    trainerfile=sprintf("Graphics/Trainers/%s",LEADERINFO[0][0])
    @sprites["leadersprite"].setBitmap(trainerfile)
    @sprites["leadersprite"].visible=false
    @sprites["badgeinfo"] = Sprite.new(@viewport)
    @sprites["badgeinfo"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","badges")
    @sprites["badgeinfo"].x=300; @sprites["badgeinfo"].y=172
    @sprites["badgeinfo"].src_rect.set(0,0,64,147)  
    @sprites["badgeinfo"].zoom_x=0.5;@sprites["badgeinfo"].zoom_y=0.5
    @sprites["badgeinfo"].visible=false


    @sprites["overlay"]=BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    @sprites["overlayleader"]=BitmapSprite.new(Graphics.width,Graphics.height,@viewport)

    @sprites["blacktran"] = Sprite.new(@viewport)
    @sprites["blacktran"].bitmap = RPG::Cache.load_bitmap("Graphics/Battle animations/","black_screen")
    @sprites["blacktran"].zoom_y=2.5
    @sprites["blacktran"].y=Graphics.height
    @sprites["blacktran"].z=999999
   
    pbSetSystemFont(@sprites["overlay"].bitmap)
    pbSetSystemFont(@sprites["overlayleader"].bitmap)
    pbSetSystemFont(@sprites["overlayfaces"].bitmap)

    pbDrawTrainerCardFront
    pbFadeInAndShow(@sprites) { update }
  end
  
  def moveUpEffect
   loop do
     Graphics.update
     update
     @sprites["blacktran"].y-=46
     @sprites["blacktran"].y=0 if @sprites["blacktran"].y<0
     break if @sprites["blacktran"].y==0
   end
  end

  def moveDownEffect
   loop do
     Graphics.update
     update
     @sprites["blacktran"].y+=46
     @sprites["blacktran"].y=Graphics.height if @sprites["blacktran"].y>Graphics.height
     break if @sprites["blacktran"].y==Graphics.height
   end
  end
 
  def effectBadges
   10.times do
     Graphics.update
     update
     @sprites["blacktran"].opacity-=255/10
   end
  end
 
  def effectFront
   10.times do
     Graphics.update
     update
     @sprites["blacktran"].opacity+=255/10
   end
 end
 
  def pbDrawTrainerCardFront
    @scene=0
    pbClearLeaderInfo
    @sprites["bg"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/","trainercardbg")
    @sprites["bgbadge"].visible=false
    @sprites["card"].visible=true
    @sprites["trainer"].visible=true
    @sprites["badgeicon"].src_rect.set(0,64,64,64)  
    @sprites["cancelbuttom"].src_rect.set(0, 0, 64, 64) 
    @sprites["blackleader"].visible=false
    @sprites["overlayfaces"].visible=false
    overlay=@sprites["overlay"].bitmap
    overlay.clear
    totalsec = Graphics.frame_count / Graphics.frame_rate
    hour = totalsec / 60 / 60
    min = totalsec / 60 % 60
    time=_ISPRINTF("{1:02d}:{2:02d}",hour,min)
    $PokemonGlobal.startTime=pbGetTimeNow if !$PokemonGlobal.startTime
    starttime=_ISPRINTF("{1:s} {2:d}, {3:d}",
       pbGetAbbrevMonthName($PokemonGlobal.startTime.mon),
       $PokemonGlobal.startTime.day,
       $PokemonGlobal.startTime.year)
    pubid=sprintf("%05d",$player.public_ID)
    baseColor=Color.new(255,255,255)
    shadowColor=Color.new(181,189,206)
    plus=396
    textPositions=[
       [_INTL("NAME"),48,64,0,baseColor,shadowColor],
       [_INTL("{1}",$player.name),303,64,1,baseColor,shadowColor],
       [_INTL("ID No."),48,96,0,baseColor,shadowColor],
       [_INTL("{1}",pubid),303,96,1,baseColor,shadowColor],
       [_INTL("MONEY"),48,128,0,baseColor,shadowColor],
       [_INTL("${1}",$player.money),303,128,1,baseColor,shadowColor],
       [_INTL("Time"),48,242,0,baseColor,shadowColor],
       [time,464,242,1,baseColor,shadowColor],
       [_INTL("Started"),48,272,0,baseColor,shadowColor],
       [starttime,464,272,1,baseColor,shadowColor]
    ]
    if $player.has_pokedex
    textPositions.push([_INTL("Pokédex"),48,208,0,baseColor,shadowColor])
    textPositions.push([_ISPRINTF("{1:d}",$player.pokedex.owned_count),
    464,212,1,baseColor,shadowColor])
    end
    pbDrawTextPositions(overlay,textPositions)
  end
  
  def pbDrawTrainerCardBadges
    @scene=1
    pbClearLeaderInfo
    @sprites["bg"].bitmap = RPG::Cache.load_bitmap("Graphics/UI/TrainerCard/", "trainercardbg2")
    @sprites["bgbadge"].visible=true
    @sprites["card"].visible=false
    @sprites["trainer"].visible=false
    @sprites["badgeicon"].src_rect.set(0, 0, 64, 64)  
    @sprites["cancelbuttom"].src_rect.set(0, 0, 64, 64) 
    @sprites["blackleader"].visible=true
    @sprites["overlayfaces"].visible=true

    overlay=@sprites["overlay"].bitmap
    overlay.clear
    
    totalsec = Graphics.frame_count / Graphics.frame_rate
    hour = totalsec / 60 / 60
    min = totalsec / 60 % 60
    time=_ISPRINTF("{1:02d}:{2:02d}",hour,min)
    $PokemonGlobal.startTime=pbGetTimeNow if !$PokemonGlobal.startTime
    starttime=_ISPRINTF("{1:s} {2:d}, {3:d}",
       pbGetAbbrevMonthName($PokemonGlobal.startTime.mon),
       $PokemonGlobal.startTime.day,
       $PokemonGlobal.startTime.year)
    pubid=sprintf("%05d",$player.public_ID)
    baseColor=Color.new(255,255,255)
    shadowColor=Color.new(181,189,206)

    x=0
    x2=0
    imagePositions=[]
    leaderPositions=[]
    for i in 0...8
      if $player.badges[i]
        imagePositions.push(["Graphics/UI/TrainerCard/badges",x,180,i*65,0,64,147])
        leaderPositions.push(["Graphics/UI/TrainerCard/leaderfaces",x2,26,i*64,0,64,150])
      end
      x2+=64
      x+=65
    end

    pbDrawImagePositions(@sprites["overlayfaces"].bitmap,leaderPositions)
    pbDrawImagePositions(overlay,imagePositions)
    
    cursorX = @selectedleader * 64
    overlay.fill_rect(cursorX, 26, 64, 150, Color.new(255, 255, 0, 80))
    overlay.fill_rect(cursorX, 26, 64, 2,   Color.new(255, 255, 0, 220))
    overlay.fill_rect(cursorX, 174, 64, 2,  Color.new(255, 255, 0, 220))
    overlay.fill_rect(cursorX, 26, 2, 150,  Color.new(255, 255, 0, 220))
    overlay.fill_rect(cursorX + 62, 26, 2, 150, Color.new(255, 255, 0, 220))

  end


def pbShowLeaderInfo(leaders)
  @showleader=true
  leader=leaders.to_i
  @sprites["darkbg"].visible = true 
  @sprites["cancelbuttom"].src_rect.set(0, 64, 64, 64) 
  @sprites["overlay"].bitmap.clear
  @sprites["overlayleader"].bitmap.clear
  @sprites["leadersprite"].visible=false
  @sprites["badgeinfo"].visible=false
  if $player.badges[leaders]
    trainerfile=sprintf("Graphics/Trainers/%s",LEADERINFO[leader][0])
    @sprites["leadersprite"].setBitmap(trainerfile)
    @sprites["leadersprite"].visible=true
    pbPositionPokemonSprite(@sprites["leadersprite"],380,180)
    @sprites["badgeinfo"].src_rect.set(leader*64,0,64,147)  
    @sprites["badgeinfo"].visible=true
  end
  @sprites["gyminfo"].visible=true
  baseColor=Color.new(255,255,255)
  shadowColor=Color.new(181,189,206)
  leaderinfo=_INTL("{1} Leader\n",LEADERINFO[leader][1])
  leaderinfo+=_INTL("{1}\n",LEADERINFO[leader][2])
  phrase=_INTL("{1}",LEADERINFO[leader][3])
  badgename=_INTL("{1}",LEADERINFO[leader][4])

  drawTextEx(@sprites["overlayleader"].bitmap,16,178,Graphics.width-(42*2),5,leaderinfo,baseColor,shadowColor)
  drawTextEx(@sprites["overlayleader"].bitmap,16,258,Graphics.width-(42*2),5,phrase,baseColor,shadowColor)
  drawTextEx(@sprites["overlayleader"].bitmap,206,348,Graphics.width-(42*2),5,badgename,baseColor,shadowColor)
end

def pbClearLeaderInfo
  @showleader=false
  @sprites["darkbg"].visible = false 
  @sprites["overlay"].bitmap.clear
  @sprites["overlayleader"].bitmap.clear
  @sprites["leadersprite"].visible=false
  @sprites["gyminfo"].visible=false
  @sprites["badgeinfo"].visible=false
  @sprites["cancelbuttom"].src_rect.set(0, 0, 64, 64) 
end

  def pbTrainerCard
    loop do
      Graphics.update
      Input.update
      self.update
      
      if @scene == 1 && !@showleader
        if Input.trigger?(Input::LEFT)
          @selectedleader = (@selectedleader - 1) % 8
          pbDrawTrainerCardBadges
        elsif Input.trigger?(Input::RIGHT)
          @selectedleader = (@selectedleader + 1) % 8
          pbDrawTrainerCardBadges
        elsif Input.trigger?(Input::C)   # A / confirm button
          pbShowLeaderInfo(@selectedleader)
        end
      end
      
      if Input.trigger?(Input::A)
        if @scene == 0
          pbSEPlay("GUI sel decision")
          globalIconAnim(@sprites["badgeicon"])
          moveUpEffect
          pbDrawTrainerCardBadges
          effectBadges
        else
          pbSEPlay("GUI sel decision")
          globalIconAnim(@sprites["badgeicon"])
          effectFront
          pbDrawTrainerCardFront
          moveDownEffect
        end
      end

      if Input.trigger?(Input::B)
        if !@showleader
        globalIconAnim(@sprites["cancelbuttom"],0)
        pbSEPlay("GUI sel cancel")
        break
      else
        globalIconAnim(@sprites["cancelbuttom"],1)
        pbClearLeaderInfo
        pbDrawTrainerCardBadges
        end
      end
    end
  end

  def pbEndScene
    pbFadeOutAndHide(@sprites) { update }
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end



class PokemonTrainerCard
  def initialize(scene)
    @scene=scene
  end

  def pbStartScreen
    @scene.pbStartScene
    @scene.pbTrainerCard
    @scene.pbEndScene
  end
end