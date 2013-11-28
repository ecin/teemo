dep "postgresql", :template => "bin" do
  installs "postgresql"
  provides "postgres >= 9.3.1"
end

