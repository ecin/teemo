dep "ruby-build", :version do
  requires "rbenv"
  requires "readline"
  requires "rbenv-readline"

  met? do
    shell "rbenv install --list"
  end

  meet do
    shell "brew install ruby-build"
  end
end
