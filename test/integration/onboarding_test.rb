require "test_helper"

class OnboardingTest < ActionDispatch::IntegrationTest

  # Implicitly using fixtures here. Might want to be more explicit
  # about how these expectations work.

  test "fetch user details" do
    user = users(:nelson)

    get "/users/#{user.id}", {}, "Accept" => "application/json"

    result["name"].must_equal user.name
  end

  test "fetch activities" do
    get "/activities", {}, "Accept" => "application/json"

    result.wont_be_nil
    activities = result.map { |activity| activity["name"] }

    Activity.all.each do |activity|
      activities.must_include activity.name
    end
  end

  test "fetch activities for a user" do
    user = users(:nelson)

    get "/users/#{user.id}/activities", {}, "Accept" => "application/json"

    activities = user.activities.map(&:name)

    result.wont_be_nil
    result.each do |activity|
      activities.must_include activity["name"]
    end
  end

  test "search for activities" do
    get "/activities/search/ten", {}, "Accept" => "application/json"

    result.wont_be_nil
    result.map { |row| row["name"] }.must_include activities(:tennis).name
  end

  protected

  def result
    JSON.parse(response.body)
  end

end
