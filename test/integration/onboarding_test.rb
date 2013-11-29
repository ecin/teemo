require "test_helper"

class OnboardingTest < ActionDispatch::IntegrationTest

  # Implicitly using fixtures here. Might want to be more explicit
  # about how these expectations work.

  test "fetch activities" do
    get "/activities"

    activities = JSON.parse(response.body).map { |activity| activity["name"] }

    Activity.all.each do |activity|
      activities.must_include activity.name
    end
  end

  test "fetch activities for a user" do
    user = users(:nelson)

    get "/users/#{user.id}/activities"

    activities = user.activities.map(&:name)
    JSON.parse(response.body).each do |activity|
      activities.must_include activity["name"]
    end
  end

end
