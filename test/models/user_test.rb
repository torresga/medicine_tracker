require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email is not considered present if it is blank" do
    @user.email = "    "
    assert_not @user.email?
  end

  test "password is not considered present if it is blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "email is not over 256 characters" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "password is not over 50 characters" do
    @user.password = @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  end

  test "password should not be less than 5 characters" do
    @user.password = @user.password_confirmation = "a" * 4
    assert_not @user.valid?
  end

  test "email is all downcase" do
    assert @user.email == @user.email.downcase
  end

  test "email must be unique" do
    new_user = User.new(email: "user@example.com", password: "password", password_confirmation: "password_confirmation")

    assert_not new_user.valid?
  end

  test "email must be in a specific format" do
    @user.email = "blah"

    assert_not @user.valid?
  end
end
