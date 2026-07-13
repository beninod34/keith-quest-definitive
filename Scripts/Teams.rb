def pbAddTeamKeith
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:HAXORUS, 80, $player, false)
  pkmn0.gender = 0
  pkmn0.ability = :RIVALRY
  pkmn0.nature = :JOLLY
  pkmn0.item = :LUMBERRY
  pkmn0.moves = [:DRAGONDANCE, :OUTRAGE, :FIRSTIMPRESSION, :POISONJAB]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn0.obtain_map = 32

  pkmn1 = Pokemon.new(:LEAVANNY, 80, $player, false)
  pkmn1.gender = 1
  pkmn1.ability = :SWARM
  pkmn1.nature = :JOLLY
  pkmn1.item = :FOCUSSASH
  pkmn1.moves = [:LEAFBLADE, :STICKYWEB, :AGILITY, :XSCISSOR]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 32

  pkmn2 = Pokemon.new(:GARCHOMP, 80, $player, false)
  pkmn2.gender = 0
  pkmn2.ability = :SANDVEIL
  pkmn2.nature = :JOLLY
  pkmn2.item = :BRIGHTPOWDER
  pkmn2.moves = [:SANDSTORM, :EARTHQUAKE, :STONEEDGE, :DRAGONCLAW]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn2.obtain_map = 32

  pkmn3 = Pokemon.new(:EXCADRILL, 80, $player, false)
  pkmn3.gender = 0
  pkmn3.ability = :SANDRUSH
  pkmn3.nature = :ADAMANT
  pkmn3.item = :FOCUSSASH
  pkmn3.moves = [:EARTHQUAKE, :IRONHEAD, :ROCKSLIDE, :SANDSTORM]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 32

  pkmn4 = Pokemon.new(:CROBAT, 80, $player, false)
  pkmn4.gender = 1
  pkmn4.ability = :INFILTRATOR
  pkmn4.nature = :ADAMANT
  pkmn4.item = :LEFTOVERS
  pkmn4.moves = [:DEFOG, :ROOST, :BRAVEBIRD, :UTURN]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 252, :ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn4.obtain_map = 32

  pkmn5 = Pokemon.new(:GOLURK, 80, $player, false)
  pkmn5.gender = 0
  pkmn5.ability = :NOGUARD
  pkmn5.nature = :ADAMANT
  pkmn5.item = :ASSAULTVEST
  pkmn5.moves = [:DYNAMICPUNCH, :POLTERGEIST, :DRAINPUNCH, :STONEEDGE]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 252, :ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn5.obtain_map = 32

  pbAddPokemonSilent(pkmn0)
  pbAddPokemonSilent(pkmn1)
  pbAddPokemonSilent(pkmn2)
  pbAddPokemonSilent(pkmn3)
  pbAddPokemonSilent(pkmn4)
  pbAddPokemonSilent(pkmn5)
end

def pbAddTeamDominic
  dominic = NPCTrainer.new("Dominic", :LITTLEBROTHER)

  pkmn0 = Pokemon.new(:WHISMUR, 50, dominic, false)
  pkmn0.gender = 0
  pkmn0.ability = :SOUNDPROOF
  pkmn0.item = :FIRESTONE
  pkmn0.moves = [:HYPERVOICE, :REST, :SLEEPTALK, :FAKETEARS]
  pkmn0.obtain_map = 33

  pkmn1 = Pokemon.new(:TYMPOLE, 50, dominic, false)
  pkmn1.gender = 0
  pkmn1.ability = :SWIFTSWIM
  pkmn1.item = :WATERSTONE
  pkmn1.moves = [:BOUNCE, :RAINDANCE, :BUBBLEBEAM, :EARTHPOWER]
  pkmn1.obtain_map = 33
  
  pkmn2 = Pokemon.new(:GLIGAR, 50, dominic, false)
  pkmn2.gender = 0
  pkmn2.ability = :HYPERCUTTER
  pkmn2.item = :THUNDERSTONE
  pkmn2.moves = [:STRUGGLEBUG, :STEALTHROCK, :GUILLOTINE, :TAUNT]
  pkmn2.obtain_map = 33

  pkmn3 = Pokemon.new(:CHIKORITA, 50, dominic, false)
  pkmn3.gender = 0
  pkmn3.ability = :OVERGROW
  pkmn3.item = :ICESTONE
  pkmn3.moves = [:AROMATHERAPY, :GRASSWHISTLE, :HEADBUTT, :FACADE]
  pkmn3.obtain_map = 33

  pkmn4 = Pokemon.new(:EEVEE, 50, dominic, false)
  pkmn4.gender = 0
  pkmn4.ability = :RUNAWAY
  pkmn4.item = :RAZORFANG
  pkmn4.moves = [:HOLDHANDS, :QUICKATTACK, :YAWN, :CURSE]
  pkmn4.obtain_map = 33

  pkmn5 = Pokemon.new(:ODDISH, 50, dominic, false)
  pkmn5.gender = 0
  pkmn5.ability = :CHLOROPHYLL
  pkmn5.item = :LEAFSTONE
  pkmn5.moves = [:SOLARBEAM, :FRUSTRATION, :GRASSKNOT, :NATUREPOWER]
  pkmn5.obtain_map = 33

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)
  
end
