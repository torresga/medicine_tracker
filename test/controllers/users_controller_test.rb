require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should redirect show when not logged in" do
    get show_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect show when user is not authorized" do
  end
end
