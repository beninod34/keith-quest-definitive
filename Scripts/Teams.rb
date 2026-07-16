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

def pbAddTeamBenino
  benino = NPCTrainer.new("Benino", :LABMONGER)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:AMBIPOM, 80, benino, false)
  pkmn0.gender = 1
  pkmn0.ability = :TECHNICIAN
  pkmn0.nature = :JOLLY
  pkmn0.item = :LOADEDDICE
  pkmn0.moves = [:FAKEOUT, :TAILSLAP, :AERIELACE, :TRIPLEAXEL]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn0.obtain_map = 80

  pkmn1 = Pokemon.new(:MUNKIDORI, 80, benino, false)
  pkmn1.gender = 0
  pkmn1.ability = :TOXICCHAIN
  pkmn1.nature = :TIMID
  pkmn1.item = :SHUCABERRY
  pkmn1.moves = [:SLUDGEWAVE, :PSYCHIC, :GRASSKNOT, :CONFUSERAY]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :DEFENSE => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn1.obtain_map = 80

  pkmn2 = Pokemon.new(:RILLABOOM, 80, benino, false)
  pkmn2.gender = 0
  pkmn2.ability = :GRASSYSURGE
  pkmn2.nature = :ADAMANT
  pkmn2.item = :ASSAULTVEST
  pkmn2.moves = [:GRASSYGLIDE, :EARTHQUAKE, :KNOCKOFF, :ROCKSLIDE]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :ATTACK => 132, :DEFENSE => 124 }
  pkmn2.obtain_map = 80

  pkmn3 = Pokemon.new(:DARMANITAN, 80, benino, false)
  pkmn3.gender = 0
  pkmn3.ability = :SHEERFORCE
  pkmn3.nature = :ADAMANT
  pkmn3.item = :LIFEORB
  pkmn3.moves = [:FLAREBLITZ, :BODYSLAM, :IRONHEAD, :ROCKSLIDE]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 196, :ATTACK => 56, :DEFENSE => 128, :SPECIAL_DEFENSE => 128 }
  pkmn3.obtain_map = 80

  pkmn4 = Pokemon.new(:ANNIHILAPE, 80, benino, false)
  pkmn4.gender = 0
  pkmn4.ability = :DEFIANT
  pkmn4.nature = :ADAMANT
  pkmn4.item = :LEFTOVERS
  pkmn4.moves = [:DRAINPUNCH, :RAGEFIST, :BULKUP, :THUNDERPUNCH]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 252, :ATTACK => 136, :DEFENSE => 100, :SPECIAL_DEFENSE => 20 }
  pkmn4.obtain_map = 80

  pkmn5 = Pokemon.new(:ZEKROM, 85, benino, false)
  pkmn5.ability = :SURGESURFER
  pkmn5.nature = :JOLLY
  pkmn5.item = :LUMBERRY
  pkmn5.moves = [:FUSIONBOLT, :ICEPUNCH, :OUTRAGE, :STEELWING]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn5.obtain_map = 80

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamIces
  captainIce = NPCTrainer.new("Captain Ice", :SNOWMASTER)
  noIce = NPCTrainer.new("No Ice", :HEATMASTER)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:SNOVER, 80, captainIce, false)
  pkmn0.gender = 1
  pkmn0.ability = :SNOWWARNING
  pkmn0.nature = :SASSY
  pkmn0.item = :ICYROCK
  pkmn0.moves = [:SHEERCOLD, :GIGADRAIN, :ICESHARD, :PROTECT]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 248, :ATTACK => 8, :SPECIAL_DEFENSE => 252 }
  pkmn0.obtain_map = 77

  pkmn1 = Pokemon.new(:NUMEL, 80, noIce, false)
  pkmn1.gender = 0
  pkmn1.ability = :SIMPLE
  pkmn1.nature = :CALM
  pkmn1.item = :EVIOLITE
  pkmn1.moves = [:LAVAPLUME, :STOCKPILE, :REST, :SLEEPTALK]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 252, :SPECIAL_ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn1.obtain_map = 77

  pkmn2 = Pokemon.new(:ROTOM, 80, captainIce, false)
  pkmn2.form = 3
  pkmn2.ability = :LEVITATE
  pkmn2.nature = :TIMID
  pkmn2.item = :LIGHTCLAY
  pkmn2.moves = [:BLIZZARD, :REFLECT, :LIGHTSCREEN, :THUNDERBOLT]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :DEFENSE => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn2.obtain_map = 77

  pkmn3 = Pokemon.new(:COMBUSKEN, 80, noIce, false)
  pkmn3.gender = 0
  pkmn3.ability = :SPEEDBOOST
  pkmn3.nature = :ADAMANT
  pkmn3.item = :EVIOLITE
  pkmn3.moves = [:SWORDSDANCE, :PROTECT, :FLAREBLITZ, :SKYUPPERCUT]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 77

  pkmn4 = Pokemon.new(:REGICE, 85, captainIce, false)
  pkmn4.ability = :HEATPROOF
  pkmn4.nature = :MODEST
  pkmn4.item = :NEVERMELTICE
  pkmn4.moves = [:BLIZZARD, :ROCKPOLISH, :THUNDERBOLT, :FOCUSBLAST]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :DEFENSE => 4, :SPECIAL_ATTACK => 4, :SPEED => 252 }
  pkmn4.obtain_map = 77

  pkmn5 = Pokemon.new(:REGISTEEL, 85, noIce, false)
  pkmn5.ability = :FLASHFIRE
  pkmn5.nature = :CALM
  pkmn5.item = :LEFTOVERS
  pkmn5.moves = [:SEISMICTOSS, :TOXIC, :IRONDEFENSE, :HIDDENPOWER]
  pkmn5.happiness = 255
  pkmn5.iv = { :HP => 31, :ATTACK => 0, :DEFENSE => 31, :SPECIAL_ATTACK => 30, :SPECIAL_DEFENSE => 31, :SPEED => 30 }
  pkmn5.ev = { :HP => 252, :DEFENSE => 252, :SPECIAL_ATTACK => 4 }
  pkmn5.obtain_map = 77

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)
end

def pbAddTeamBrandon
  brandon = NPCTrainer.new("Brandon", :LITESKINLEGEND)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:CLODSIRE, 80, brandon, false)
  pkmn0.gender = 1
  pkmn0.ability = :WATERABSORB
  pkmn0.nature = :IMPISH
  pkmn0.item = :ROCKYHELMET
  pkmn0.moves = [:TOXIC, :STEALTHROCK, :RECOVER, :EARTHQUAKE]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :ATTACK => 4, :DEFENSE => 252, }
  pkmn0.obtain_map = 77

  pkmn1 = Pokemon.new(:STARAPTOR, 80, brandon, false)
  pkmn1.gender = 0
  pkmn1.ability = :INTIMIDATE
  pkmn1.nature = :JOLLY
  pkmn1.item = :SITRUSBERRY
  pkmn1.moves = [:BRAVEBIRD, :CLOSECOMBAT, :ROOST, :QUICKATTACK]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 77

  pkmn2 = Pokemon.new(:SLOWBRO, 80, brandon, false)
  pkmn2.gender = 0
  pkmn2.ability = :OBLIVIOUS
  pkmn2.nature = :BOLD
  pkmn2.item = :LEFTOVERS
  pkmn2.moves = [:SCALD, :PSYCHIC, :SLACKOFF, :FLAMETHROWER]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :DEFENSE => 252, :SPECIAL_ATTACK => 4 }
  pkmn2.obtain_map = 77

  pkmn3 = Pokemon.new(:KROOKODILE, 80, brandon, false)
  pkmn3.gender = 0
  pkmn3.ability = :INTIMIDATE
  pkmn3.nature = :JOLLY
  pkmn3.item = :ASSAULTVEST
  pkmn3.moves = [:KNOCKOFF, :EARTHQUAKE, :FIREFANG, :DRAGONCLAW]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 77

  pkmn4 = Pokemon.new(:BLAZIKEN, 80, brandon, false)
  pkmn4.gender = 1
  pkmn4.ability = :SPEEDBOOST
  pkmn4.nature = :JOLLY
  pkmn4.item = :HEAVYDUTYBOOTS
  pkmn4.moves = [:FLAREBLITZ, :THUNDERPUNCH, :SWORDSDANCE, :CLOSECOMBAT]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 77

  pkmn5 = Pokemon.new(:LUGIA, 85, brandon, false)
  pkmn5.ability = :CONTRARY
  pkmn5.nature = :TIMID
  pkmn5.moves = [:DRAGONASCENT, :THUNDERBOLT, :SWORDSDANCE, :PSYCHOBOOST]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :DEFENSE => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn5.obtain_map = 77

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamLuke
  luke = NPCTrainer.new("Luke", :CROWNLESSKING)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:SAMUROTT, 80, luke, false)
  pkmn0.gender = 0
  pkmn0.form = 1
  pkmn0.ability = :SHARPNESS
  pkmn0.nature = :ADAMANT
  pkmn0.item = :BLACKGLASSES
  pkmn0.moves = [:CEASELESSEDGE, :SUCKERPUNCH, :AQUACUTTER, :SHELLSMASH]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 4, :ATTACK => 252, :SPEED => 252 }
  pkmn0.obtain_map = 79

  pkmn1 = Pokemon.new(:MASQUERAIN, 80, luke, false)
  pkmn1.gender = 1
  pkmn1.ability = :INTIMIDATE
  pkmn1.nature = :MODEST
  pkmn1.item = :FOCUSSASH
  pkmn1.moves = [:HYDROPUMP, :HURRICANE, :TAILWIND, :QUIVERDANCE]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 79

  pkmn2 = Pokemon.new(:LOKIX, 80, luke, false)
  pkmn2.gender = 0
  pkmn2.ability = :TINTEDLENS
  pkmn2.nature = :JOLLY
  pkmn2.item = :LIFEORB
  pkmn2.moves = [:FIRSTIMPRESSION, :KNOCKOFF, :UTURN, :AXEKICK]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn2.obtain_map = 79

  pkmn3 = Pokemon.new(:JELLICENT, 80, luke, false)
  pkmn3.gender = 0
  pkmn3.ability = :CURSEDBODY
  pkmn3.nature = :CALM
  pkmn3.item = :LEFTOVERS
  pkmn3.moves = [:STRENGTHSAP, :SCALD, :HEX, :WILLOWISP]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 252, :SPECIAL_ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn3.obtain_map = 79

  pkmn4 = Pokemon.new(:SCIZOR, 80, luke, false)
  pkmn4.gender = 1
  pkmn4.ability = :TECHNICIAN
  pkmn4.nature = :ADAMANT
  pkmn4.item = :SCIZORITE
  pkmn4.moves = [:BULLETPUNCH, :DUALWINGBEAT, :TRAILBLAZE, :SWORDSDANCE]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 248, :ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn4.obtain_map = 79

  pkmn5 = Pokemon.new(:RESHIRAM, 85, luke, false)
  pkmn5.ability = :DESOLATELAND
  pkmn5.nature = :MODEST
  pkmn5.item = :WEAKNESSPOLICY
  pkmn5.moves = [:BLUEFLARE, :DRACOMETEOR, :SOLARBEAM, :ROOST]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 248, :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 8 }
  pkmn5.obtain_map = 79

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end
