module GameData
  class MapMetadata
    # map ID => [switch, [region, x, y]]
    ALT_MAP_POSITIONS = {
      32 => [75, [3, 15, 16]],
      81 => [75, [3, 15, 6]],
    }

    alias __alt_town_map_position town_map_position
    def town_map_position
      alt = ALT_MAP_POSITIONS[@id]
      return alt[1] if alt && $game_switches && $game_switches[alt[0]]
      return __alt_town_map_position
    end
  end
end