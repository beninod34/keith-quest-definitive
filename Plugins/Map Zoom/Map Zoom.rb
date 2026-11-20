class ZoomMap
  attr_accessor :goal
  attr_accessor :speed
  attr_accessor :zoom

  def initialize(goal,speed,zoom="in")
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    # Just below the z 99999 overlays (messages, map name, Advanced Map
    # Transfers fades) so those draw on top of the zoomed map.
    @viewport.z = 99990
    self.goal = goal
    self.speed = speed
    self.zoom = zoom.downcase
    @sprites = {}
    @sprites["map"] = Sprite.new(@viewport)
    @sprites["map"].bitmap =  Graphics.snap_to_bitmap
    @sprites["map"].center_origins
    @sprites["map"].x = Graphics.width/2
    @sprites["map"].y = Graphics.height/2
    Graphics.update
  end
 
 
  def update
    if @sprites
      @sprites["map"].bitmap.clear
      messagewindow = $game_temp.message_window
      cmdwindow = $game_temp.cmd_window
      pausemenu = $game_temp.pause_menu_scene
      messagewindow.visible = false if messagewindow
      cmdwindow.visible = false if cmdwindow
      pausemenu.pbHideMenu if pausemenu
      overlays = pbZoomOverlays
      overlays.each { |vp| vp.visible = false }
      @sprites["map"].bitmap =  Graphics.snap_to_bitmap
      overlays.each { |vp| vp.visible = true }
      @sprites["map"].center_origins
      @sprites["map"].x = Graphics.width/2
      @sprites["map"].y = Graphics.height/2
      messagewindow.visible = true if messagewindow
      cmdwindow.visible = true if cmdwindow
      pausemenu.pbShowMenu if pausemenu
      case self.zoom
        when "in"
          if @sprites["map"].zoom < self.goal
            altspeed = self.goal - @sprites["map"].zoom
            @sprites["map"].zoom+=[self.speed,altspeed].min
          end
        when "out"
          if @sprites["map"].zoom > @goal
            altspeed = @sprites["map"].zoom - self.goal
            @sprites["map"].zoom-=[self.speed,altspeed].min
          end
        end
    else
      dispose
    end
  end
 
 
  def dispose
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end

  # Skips the animation: sets the zoom straight to the goal and re-snaps.
  def jump_to_goal
    @sprites["map"].zoom = self.goal
    update
  end

  attr_accessor :auto   # true if this zoom was created from MapZoomConfig::MAPS
end


#===============================================================================
# Maps that start already zoomed in (no animation, applied before the screen
# fades in). Format: map_id => zoom level. Remove any autorun zoom event from
# these maps.
#===============================================================================
module MapZoomConfig
  MAPS = {
    82 => 2.0,
  }
end


# Overlay viewports (screen transitions, etc.) that the zoom should NOT capture.
# They're hidden while the zoom takes its screenshot, so they stay unzoomed.
# Give them a z above 99990 so they draw on top of the zoomed map.
def pbZoomOverlays
  $game_temp.zoom_overlays ||= []
  $game_temp.zoom_overlays.reject! { |vp| vp.disposed? }
  return $game_temp.zoom_overlays
end

def pbAddZoomOverlay(viewport)
  pbZoomOverlays.push(viewport) if !pbZoomOverlays.include?(viewport)
end

def pbRemoveZoomOverlay(viewport)
  pbZoomOverlays.delete(viewport)
end


# Pass instant = true to jump straight to the goal with no animation.
def pbZoomMap(goal,speed,zoom="in",instant=false)
  if !$game_temp.background_zoom
    $game_temp.background_zoom = ZoomMap.new(goal,speed,zoom)
  else
    $game_temp.background_zoom.goal = goal
    $game_temp.background_zoom.speed = speed
    $game_temp.background_zoom.zoom = zoom
  end
  $game_temp.background_zoom.jump_to_goal if instant
end


# Applies (or clears) the per-map zoom. Called right after the map's sprites
# are built, which happens before the transfer's fade-in transition.
def pbApplyMapZoomConfig
  return if !$game_map
  goal = MapZoomConfig::MAPS[$game_map.map_id]
  current = $game_temp.background_zoom
  if goal
    pbZoomMap(goal, 0.1, (goal >= 1) ? "in" : "out", true)
    $game_temp.background_zoom.auto = true
  elsif current.is_a?(ZoomMap) && current.auto
    # Leaving an auto-zoomed map: drop the zoom before the new map fades in.
    current.dispose
    $game_temp.background_zoom = nil
  end
end

# Keep the map name signpost out of the zoom's snapshot so it isn't zoomed.
# It keeps its normal z 99999 (above the zoom at 99990, and still underneath
# transition fades created after it).
class LocationWindow
  alias __map_zoom_initialize initialize unless method_defined?(:__map_zoom_initialize)
  def initialize(name)
    __map_zoom_initialize(name)
    @zoom_viewport = @window.viewport
    pbAddZoomOverlay(@zoom_viewport)
  end

  alias __map_zoom_update update unless method_defined?(:__map_zoom_update)
  def update
    __map_zoom_update
    release_zoom_viewport if @window.disposed?
  end

  alias __map_zoom_dispose dispose unless method_defined?(:__map_zoom_dispose)
  def dispose
    __map_zoom_dispose
    release_zoom_viewport
  end

  def release_zoom_viewport
    return if !@zoom_viewport
    pbRemoveZoomOverlay(@zoom_viewport)
    @zoom_viewport.dispose if !@zoom_viewport.disposed?
    @zoom_viewport = nil
  end
end

class Scene_Map
  alias __map_zoom_createSpritesets createSpritesets unless method_defined?(:__map_zoom_createSpritesets)
  def createSpritesets
    __map_zoom_createSpritesets
    pbApplyMapZoomConfig
  end
end


def pbDisposeZoomMap
  if $game_temp.background_zoom
    $game_temp.background_zoom.dispose
    $game_temp.background_zoom = nil
  end
      Graphics.update
end


EventHandlers.add(:on_frame_update,:map_zoom,
  proc {
  next if !$player
  if $game_temp.background_zoom.is_a?(ZoomMap)
  $game_temp.background_zoom.update
  sprites = $game_temp.background_zoom.instance_variable_get(:@sprites)
    if $game_temp.background_zoom.goal == 1 && sprites["map"].zoom == 1
      pbDisposeZoomMap
    end
  end
  }
)


#===============================================================================
#Pause Menu Rewriting
#===============================================================================
#If you're using an alternate pause UI,
#you should probably delete this whole section.
#
#Disabled: this project uses Voltseon's Pause Menu, which already provides its
#own Scene_Map#call_menu override. Keeping this section active clobbers that
#override (last-loaded `call_menu` wins) while leaving Voltseon's
#PokemonPauseMenu#pbStartPokemonMenu override active, which calls
#@scene.update - a method the standard PokemonPauseMenu_Scene doesn't have,
#causing a NoMethodError when opening the pause menu.

#===============================================================================
#Sprite Utilities
#===============================================================================
#If you have these utilities defined elsewhere, you can delete this section.
class Sprite
  #Utility from Marin
  # Centers the sprite by setting the origin points to half the width and height
  def center_origins
    return if !self.bitmap
    self.ox = self.bitmap.width / 2
    self.oy = self.bitmap.height / 2
  end
 
  #Utility from Luka
  #-----------------------------------------------------------------------------
  #  gets zoom
  #-----------------------------------------------------------------------------
  def zoom
    return self.zoom_x
  end
  #-----------------------------------------------------------------------------
  #  sets all zoom values
  #-----------------------------------------------------------------------------
  def zoom=(val)
    self.zoom_x = val
    self.zoom_y = val
  end
 
end



#===============================================================================
#Game Temp and Message Window rewriting
#===============================================================================
#This code is to allow the ZoomMap class to hide these windows
#when taking a screenshot, so that the text won't be zoomed in.
class Game_Temp
  attr_accessor :background_zoom
  attr_accessor :zoom_overlays
  attr_accessor :message_window
  attr_accessor :cmd_window
  attr_accessor :pause_menu_scene
  attr_accessor :pause_menu_screen
 
end



def pbCreateMessageWindow(viewport=nil,skin=nil)
  $game_temp.message_window = Window_AdvancedTextPokemon.new("")
  msgwindow=$game_temp.message_window
  if !viewport
    msgwindow.z=99999
  else
    msgwindow.viewport=viewport
  end
  msgwindow.visible=true
  msgwindow.letterbyletter=true
  msgwindow.back_opacity=MessageConfig::WINDOW_OPACITY
  pbBottomLeftLines(msgwindow,2)
  $game_temp.message_window_showing=true if $game_temp
  skin=MessageConfig.pbGetSpeechFrame() if !skin
  msgwindow.setSkin(skin)
  return msgwindow
end

def pbDisposeMessageWindow(msgwindow)
  $game_temp.message_window_showing=false if $game_temp
  $game_temp.message_window.dispose if $game_temp.message_window
  msgwindow.dispose
end



def pbShowCommands(msgwindow,commands=nil,cmdIfCancel=0,defaultCmd=0)
  return 0 if !commands
  $game_temp.cmd_window = Window_CommandPokemonEx.new(commands)
  cmdwindow = $game_temp.cmd_window
  cmdwindow.z=99999
  cmdwindow.visible=true
  cmdwindow.resizeToFit(cmdwindow.commands)
  pbPositionNearMsgWindow(cmdwindow,msgwindow,:right)
  cmdwindow.index=defaultCmd
  command=0
  loop do
    Graphics.update
    Input.update
    cmdwindow.update
    msgwindow.update if msgwindow
    yield if block_given?
    if Input.trigger?(Input::BACK)
      if cmdIfCancel>0
        command=cmdIfCancel-1
        break
      elsif cmdIfCancel<0
        command=cmdIfCancel
        break
      end
    end
    if Input.trigger?(Input::USE)
      command=cmdwindow.index
      break
    end
    pbUpdateSceneMap
  end
  ret=command
  cmdwindow.dispose
  Input.update
  return ret
end

def pbShowCommandsWithHelp(msgwindow,commands,help,cmdIfCancel=0,defaultCmd=0)
  msgwin=msgwindow
  msgwin=pbCreateMessageWindow(nil) if !msgwindow
  oldlbl=msgwin.letterbyletter
  msgwin.letterbyletter=false
  if commands
    $game_temp.cmd_window = Window_CommandPokemonEx.new(commands)
    cmdwindow = $game_temp.cmd_window
    cmdwindow.z=99999
    cmdwindow.visible=true
    cmdwindow.resizeToFit(cmdwindow.commands)
    cmdwindow.height=msgwin.y if cmdwindow.height>msgwin.y
    cmdwindow.index=defaultCmd
    command=0
    msgwin.text=help[cmdwindow.index]
    msgwin.width=msgwin.width   # Necessary evil to make it use the proper margins
    loop do
      Graphics.update
      Input.update
      oldindex=cmdwindow.index
      cmdwindow.update
      if oldindex!=cmdwindow.index
        msgwin.text=help[cmdwindow.index]
      end
      msgwin.update
      yield if block_given?
      if Input.trigger?(Input::BACK)
        if cmdIfCancel>0
          command=cmdIfCancel-1
          break
        elsif cmdIfCancel<0
          command=cmdIfCancel
          break
        end
      end
      if Input.trigger?(Input::USE)
        command=cmdwindow.index
        break
      end
      pbUpdateSceneMap
    end
    ret=command
    cmdwindow.dispose
    Input.update
  end
  msgwin.letterbyletter=oldlbl
  msgwin.dispose if !msgwindow
  return ret
end