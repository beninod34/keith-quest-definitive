#===============================================================================
# * HGSS Style Transitions Script 
# * Made by Jonas930
# * Art Ripped by Latias Tamer
# * version: 1.5
#
# * How to make it work?
#   => Put this script above "Main" in Script Editor
#   => Put the "Transitions" folder under "Graphics/Pictures"
#
# * How to use it?
#   => In any event, add a script with "pbHGSSTransitions("place")"
#      * text is the name of your place   (e.g. "Burned Tower" or "Ruins of Alph")
#   => pbTransitions("Ruins of Alph")
#
#   => Name by default: "Burned Tower",   "Dark Cave E",    "Dark Cave S",
#                       "Dragon's Den",   "Ice Path",       "Ilex Forest",
#                       "Mt. Mortar",     "National Park",  "Ruins of Alph",
#                       "Sloepoke Well",  "Sprout Tower",   "Tin Tower",
#                       "Tohjo Falls",    "Union Cave",     "Victory Road",
#                       "Whirl Inlands",  "Cerulean Cave",  "Diglett's Cave",
#                       "Mt. Moon",       "Rock Tunnel",    "Seafoam Islands",
#                       "Viridian Forest"
#
# * How to put my own Transition Sense Picture?
#   => Under "Graphics/Pictures/Transitions", there are three different png files 
#      you will see. 
#      There are "_Day",         ===>    5  AM to 14 PM
#                "_Afternoon",   ===>    14 PM to 20 PM
#            and "_Night"        ===>    20 PM to 5  AM
#      (It depends on what you set in "PField_Time" , and the setting above is from v17.2)
#
#   => When you put your pictures into the folder, make sure you have those suffix,
#      or you will get the black screen for transition.
#
#===============================================================================
def pbHGSSTransitions(place,black=true)
    name="Day"
    pbToneChangeAll(Tone.new(-255,-255,-255),0) if black
    viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
    viewport.z=99
    blackbg=Sprite.new(viewport)
    blackbg.bitmap=Bitmap.new(Graphics.width,Graphics.height)
    blackbg.bitmap.fill_rect(0,0,Graphics.width,Graphics.height,Color.new(0,0,0))
    blackbg.z=0
    bg=Sprite.new(viewport)
    bg.z=1
    if File.exist?("Graphics/Pictures/Transitions/#{place}_#{name}.png")
      bg.bitmap=Bitmap.new("Graphics/Pictures/Transitions/#{place}_#{name}.png")
    elsif File.exist?("Graphics/Pictures/Transitions/#{place}.png")
      bg.bitmap=Bitmap.new("Graphics/Pictures/Transitions/#{place}.png")
    else
      bg.bitmap=Bitmap.new("Graphics/Pictures/Transitions/Black.png")
    end
    bg.opacity=0
    # Fade in
    20.times do
      bg.opacity+=13
      Graphics.update
      Input.update
      pbUpdateSceneMap
    end
    # Stay
    bg.opacity=255
    60.times do
      Graphics.update
      Input.update
      pbUpdateSceneMap
    end
    # Fade out
    20.times do
      bg.opacity-=13
      Graphics.update
      Input.update
      pbUpdateSceneMap
    end
    bg.dispose
    # Fade out black
    20.times do
      blackbg.opacity-=13
      Graphics.update
      Input.update
      pbUpdateSceneMap
    end
    blackbg.bitmap.dispose
    blackbg.dispose
    viewport.dispose
    Graphics.update
    Input.update
    pbUpdateSceneMap
  end
  