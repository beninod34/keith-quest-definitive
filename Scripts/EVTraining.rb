#===============================================================================
# Lets the player manually set a Pokémon's EVs from an event's "Call Script".
# Usage:
#   pbEVEditor            # player picks a Pokémon from their party
#   pbEVEditor(pkmn)       # edit a specific Pokemon object directly
#===============================================================================
def pbEVEditor(pkmn = nil)
  if !pkmn
    chosen = -1
    pbFadeOutIn do
      scene = PokemonParty_Scene.new
      screen = PokemonPartyScreen.new(scene, $player.party)
      screen.pbStartScene(_INTL("Set EVs for which Pokémon?"), false)
      chosen = screen.pbChoosePokemon
      screen.pbEndScene
    end
    return if chosen < 0
    pkmn = $player.party[chosen]
  end
  # Reset all EVs to 0 before letting the player redistribute them
  GameData::Stat.each_main { |s| pkmn.ev[s.id] = 0 }
  GameData::Stat.each_main do |stat|
    spent = 0
    GameData::Stat.each_main { |s| spent += pkmn.ev[s.id] if s.id != stat.id }
    maxForStat = [Pokemon::EV_LIMIT - spent, Pokemon::EV_STAT_LIMIT].min
    params = ChooseNumberParams.new
    params.setRange(0, maxForStat)
    params.setDefaultValue(0)
    params.setCancelValue(0)
    value = pbMessageChooseNumber(
      _INTL("Set {1}'s {2} EVs (0-{3}).", pkmn.name, stat.name, maxForStat), params
    )
    pkmn.ev[stat.id] = value
  end
  pkmn.calc_stats
  pbMessage(_INTL("{1}'s EVs were updated!", pkmn.name))
end
