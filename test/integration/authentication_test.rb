require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest

  setup do
    @user = Factory(:user)
  end

  test "show home page when user is authenticated" do
    sign_user_in(@user)
    visit home_index_path

    assert_content "Home"
  end


  test "show sign in page when user is not authenticated" do
    visit home_index_path

    assert_content "Remember me"
  end

end