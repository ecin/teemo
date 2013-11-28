dep "ruby", :version do
  requires "ruby-build"

  met? do
    shell "rbenv versions | grep #{version}"
  end

  meet do
    shell "rbenv install #{version}"
  end
end
