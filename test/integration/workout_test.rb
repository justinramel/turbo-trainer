require 'test_helper'

class WorkoutTest < ActionDispatch::IntegrationTest

  setup do
    @user = Factory(:user)
    sign_user_in(@user)
  end

  test "create workout" do
    visit home_index_path

    click_link "New workout"

    assert_content "Start workout"
  end

end