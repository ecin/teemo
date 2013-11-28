require 'test_helper'

describe User do
  # Ad-hoc test for associations
  it "can have allies" do
    user = users(:nelson)

    user.allies.map(&:who).must_include users(:george)

    user.activities.must_include activities(:tennis)
    user.activities.must_include activities(:salsa)
    user.activities.wont_include activities(:cooking)
  end
end
