require "test_helper"

describe "Authentication integration" do
  before do
    @user = Factory(:user)
  end

  it "shows home page when user is authenticated" do
    sign_in(@user)
    visit home_index_path

    page.body.must_include "Home"
  end

  it "shows sign in page when user is not authenticated" do
    visit home_index_path

    page.body.must_include "Remember me"
  end

end