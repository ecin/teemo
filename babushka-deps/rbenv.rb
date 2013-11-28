dep "rbenv", :template => "bin" do
  installs "rbenv"
  provides "rbenv"
  # copy rbenv's initialization to bash_profile or zshrc depending on shell
end
