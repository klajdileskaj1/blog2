require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username:"xhuli",email:"xhuli@gmail.com",password:"123")
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count',1) do
      post users_url, params: { user: { username:"xhuli1",email:"xhuli1@gmail.com",password:"123" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_url(@user), params: { user: {  } }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end
  #
  #   assert_redirected_to users_url
  # end
end
