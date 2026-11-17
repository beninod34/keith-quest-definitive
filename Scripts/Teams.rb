def pbAddTeamKeith
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:HAXORUS, 80, $player, false)
  pkmn0.gender = 0
  pkmn0.ability = :MOLDBREAKER
  pkmn0.nature = :JOLLY
  pkmn0.item = :LUMBERRY
  pkmn0.moves = [:FIRSTIMPRESSION, :OUTRAGE, :CLOSECOMBAT, :POISONJAB]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn0.obtain_map = 32

  pkmn1 = Pokemon.new(:LEAVANNY, 80, $player, false)
  pkmn1.gender = 1
  pkmn1.ability = :SWARM
  pkmn1.nature = :JOLLY
  pkmn1.item = :FOCUSSASH
  pkmn1.moves = [:LUNGE, :LEAFBLADE, :STICKYWEB, :KNOCKOFF]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 32

  pkmn2 = Pokemon.new(:VILEPLUME, 80, $player, false)
  pkmn2.gender = 0
  pkmn2.ability = :EFFECTSPORE
  pkmn2.nature = :MODEST
  pkmn2.item = :BLACKSLUDGE
  pkmn2.moves = [:MOONBLAST, :SLUDGEWAVE, :GIGADRAIN, :STRENGTHSAP]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn2.obtain_map = 32

  pkmn3 = Pokemon.new(:CROBAT, 80, $player, false)
  pkmn3.gender = 1
  pkmn3.ability = :INFILTRATOR
  pkmn3.nature = :TIMID
  pkmn3.item = :WIDELENS
  pkmn3.moves = [:AIRSLASH, :SLUDGEBOMB, :GIGADRAIN, :HEATWAVE]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 32

  pkmn4 = Pokemon.new(:DUDUNSPARCE, 80, $player, false)
  pkmn4.gender = 0
  pkmn4.ability = :RATTLED
  pkmn4.nature = :BOLD
  pkmn4.item = :LEFTOVERS
  pkmn4.moves = [:CALMMIND, :BOOMBURST, :SHADOWBALL, :ROOST]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 252, :DEFENSE => 156, :SPEED => 100 }
  pkmn4.obtain_map = 32

  pkmn5 = Pokemon.new(:MALAMAR, 80, $player, false)
  pkmn5.ability = :CONTRARY
  pkmn5.nature = :ADAMANT
  pkmn5.item = :SITRUSBERRY
  pkmn5.moves = [:SUPERPOWER, :PSYCHOCUT, :KNOCKOFF, :LIQUIDATION]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 248, :ATTACK => 252, :SPECIAL_DEFENSE => 8 }
  pkmn5.obtain_map = 32

  # Extra Mon's
  pkmn6 = Pokemon.new(:GARCHOMP, 80, $player, false)
  pkmn6.gender = 0
  pkmn6.ability = :SANDVEIL
  pkmn6.nature = :ADAMANT
  pkmn6.item = :BRIGHTPOWDER
  pkmn6.moves = [:SANDSTORM, :DRAGONCLAW, :EARTHQUAKE, :STONEEDGE]
  pkmn6.happiness = 255
  pkmn6.iv = perfect_ivs
  pkmn6.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn6.obtain_map = 32

  pkmn7 = Pokemon.new(:EXCADRILL, 80, $player, false)
  pkmn7.gender = 0
  pkmn7.ability = :SANDRUSH
  pkmn7.nature = :JOLLY
  pkmn7.item = :AIRBALLOON
  pkmn7.moves = [:EARTHQUAKE, :IRONHEAD, :THROATCHOP, :RAPIDSPIN]
  pkmn7.happiness = 255
  pkmn7.iv = perfect_ivs
  pkmn7.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn7.obtain_map = 32

  pkmn8 = Pokemon.new(:GOLURK, 80, $player, false)
  pkmn8.ability = :IRONFIST
  pkmn8.nature = :ADAMANT
  pkmn8.item = :LEFTOVERS
  pkmn8.moves = [:DRAINPUNCH, :SHADOWPUNCH, :THUNDERPUNCH, :ICEPUNCH]
  pkmn8.happiness = 255
  pkmn8.iv = perfect_ivs
  pkmn8.ev = { :HP => 252, :ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn8.obtain_map = 32

  pbAddPokemonSilent(pkmn0)
  pbAddPokemonSilent(pkmn1)
  pbAddPokemonSilent(pkmn2)
  pbAddPokemonSilent(pkmn3)
  pbAddPokemonSilent(pkmn4)
  pbAddPokemonSilent(pkmn5)
  $PokemonStorage.pbStoreCaught(pkmn6)
  $PokemonStorage.pbStoreCaught(pkmn7)
  $PokemonStorage.pbStoreCaught(pkmn8)

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
  pkmn0.moves = [:FAKEOUT, :TAILSLAP, :AERIALACE, :TRIPLEAXEL]
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

def pbAddTeamBarry
  barry = NPCTrainer.new("Barry", :GRANDMASTER)
  yuna = NPCTrainer.new("Yuna", :GRANDMASTER)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:ESPEON, 80, barry, false)
  pkmn0.ability = :MAGICBOUNCE
  pkmn0.nature = :TIMID
  pkmn0.item = :LIGHTCLAY
  pkmn0.moves = [:LIGHTSCREEN, :REFLECT, :YAWN, :ALLURINGVOICE]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :SPECIAL_ATTACK => 4, :SPEED => 252 }
  pkmn0.obtain_map = 48

  pkmn1 = Pokemon.new(:PHEROMOSA, 80, barry, false)
  pkmn1.ability = :BEASTBOOST
  pkmn1.nature = :ADAMANT
  pkmn1.item = :WHITEHERB
  pkmn1.moves = [:CLOSECOMBAT, :LUNGE, :OUTRAGE, :RAPIDSPIN]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 4, :ATTACK => 252, :SPEED => 252 }
  pkmn1.obtain_map = 48

  pkmn2 = Pokemon.new(:PRIMARINA, 80, barry, false)
  pkmn2.ability = :LIQUIDVOICE
  pkmn2.nature = :MODEST
  pkmn2.item = :LEFTOVERS
  pkmn2.moves = [:AQUARING, :ALLURINGVOICE, :SCALD, :ICEBEAM]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn2.obtain_map = 48

  pkmn3 = Pokemon.new(:BEEDRILL, 80, barry, false)
  pkmn3.shiny = true
  pkmn3.ability = :ADAPTABILITY
  pkmn3.nature = :JOLLY
  pkmn3.item = :BEEDRILLITE
  pkmn3.moves = [:FELLSTINGER, :POISONJAB, :OUTRAGE, :KNOCKOFF]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 48

  pkmn4 = Pokemon.new(:LILLIGANT, 80, barry, false)
  pkmn4.gender = 1
  pkmn4.shiny = true
  pkmn4.name = "Devastator"
  pkmn4.ability = :OWNTEMPO
  pkmn4.nature = :MODEST
  pkmn4.item = :GRASSIUMZ
  pkmn4.moves = [:GIGADRAIN, :PETALDANCE, :QUIVERDANCE, :SLEEPPOWDER]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn4.obtain_map = 48

  pkmn5 = Pokemon.new(:KYUREM, 85, yuna, false)
  pkmn5.form = 1
  pkmn5.ability = :PARENTALBOND
  pkmn5.nature = :TIMID
  pkmn5.item = :LIFEORB
  pkmn5.moves = [:BOOMBURST, :MALIGNANTCHAIN, :TORCHSONG, :PSYSTRIKE]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :DEFENSE => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn5.obtain_map = 48

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)
end

def pbAddTeamLas
  las = NPCTrainer.new("Lascelles", :SILKYSAINT)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:TOXAPEX, 80, las, false)
  pkmn0.ability = :REGENERATOR
  pkmn0.nature = :BOLD
  pkmn0.item = :BLACKSLUDGE
  pkmn0.moves = [:TOXICSPIKES, :ICEBEAM, :BANEFULBUNKER, :RECOVER]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 136, :DEFENSE => 252, :SPECIAL_DEFENSE => 120 }
  pkmn0.obtain_map = 78

  pkmn1 = Pokemon.new(:INFERNAPE, 80, las, false)
  pkmn1.ability = :IRONFIST
  pkmn1.nature = :JOLLY
  pkmn1.item = :LIFEORB
  pkmn1.moves = [:FIREPUNCH, :THUNDERPUNCH, :CLOSECOMBAT, :MACHPUNCH]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 4, :ATTACK => 252, :SPEED => 252 }
  pkmn1.obtain_map = 78

  pkmn2 = Pokemon.new(:BLASTOISE, 80, las, false)
  pkmn2.ability = :TORRENT
  pkmn2.nature = :MODEST
  pkmn2.item = :BLASTOISINITE
  pkmn2.moves = [:WATERPULSE, :AURASPHERE, :ICEBEAM, :SHELLSMASH]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn2.obtain_map = 78

  pkmn3 = Pokemon.new(:TINKATON, 80, las, false)
  pkmn3.gender = 1
  pkmn3.ability = :MOLDBREAKER
  pkmn3.nature = :ADAMANT
  pkmn3.item = :AIRBALLOON
  pkmn3.moves = [:GIGATONHAMMER, :PLAYROUGH, :THUNDERWAVE, :FAKEOUT]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 4, :ATTACK => 252, :DEFENSE => 152, :SPEED => 100 }
  pkmn3.obtain_map = 78

  pkmn4 = Pokemon.new(:QUAQUAVAL, 80, las, false)
  pkmn4.ability = :MOXIE
  pkmn4.nature = :JOLLY
  pkmn4.item = :FOCUSSASH
  pkmn4.moves = [:LASTRESORT, :AQUASTEP]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 4, :ATTACK => 252, :SPEED => 252 }
  pkmn4.obtain_map = 78

  pkmn5 = Pokemon.new(:LUDICOLO, 85, las, false)
  pkmn5.name = "LAST HOPE"
  pkmn5.gender = 0
  pkmn5.ability = :RAINDISH
  pkmn5.nature = :BOLD
  pkmn5.item = :LEFTOVERS
  pkmn5.moves = [:ICEBEAM, :RAINDANCE, :PROTECT, :LEECHSEED]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 4, :DEFENSE => 252, :SPECIAL_DEFENSE => 252 }
  pkmn5.obtain_map = 78

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamAlex
  alex = NPCTrainer.new("Alex", :PRIMORDIALEMPEROR)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:MIMIKYU, 80, alex, false)
  pkmn0.gender = 1
  pkmn0.ability = :DISGUISE
  pkmn0.nature = :JOLLY
  pkmn0.item = :REDCARD
  pkmn0.moves = [:SWORDSDANCE, :SHADOWSNEAK, :PLAYROUGH, :SHADOWCLAW]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn0.obtain_map = 76

  pkmn1 = Pokemon.new(:BEARTIC, 80, alex, false)
  pkmn1.gender = 0
  pkmn1.ability = :THICKFAT
  pkmn1.nature = :ADAMANT
  pkmn1.item = :LIFEORB
  pkmn1.moves = [:AQUAJET, :ICICLECRASH, :SWORDSDANCE, :SUPERPOWER]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 252, :ATTACK => 252, :DEFENSE => 4 }
  pkmn1.obtain_map = 76

  pkmn2 = Pokemon.new(:SCOVILLAIN, 80, alex, false)
  pkmn2.gender = 0
  pkmn2.ability = :MOODY
  pkmn2.nature = :JOLLY
  pkmn2.item = :FOCUSSASH
  pkmn2.moves = [:TEMPERFLARE, :SEEDBOMB, :TRAILBLAZE, :STOMPINGTANTRUM]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn2.obtain_map = 76

  pkmn3 = Pokemon.new(:TYPHLOSION, 80, alex, false)
  pkmn3.gender = 1
  pkmn3.ability = :STORMDRAIN
  pkmn3.nature = :TIMID
  pkmn3.item = :FIREGEM
  pkmn3.moves = [:ERUPTION, :FOCUSBLAST, :HIDDENPOWER, :EXTRASENSORY]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 76

  pkmn4 = Pokemon.new(:STARMIE, 80, alex, false)
  pkmn4.gender = 0
  pkmn4.ability = :ANALYTIC
  pkmn4.nature = :JOLLY
  pkmn4.item = :STARMINITE
  pkmn4.moves = [:AQUAJET, :LIQUIDATION, :PSYCHOCUT, :AVALANCHE]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 76

  pkmn5 = Pokemon.new(:HOOH, 85, alex, false)
  pkmn5.ability = :PRESSURE
  pkmn5.nature = :GENTLE
  pkmn5.item = :LEFTOVERS
  pkmn5.moves = [:SACREDFIRE, :RECOVER, :TOXIC, :EARTHPOWER]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 248, :SPECIAL_ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn5.obtain_map = 76

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamAndrae
  andrae = NPCTrainer.new("Andrae", :PRIMORDIALEMPEROR)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:SWAMPERT, 80, andrae, false)
  pkmn0.shiny = true
  pkmn0.gender = 0
  pkmn0.ability = :TORRENT
  pkmn0.nature = :ADAMANT
  pkmn0.item = :LEFTOVERS
  pkmn0.moves = [:STEALTHROCK, :LIQUIDATION, :EARTHQUAKE, :ICEPUNCH]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252,:ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:GARDEVOIR, 80, andrae, false)
  pkmn1.shiny = true
  pkmn1.gender = 1
  pkmn1.ability = :SYNCHRONIZE
  pkmn1.nature = :MODEST
  pkmn1.item = :LIFEORB
  pkmn1.moves = [:CONFUSERAY, :PSYCHIC, :MOONBLAST, :SHADOWBALL]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:LUCARIO, 80, andrae, false)
  pkmn2.gender = 0
  pkmn2.ability = :INNERFOCUS
  pkmn2.nature = :TIMID
  pkmn2.item = :SITRUSBERRY
  pkmn2.moves = [:AURASPHERE, :FLASHCANNON, :VACUUMWAVE, :WATERPULSE]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :DEFENSE => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:RAICHU, 80, andrae, false)
  pkmn3.gender = 0
  pkmn3.ability = :STATIC
  pkmn3.nature = :NAIVE
  pkmn3.item = :SHUCABERRY
  pkmn3.moves = [:FAKEOUT, :THUNDERBOLT, :THUNDERWAVE, :SURF]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 80, :SPECIAL_ATTACK => 176, :SPEED => 252 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:CERULEDGE, 80, andrae, false)
  pkmn4.gender = 0
  pkmn4.ability = :WEAKARMOR
  pkmn4.nature = :JOLLY
  pkmn4.item = :FOCUSSASH
  pkmn4.moves = [:BITTERBLADE, :SWORDSDANCE, :SHADOWSNEAK, :SHADOWCLAW]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:RAYQUAZA, 85, andrae, false)
  pkmn5.ability = :AIRLOCK
  pkmn5.nature = :NAIVE
  pkmn5.item = :WHITEHERB
  pkmn5.moves = [:DRAGONASCENT, :DRACOMETEOR, :DRAGONCLAW, :IRONHEAD]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :ATTACK => 180, :SPECIAL_ATTACK => 76, :SPEED => 252 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamTip
  tip = NPCTrainer.new("Tip", :OLMAN)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:HIPPOPOTAS, 80, tip, false)
  pkmn0.gender = 1
  pkmn0.ability = :SANDSTREAM
  pkmn0.nature = :IMPISH
  pkmn0.item = :SMOOTHROCK
  pkmn0.moves = [:FISSURE, :SANDATTACK, :EARTHQUAKE, :TOXIC]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :ATTACK => 4, :DEFENSE => 252 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:NOSEPASS, 1, tip, false)
  pkmn1.gender = 0
  pkmn1.ability = :STURDY
  pkmn1.nature = :BOLD
  pkmn1.item = :BERRYJUICE
  pkmn1.moves = [:RECYCLE, :THUNDERWAVE, :SWAGGER]
  pkmn1.happiness = 255
  pkmn1.iv = { :HP => 1, :ATTACK => 0, :DEFENSE => 0, :SPECIAL_ATTACK => 0, :SPECIAL_DEFENSE => 0, :SPEED => 0 }
  pkmn1.ev = {}
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:DITTO, 80, tip, false)
  pkmn2.gender = 0
  pkmn2.ability = :IMPOSTER
  pkmn2.nature = :SERIOUS
  pkmn2.item = :CHOICESCARF
  pkmn2.moves = [:TRANSFORM]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :DEFENSE => 4, :SPEED => 252 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:SNORLAX, 80, tip, false)
  pkmn3.gender = 0
  pkmn3.ability = :THICKFAT
  pkmn3.nature = :ADAMANT
  pkmn3.item = :LEFTOVERS
  pkmn3.moves = [:CURSE, :BODYSLAM, :EARTHQUAKE, :REST]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 252, :DEFENSE => 252, :SPECIAL_DEFENSE => 4 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:WAILMER, 80, tip, false)
  pkmn4.gender = 1
  pkmn4.ability = :LIGHTNINGROD
  pkmn4.nature = :MODEST
  pkmn4.item = :EVIOLITE
  pkmn4.moves = [:WATERSPOUT, :HYDROPUMP, :ICEBEAM, :HIDDENPOWER]
  pkmn4.happiness = 255
  pkmn4.iv = { :HP => 31, :ATTACK => 30, :DEFENSE => 31, :SPECIAL_ATTACK => 30, :SPECIAL_DEFENSE => 31, :SPEED => 30 }
  pkmn4.ev = { :HP => 252, :SPECIAL_ATTACK => 252, :SPEED => 4 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:KECLEON, 85, tip, false)
  pkmn5.gender = 0
  pkmn5.ability = :PROTEAN
  pkmn5.nature = :ADAMANT
  pkmn5.item = :ASSAULTVEST
  pkmn5.moves = [:KNOCKOFF, :DRAINPUNCH, :SHADOWSNEAK, :SUCKERPUNCH]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 172, :ATTACK => 252, :SPEED => 84 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamPatrickJack
  patrickJack = NPCTrainer.new("Patrick & Jack", :CALAMITOUSCOUSINS)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:ESPEON, 80, patrickJack, false)
  pkmn0.gender = 1
  pkmn0.ability = :MAGICBOUNCE
  pkmn0.nature = :TIMID
  pkmn0.item = :LIGHTCLAY
  pkmn0.moves = [:YAWN, :DREAMEATER, :FUTURESIGHT, :REFLECT]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:GENGAR, 80, patrickJack, false)
  pkmn1.gender = 0
  pkmn1.ability = :BADDREAMS
  pkmn1.nature = :TIMID
  pkmn1.item = :WEAKNESSPOLICY
  pkmn1.moves = [:HYPNOSIS, :DREAMEATER, :SHADOWBALL, :SLUDGEBOMB]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:AGGRON, 80, patrickJack, false)
  pkmn2.gender = 0
  pkmn2.ability = :ROCKHEAD
  pkmn2.nature = :ADAMANT
  pkmn2.item = :ASSAULTVEST
  pkmn2.moves = [:HEADSMASH, :EARTHQUAKE, :HEAVYSLAM, :AQUATAIL]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 248, :ATTACK => 252, :SPECIAL_DEFENSE => 8 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:CHARIZARD, 80, patrickJack, false)
  pkmn3.gender = 0
  pkmn3.ability = :BLAZE
  pkmn3.nature = :JOLLY
  pkmn3.item = :FLYINGGEM
  pkmn3.moves = [:SWORDSDANCE, :ACROBATICS, :FLAREBLITZ, :ROOST]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:ARTICUNO, 85, patrickJack, false)
  pkmn4.gender = 1
  pkmn4.ability = :SNOWCLOAK
  pkmn4.nature = :MODEST
  pkmn4.item = :ICEGEM
  pkmn4.moves = [:BLIZZARD, :FREEZEDRY, :ROOST, :HIDDENPOWER]
  pkmn4.happiness = 255
  pkmn4.iv = { :HP => 31, :ATTACK => 1, :DEFENSE => 30, :SPECIAL_ATTACK => 30, :SPECIAL_DEFENSE => 30, :SPEED => 30 }
  pkmn4.ev = { :HP => 248, :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 8 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:KYUREM, 85, patrickJack, false)
  pkmn5.form = 2
  pkmn5.gender = 0
  pkmn5.ability = :SNOWWARNING
  pkmn5.nature = :RASH
  pkmn5.item = :LEFTOVERS
  pkmn5.moves = [:SUBSTITUTE, :BLIZZARD, :FUSIONBOLT, :EARTHPOWER]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 252, :ATTACK => 4, :SPECIAL_ATTACK => 252 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamAdam
  adam = NPCTrainer.new("Adam", :ORGXIIIMEMBER)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:FERROTHORN, 80, adam, false)
  pkmn0.gender = 0
  pkmn0.ability = :IRONBARBS
  pkmn0.nature = :RELAXED
  pkmn0.item = :LEFTOVERS
  pkmn0.moves = [:STEALTHROCK, :LEECHSEED, :GYROBALL, :POWERWHIP]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :ATTACK => 4, :DEFENSE => 252 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:BUTTERFREE, 80, adam, false)
  pkmn1.gender = 1
  pkmn1.ability = :TINTEDLENS
  pkmn1.nature = :MODEST
  pkmn1.item = :FOCUSSASH
  pkmn1.moves = [:QUIVERDANCE, :SLEEPPOWDER, :BUGBUZZ, :AIRSLASH]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:KELDEO, 80, adam, false)
  pkmn2.form = 1
  pkmn2.gender = 0
  pkmn2.ability = :JUSTIFIED
  pkmn2.nature = :TIMID
  pkmn2.item = :FIGHTINGGEM
  pkmn2.moves = [:CALMMIND, :SCALD, :SECRETSWORD, :SUBSTITUTE]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:CONKELDURR, 80, adam, false)
  pkmn3.gender = 0
  pkmn3.ability = :GUTS
  pkmn3.nature = :ADAMANT
  pkmn3.item = :FLAMEORB
  pkmn3.moves = [:DRAINPUNCH, :MACHPUNCH, :STONEEDGE, :FACADE]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 252, :ATTACK => 252, :SPECIAL_DEFENSE => 4 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:HYDREIGON, 80, adam, false)
  pkmn4.gender = 1
  pkmn4.ability = :LEVITATE
  pkmn4.nature = :TIMID
  pkmn4.item = :WHITEHERB
  pkmn4.moves = [:DRACOMETEOR, :DARKPULSE, :UTURN, :FIREBLAST]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:EXCADRILL, 85, adam, false)
  pkmn5.gender = 0
  pkmn5.shiny = true
  pkmn5.ability = :SANDSTREAM
  pkmn5.nature = :ADAMANT
  pkmn5.item = :EXCADRITE
  pkmn5.moves = [:SWORDSDANCE, :EARTHQUAKE, :IRONHEAD, :ROCKSLIDE]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :ATTACK => 252, :SPEED => 252 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamGyro
  gyro = NPCTrainer.new("Gyro", :FALSEPAPA)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:TORKOAL, 80, gyro, false)
  pkmn0.ability = :DROUGHT
  pkmn0.nature = :QUIET
  pkmn0.item = :LEFTOVERS
  pkmn0.moves = [:BODYPRESS, :STONEEDGE, :FIRESPIN, :ERUPTION]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :ATTACK => 100, :SPECIAL_ATTACK => 156 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:SANDYSHOCKS, 80, gyro, false)
  pkmn1.ability = :PROTOSYNTHESIS
  pkmn1.nature = :TIMID
  pkmn1.item = :AIRBALLOON
  pkmn1.moves = [:EARTHPOWER, :POWERGEM, :FLASHCANNON, :THUNDERBOLT]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:SCOVILLAIN, 80, gyro, false)
  pkmn2.ability = :CHLOROPHYLL
  pkmn2.nature = :MODEST
  pkmn2.item = :FOCUSSASH
  pkmn2.moves = [:FLAMETHROWER, :SOLARBEAM, :GIGADRAIN, :GRASSKNOT]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 200, :SPECIAL_ATTACK => 252, :SPEED => 56 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:DREDNAW, 80, gyro, false)
  pkmn3.ability = :STRONGJAW
  pkmn3.nature = :ADAMANT
  pkmn3.item = :ASSAULTVEST
  pkmn3.moves = [:DRAGONTAIL, :ICEFANG, :JAWLOCK, :LIQUIDATION]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 248, :ATTACK => 252, :SPECIAL_DEFENSE => 8 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:GREATTUSK, 80, gyro, false)
  pkmn4.ability = :PROTOSYNTHESIS
  pkmn4.nature = :JOLLY
  pkmn4.item = :BOOSTERENERGY
  pkmn4.moves = [:THROATCHOP, :SUPERCELLSLAM, :BODYPRESS, :EARTHQUAKE]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:MEWTWO, 85, gyro, false)
  pkmn5.ability = :UNNERVE
  pkmn5.nature = :MODEST
  pkmn5.item = :HEAVYDUTYBOOTS
  pkmn5.moves = [:THUNDERWAVE, :RECOVER, :EXPANDINGFORCE, :ICEBEAM]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamRaymond
  raymond = NPCTrainer.new("Raymond", :COACH)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:FLUTTERMANE, 80, raymond, false)
  pkmn0.ability = :PROTOSYNTHESIS
  pkmn0.nature = :TIMID
  pkmn0.item = :CHOICESPECS
  pkmn0.moves = [:SHADOWBALL, :MOONBLAST, :POWERGEM, :PSYSHOCK]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:CORVIKNIGHT, 80, raymond, false)
  pkmn1.shiny = true
  pkmn1.gender = 1
  pkmn1.ability = :MIRRORARMOR
  pkmn1.nature = :CAREFUL
  pkmn1.item = :LEFTOVERS
  pkmn1.moves = [:BODYPRESS, :IRONHEAD, :IRONDEFENSE, :ROOST]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 252, :ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:CLODSIRE, 80, raymond, false)
  pkmn2.gender = 0
  pkmn2.ability = :UNAWARE
  pkmn2.nature = :CAREFUL
  pkmn2.item = :BLACKSLUDGE
  pkmn2.moves = [:EARTHQUAKE, :TOXIC, :STEALTHROCK, :RECOVER]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:IRONBUNDLE, 80, raymond, false)
  pkmn3.ability = :QUARKDRIVE
  pkmn3.nature = :TIMID
  pkmn3.item = :BOOSTERENERGY
  pkmn3.moves = [:FREEZEDRY, :HYDROPUMP, :ICEBEAM, :TAUNT]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:KINGAMBIT, 80, raymond, false)
  pkmn4.gender = 0
  pkmn4.ability = :SUPREMEOVERLORD
  pkmn4.nature = :ADAMANT
  pkmn4.item = :FOCUSSASH
  pkmn4.moves = [:KOWTOWCLEAVE, :SUCKERPUNCH, :IRONHEAD, :LOWKICK]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 4, :ATTACK => 252, :SPEED => 252 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:URSHIFU, 85, raymond, false)
  pkmn5.form = 1
  pkmn5.ability = :ADAPTABILITY
  pkmn5.nature = :JOLLY
  pkmn5.item = :MYSTICWATER
  pkmn5.moves = [:SURGINGSTRIKES, :CLOSECOMBAT, :AQUAJET, :DRAGONASCENT]
  pkmn5.gmax_factor = true
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 4, :ATTACK => 252, :SPEED => 252 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamKilla
  killa = NPCTrainer.new("Killa", :POKEMONBREEDER)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:VANILLUXE, 80, killa, false)
  pkmn0.name = "Innocence"
  pkmn0.gender = 0
  pkmn0.ability = :OBLIVIOUS
  pkmn0.nature = :QUIET
  pkmn0.item = :NEVERMELTICE
  pkmn0.moves = [:FREEZEDRY, :ICEBEAM, :ICESHARD, :EXPLOSION]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :ATTACK => 4, :SPECIAL_ATTACK => 252 }
  pkmn0.obtain_map = 81

  pkmn1 = Pokemon.new(:CHANDELURE, 80, killa, false)
  pkmn1.name = "Celebacy"
  pkmn1.gender = 1
  pkmn1.ability = :CUTECHARM
  pkmn1.nature = :HASTY
  pkmn1.item = :AIRBALLOON
  pkmn1.moves = [:FIREBLAST, :SHADOWBALL, :FLAMECHARGE, :ATTRACT]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :ATTACK => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn1.obtain_map = 81

  pkmn2 = Pokemon.new(:SERPERIOR, 80, killa, false)
  pkmn2.name = "Maidenhood"
  pkmn2.gender = 1
  pkmn2.ability = :CUTECHARM
  pkmn2.nature = :TIMID
  pkmn2.item = :LIGHTCLAY
  pkmn2.moves = [:LIGHTSCREEN, :REFLECT, :LEAFSTORM, :ATTRACT]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :HP => 252, :SPECIAL_ATTACK => 4, :SPEED => 252 }
  pkmn2.obtain_map = 81

  pkmn3 = Pokemon.new(:VAPOREON, 80, killa, false)
  pkmn3.name = "Purity"
  pkmn3.gender = 1
  pkmn3.shiny = true
  pkmn3.ability = :CUTECHARM
  pkmn3.nature = :BOLD
  pkmn3.item = :LEFTOVERS
  pkmn3.moves = [:SCALD, :TOXIC, :WISH, :ATTRACT]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 252, :DEFENSE => 252, :SPECIAL_DEFENSE => 4 }
  pkmn3.obtain_map = 81

  pkmn4 = Pokemon.new(:LOPUNNY, 80, killa, false)
  pkmn4.name = "Chasity"
  pkmn4.gender = 1
  pkmn4.ability = :CUTECHARM
  pkmn4.nature = :JOLLY
  pkmn4.item = :NORMALGEM
  pkmn4.moves = [:RETURN, :SWEETKISS, :FAKEOUT, :ATTRACT]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 81

  pkmn5 = Pokemon.new(:GARDEVOIR, 85, killa, false)
  pkmn5.name = "Abstinence"
  pkmn5.gender = 1
  pkmn5.ability = :CUTECHARM
  pkmn5.nature = :TIMID
  pkmn5.item = :LIFEORB
  pkmn5.moves = [:PSYCHIC, :DRAININGKISS, :FOCUSBLAST, :ATTRACT]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn5.obtain_map = 81

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamLoliGod
  loli = NPCTrainer.new("Loli God", :NUBILEDEITY)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:CELEBI, 90, loli, false)
  pkmn0.gender = 1
  pkmn0.ability = :PRANKSTER
  pkmn0.nature = :CALM
  pkmn0.item = :ROCKYHELMET
  pkmn0.moves = [:RECOVER, :UTURN, :GRASSKNOT, :STEALTHROCK]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 252, :SPECIAL_DEFENSE => 220, :SPEED => 36 }
  pkmn0.obtain_map = 112

  pkmn1 = Pokemon.new(:VICTINI, 90, loli, false)
  pkmn1.gender = 1
  pkmn1.ability = :CONTRARY
  pkmn1.nature = :JOLLY
  pkmn1.item = :CHOICEBAND
  pkmn1.moves = [:VCREATE, :UTURN, :BOLTSTRIKE, :BRICKBREAK]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn1.obtain_map = 112

  pkmn2 = Pokemon.new(:JIRACHI, 90, loli, false)
  pkmn2.gender = 1
  pkmn2.ability = :LEVITATE
  pkmn2.nature = :HASTY
  pkmn2.item = :EXPERTBELT
  pkmn2.moves = [:IRONHEAD, :ICYWIND, :THUNDERBOLT, :HIDDENPOWER]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :ATTACK => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn2.obtain_map = 112

  pkmn3 = Pokemon.new(:TAPULELE, 90, loli, false)
  pkmn3.gender = 1
  pkmn3.ability = :PSYCHICSURGE
  pkmn3.nature = :MODEST
  pkmn3.item = :TAPUNIUMZ
  pkmn3.moves = [:MOONBLAST, :EXPANDINGFORCE, :NATURESMADNESS, :EARTHPOWER]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn3.obtain_map = 112

  pkmn4 = Pokemon.new(:MELOETTA, 90, loli, false)
  pkmn4.gender = 1
  pkmn4.ability = :DOWNLOAD
  pkmn4.nature = :HASTY
  pkmn4.item = :LIFEORB
  pkmn4.moves = [:RELICSONG, :CLOSECOMBAT, :PSYCHIC, :THUNDERBOLT]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn4.obtain_map = 112

  pkmn5 = Pokemon.new(:DIANCIE, 90, loli, false)
  pkmn5.gender = 1
  pkmn5.ability = :SANDSTREAM
  pkmn5.nature = :TIMID
  pkmn5.item = :DIANCITE
  pkmn5.moves = [:DIAMONDSTORM, :DRAININGKISS, :CALMMIND, :EARTHPOWER]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :DEFENSE => 252, :SPECIAL_ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn5.obtain_map = 112

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamShadowKeith
  evil = NPCTrainer.new("Shadow Keith", :CHILDGOBBLER)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:DEOXYS, 100, evil, false)
  pkmn0.form = 3
  pkmn0.ability = :INTIMIDATE
  pkmn0.nature = :TIMID
  pkmn0.item = :ROCKYHELMET
  pkmn0.moves = [:STEALTHROCK, :SPIKES, :REFLECT, :TAUNT]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :HP => 248, :SPECIAL_DEFENSE => 8, :SPEED => 252 }
  pkmn0.obtain_map = 111

  pkmn1 = Pokemon.new(:DEOXYS, 100, evil, false)
  pkmn1.ability = :SIMPLE
  pkmn1.nature = :HASTY
  pkmn1.item = :KASIBBERRY
  pkmn1.moves = [:PSYCHOBOOST, :PURSUIT, :ICEBEAM, :CALMMIND]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :ATTACK => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn1.obtain_map = 111

  pkmn2 = Pokemon.new(:DEOXYS, 100, evil, false)
  pkmn2.form = 1
  pkmn2.ability = :SHEERFORCE
  pkmn2.nature = :HASTY
  pkmn2.item = :LIFEORB
  pkmn2.moves = [:PSYCHOBOOST, :ICEBEAM, :SUPERPOWER, :DARKPULSE]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :ATTACK => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn2.obtain_map = 111

  pkmn3 = Pokemon.new(:DEOXYS, 100, evil, false)
  pkmn3.form = 2
  pkmn3.ability = :MULTISCALE
  pkmn3.nature = :CAREFUL
  pkmn3.item = :LEFTOVERS
  pkmn3.moves = [:RECOVER, :TOXIC, :LIGHTSCREEN, :DRAINPUNCH]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :HP => 252, :ATTACK => 4, :SPECIAL_DEFENSE => 252 }
  pkmn3.obtain_map = 111

  pkmn4 = Pokemon.new(:LEAVANNY, 100, evil, false)
  pkmn4.gender = 1
  pkmn4.ability = :WONDERGUARD
  pkmn4.nature = :JOLLY
  pkmn4.item = :FOCUSSASH
  pkmn4.moves = [:LEAFBLADE, :XSCISSOR, :SWORDSDANCE, :POISONJAB]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn4.obtain_map = 111

  pkmn5 = Pokemon.new(:HAXORUS, 100, evil, false)
  pkmn5.gender = 0
  pkmn5.ability = :NOGUARD
  pkmn5.nature = :JOLLY
  pkmn5.item = :ASSAULTVEST
  pkmn5.moves = [:FIRSTIMPRESSION, :GUILLOTINE, :ROCKSLIDE, :OUTRAGE]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn5.obtain_map = 111

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

def pbAddTeamShadowDominic
  evil = NPCTrainer.new("Dominic", :LITTLEWARRIOR)
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }

  pkmn0 = Pokemon.new(:DIALGA, 100, evil, false)
  pkmn0.gender = 0
  pkmn0.ability = :LEVITATE
  pkmn0.nature = :NAIVE
  pkmn0.item = :LEFTOVERS
  pkmn0.moves = [:STEALTHROCK, :DRACOMETEOR, :FIREBLAST, :DRAGONTAIL]
  pkmn0.happiness = 255
  pkmn0.iv = perfect_ivs
  pkmn0.ev = { :ATTACK => 4, :SPECIAL_ATTACK => 252, :SPEED => 252 }
  pkmn0.obtain_map = 83

  pkmn1 = Pokemon.new(:GIRATINA, 100, evil, false)
  pkmn1.gender = 0
  pkmn1.ability = :SHADOWTAG
  pkmn1.nature = :CAREFUL
  pkmn1.item = :GRISEOUSORB
  pkmn1.moves = [:DRAGONTAIL, :SHADOWSNEAK, :WILLOWISP, :SUBSTITUTE]
  pkmn1.happiness = 255
  pkmn1.iv = perfect_ivs
  pkmn1.ev = { :HP => 248, :ATTACK => 8, :SPECIAL_DEFENSE => 252 }
  pkmn1.obtain_map = 83

  pkmn2 = Pokemon.new(:PALKIA, 100, evil, false)
  pkmn2.gender = 0
  pkmn2.ability = :PARENTALBOND
  pkmn2.nature = :TIMID
  pkmn2.item = :LUSTROUSORB
  pkmn2.moves = [:SPACIALREND, :HYDROPUMP, :FIREBLAST, :THUNDER]
  pkmn2.happiness = 255
  pkmn2.iv = perfect_ivs
  pkmn2.ev = { :SPECIAL_ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  pkmn2.obtain_map = 83

  pkmn3 = Pokemon.new(:GENESECT, 100, evil, false)
  pkmn3.gender = 0
  pkmn3.ability = :FLASHFIRE
  pkmn3.nature = :HASTY
  pkmn3.item = :CHOICESCARF
  pkmn3.moves = [:UTURN, :ICEBEAM, :BLAZEKICK, :IRONHEAD]
  pkmn3.happiness = 255
  pkmn3.iv = perfect_ivs
  pkmn3.ev = { :ATTACK => 252, :SPECIAL_ATTACK => 4, :SPEED => 252 }
  pkmn3.obtain_map = 83

  pkmn4 = Pokemon.new(:FARFETCHD, 100, evil, false)
  pkmn4.gender = 0
  pkmn4.shiny = true
  pkmn4.ability = :WONDERGUARD
  pkmn4.nature = :LONELY
  pkmn4.item = :LEEK
  pkmn4.moves = [:OBLIVIONWING, :VCREATE, :SKYATTACK, :SKULLBASH]
  pkmn4.happiness = 255
  pkmn4.iv = perfect_ivs
  pkmn4.ev = { :HP => 248, :ATTACK => 252, :SPECIAL_ATTACK => 8 }
  pkmn4.obtain_map = 83

  pkmn5 = Pokemon.new(:ARCEUS, 100, evil, false)
  pkmn5.gender = 0
  pkmn5.ability = :MULTITYPE
  pkmn5.nature = :TIMID
  pkmn5.item = :SPOOKYPLATE
  pkmn5.moves = [:CALMMIND, :JUDGMENT, :FOCUSBLAST, :RECOVER]
  pkmn5.happiness = 255
  pkmn5.iv = perfect_ivs
  pkmn5.ev = { :HP => 252, :SPECIAL_ATTACK => 4, :SPEED => 252 }
  pkmn5.obtain_map = 83

  $PokemonStorage.pbStoreCaught(pkmn0)
  $PokemonStorage.pbStoreCaught(pkmn1)
  $PokemonStorage.pbStoreCaught(pkmn2)
  $PokemonStorage.pbStoreCaught(pkmn3)
  $PokemonStorage.pbStoreCaught(pkmn4)
  $PokemonStorage.pbStoreCaught(pkmn5)

end

#===============================================================================
# Cinematic party swap
#   Saves the player's current party and replaces it with a single Pokémon for a
#   scripted fight, then restores the original party afterwards. The saved party
#   lives on $PokemonGlobal, so it survives the player saving mid-cutscene.
#
#   Usage in an event Script command:
#     pbStartCinematicParty(:HAXORUS, 100)            # species + level
#     pbStartCinematicParty(my_pokemon_object)        # or a prebuilt Pokemon
#     TrainerBattle.start(:TRAINERTYPE, "Name")
#     pbEndCinematicParty
#===============================================================================
class PokemonGlobalMetadata
  attr_accessor :cinematic_saved_party
end

def pbCinematicPartyActive?
  return !$PokemonGlobal.cinematic_saved_party.nil?
end

# pkmn: a Pokemon object, or a species symbol (then level is used).
def pbStartCinematicParty()
  if pbCinematicPartyActive?
    echoln("pbStartCinematicParty: a party is already saved; not overwriting it.")
    return false
  end
  perfect_ivs = {
    :HP => 31, :ATTACK => 31, :DEFENSE => 31,
    :SPECIAL_ATTACK => 31, :SPECIAL_DEFENSE => 31, :SPEED => 31
  }
  pkmn = Pokemon.new(:HAXORUS, 100, $player, false)
  pkmn.gender = 0
  pkmn.ability = :MOLDBREAKER
  pkmn.nature = :JOLLY
  pkmn.moves = [:UNCHARGEDSUPERNOVA, :ENDURE, :FIRSTIMPRESSION, :STRENGTH]
  pkmn.happiness = 255
  pkmn.iv = perfect_ivs
  pkmn.ev = { :ATTACK => 252, :SPECIAL_DEFENSE => 4, :SPEED => 252 }
  $PokemonGlobal.cinematic_saved_party = $player.party
  $player.party = [pkmn]
  return true
end

def pbEndCinematicParty(heal = false)
  return false if !pbCinematicPartyActive?
  $player.party = $PokemonGlobal.cinematic_saved_party
  $PokemonGlobal.cinematic_saved_party = nil
  $player.heal_party if heal
  return true
end
