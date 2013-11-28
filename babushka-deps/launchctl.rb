dep "launchctl", :app do

  met? do
    # Only care if the app is in the launch list if it has
    # LaunchAgent scripts
    if "/usr/local/opt/#{app}".p.exists? && shell("ls /usr/local/opt/#{app}/*.plist")
      shell "launchctl list | grep homebrew.mxcl.#{app}"
    else
      true
    end
  end

  meet do
    shell "mkdir -p ~/Library/LaunchAgents"
    shell "ln -sfv /usr/local/opt/#{app}/*.plist ~/Library/LaunchAgents/"
    shell "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.*"
  end

end
