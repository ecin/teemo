dep "install" do
  # Developer tools
  requires "build tools"

  # Javascript
  requires "component"

  # Dependencies
  requires "postgresql"

  # Ruby 2.0
  requires "ruby".with(:version => "2.0.0-p247")

  # Launch services at boot time
  requires "launchctl".with(:app => "postgresql")
end

