#!/usr/bin/ruby

# CloudTabOpener
#
#   written by: David Blache
#   free to modify and use however you see fit  : )
#
# Queries the ~/Library/Safari/CloudTabs.db database, letting you select and open iCloud
# tabs associated with any of your Apple devices


class String
  # extending String class to add #numeric? method
  def numeric?
    true if Float(self) rescue false
  end
end


class CloudTabOpener

  DBPATH = "~/Library/Safari/CloudTabs.db"
  #DBPATH = "~/Desktop/CloudTabs.db"


  def initialize
    @database = File.expand_path(DBPATH)
    load_gem("sqlite3")
  end


  def start
    # ask user to choose device from iCLoud tab device list
    device = choose_device
    unless device.nil?

      # get iCloud tabs for this device
      tabs = get_tabs_for_device(device)

      # are you sure?
      should_open = true
      if tabs.count > 10
        puts "There are #{tabs.count} tabs open on #{device[:name]}."
        print "> Open #{tabs.count} tabs?: "
        choice = STDIN.gets.chomp.downcase
        should_open = false unless ["yes", "y"].include? choice
      end

      # open them in a new window
      if should_open
        tabs.each_with_index do |tab, index|
          if index == 0
            command = "osascript -e 'tell application \"Safari\" to make new document with properties {URL: \"#{tab[:url]}\"}' > /dev/null"
          else
            command = "osascript -e 'tell application \"Safari\" to tell window 1 to make new tab with properties {URL: \"#{tab[:url]}\"}' > /dev/null"
          end
          puts "Opening #{index + 1} of #{tabs.count}: #{tab[:title]}"
          system(command)
        end
      end
    end
  end


  def choose_device()
    selected_device = nil

    devices = get_devices
    if devices.count == 1
      selected_device = devices[0]
    else
      if devices.count > 0
        puts "Choose the device whose iCloud tabs you want to open."
        devices.each_with_index {|device, i| puts "#{i}: #{device[:name].strip}"}

        asking = true
        while asking
          print "> Device: "
          selection = STDIN.gets.chomp
          if selection.length == 0
            asking = false
            STDERR.puts "No device selected."
          else
            if selection.numeric?
              selected_device = devices[selection.to_i]
              asking = false
            else
              selected_device = devices.detect {|device| device[:name].include? selection}
              asking = false
            end
          end
        end
        puts "Selected: #{selected_device[:name]}"
      end
    end

    return selected_device
  end


  def get_devices()
    devices = Array.new
    begin
      connection = SQLite3::Database.open(@database)
      statement = connection.prepare("select device_uuid, device_name from cloud_tab_devices")
      results = statement.execute
      results.each do |row|
        devices << {id: row[0], name:row[1]}
      end
    rescue SQLite3::Exception => e
      STDERR.puts "ERROR: #{__method__}: #{e}"
    ensure
      statement.close if statement
      connection.close if connection
    end
    return devices
  end


  def get_tabs_for_device(device)
    tabs = Array.new
    begin
      connection = SQLite3::Database.open(@database)
      statement = connection.prepare("select title, url from cloud_tabs where device_uuid == '#{device[:id]}'")
      results = statement.execute
      results.each do |row|
        tabs << {title: row[0], url:row[1]}
      end
    rescue SQLite3::Exception => e
      STDERR.puts "ERROR: #{__method__}: #{e}"
    ensure
      statement.close if statement
      connection.close if connection
    end
    return tabs
  end


  def load_gem(name, version = nil)
    begin
      gem name, version
    rescue LoadError
      system("gem install #{name}")
      Gem.clear_paths
      retry
    end
    require name
  end

end

opener = CloudTabOpener.new()
opener.start
