#===============================================================================
# Mega Stone hint system - GarchompiteZ, Golurkite, Malamarite, Excadrite
#===============================================================================
MEGA_HINT_CHARGES_VAR   = 30   # TODO: set to your actual Variable ID
MEGA_HINT_SW_GARCHOMPITEZ = 106 # TODO: set to your actual Switch ID
MEGA_HINT_SW_GOLURKITE    = 107 # TODO: set to your actual Switch ID
MEGA_HINT_SW_MALAMARITE   = 108 # TODO: set to your actual Switch ID
MEGA_HINT_SW_EXCADRITE    = 109 # TODO: set to your actual Switch ID

# Call this from the hint-giver NPC's event (Script... command: pbMegaStoneHintNPC)
def pbMegaStoneHintNPC
  commands = []
  hintKeys = []
  if !$game_switches[MEGA_HINT_SW_GARCHOMPITEZ]
    commands.push(_INTL("Where's Garchompite Z?"))
    hintKeys.push(:GARCHOMPITEZ)
  end
  if !$game_switches[MEGA_HINT_SW_GOLURKITE]
    commands.push(_INTL("Where's Golurkite?"))
    hintKeys.push(:GOLURKITE)
  end
  if !$game_switches[MEGA_HINT_SW_MALAMARITE]
    commands.push(_INTL("Where's Malamarite?"))
    hintKeys.push(:MALAMARITE)
  end
  if !$game_switches[MEGA_HINT_SW_EXCADRITE]
    commands.push(_INTL("Where's Excadrite?"))
    hintKeys.push(:EXCADRITE)
  end

  if commands.length == 0
    pbMessage(_INTL("Oh, I've told you everything rattling around in this head of mine! I do hope some of it was right, dear."))
    return
  end

  commands.push(_INTL("Never mind, Mom."))
  choice = pbMessage(_INTL("Now let me think, let me think... I do believe I remember something about one of those shiny stones you're after. Which one was it, sweetie?"),
                      commands, commands.length)
  return if choice >= hintKeys.length

  case hintKeys[choice]
  when :GARCHOMPITEZ
    pbMessage(_INTL("Garchompite Z? I don't know what a 'Garchompite' is but don't you have a friend named Z?"))
    $game_switches[MEGA_HINT_SW_GARCHOMPITEZ] = true
  when :GOLURKITE
    pbMessage(_INTL("Golurkite, Golurkite... hmm, that doesn't ring a bell... Oh, but I want to say I heard some strange sounds coming up from a well, but honestly it might have been a dream I had. Aren't dreams funny?"))
    $game_switches[MEGA_HINT_SW_GOLURKITE] = true
  when :MALAMARITE
    pbMessage(_INTL("Mala...what? Unless you're trying to say the italian word 'mare', I don't know what you're talking about."))
    $game_switches[MEGA_HINT_SW_MALAMARITE] = true
  when :EXCADRITE
    pbMessage(_INTL("Excadrite... goodness, let me see. The town had sent us a message saying they were using an excavator to remove a fallen tree from the storm. I hope that helps you, dear."))
    $game_switches[MEGA_HINT_SW_EXCADRITE] = true
  end
  $game_variables[MEGA_HINT_CHARGES_VAR] -= 1
end

# Call this from each boss's "on win" event (Script... command: pbGrantMegaHintCharge)
def pbGrantMegaHintCharge
  $game_variables[MEGA_HINT_CHARGES_VAR] = [$game_variables[MEGA_HINT_CHARGES_VAR] + 1, 4].min
end
