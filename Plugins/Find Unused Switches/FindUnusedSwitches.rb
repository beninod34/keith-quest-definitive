def pbFindUnusedSwitches
  used = Hash.new { |h, k| h[k] = [] }
  scan = proc do |list, where|
    list.each do |cmd|
      case cmd.code
      when 121   # Control Switches
        (cmd.parameters[0]..cmd.parameters[1]).each { |s| used[s] << where }
      when 111   # Conditional Branch on a switch
        used[cmd.parameters[1]] << where if cmd.parameters[0] == 0
      end
      if [111, 355, 655].include?(cmd.code)   # script text
        cmd.parameters.each do |p|
          p.to_s.scan(/\$game_switches\[(\d+)\]/) { used[$1.to_i] << where }
        end
      end
    end
  end
  load_data("Data/MapInfos.rxdata").each do |id, info|
    map = load_data(sprintf("Data/Map%03d.rxdata", id)) rescue nil
    next if !map
    map.events.each_value do |ev|
      ev.pages.each_with_index do |pg, i|
        where = "#{info.name} / #{ev.name} (page #{i + 1})"
        c = pg.condition
        used[c.switch1_id] << where if c.switch1_valid
        used[c.switch2_id] << where if c.switch2_valid
        scan.call(pg.list, where)
      end
    end
  end
  load_data("Data/CommonEvents.rxdata").compact.each do |ce|
    where = "Common Event: #{ce.name}"
    used[ce.switch_id] << where if ce.trigger > 0
    scan.call(ce.list, where)
  end
  load_data("Data/Troops.rxdata").compact.each do |t|
    t.pages.each do |pg|
      where = "Troop: #{t.name}"
      used[pg.condition.switch_id] << where if pg.condition.switch_valid
      scan.call(pg.list, where)
    end
  end
  names = load_data("Data/System.rxdata").switches
  File.open("switch_report.txt", "w") do |f|
    (1...names.length).each do |s|
      if used[s].empty?
        f.puts "#{s}: #{names[s]} -- NOT USED BY ANY EVENT"
      else
        f.puts "#{s}: #{names[s]} -- #{used[s].uniq.join(', ')}"
      end
    end
  end
  pbMessage(_INTL("Saved switch_report.txt in the game folder."))
end