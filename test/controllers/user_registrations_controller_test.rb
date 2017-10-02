require 'test_helper'

class UserRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_registration = user_registrations(:one)
  end

  test "should get index" do
    get user_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_user_registration_url
    assert_response :success
  end

  test "should create user_registration" do
    assert_difference('UserRegistration.count') do
      post user_registrations_url, params: { user_registration: { completed: @user_registration.completed, completed_at: @user_registration.completed_at, user_registration_klass_id: @user_registration.user_registration_klass_id, user_type: @user_registration.user_type } }
    end

    assert_redirected_to registration_url(UserRegistration.last)
  end

  test "should show user_registration" do
    get user_registration_url(@user_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_registration_url(@user_registration)
    assert_response :success
  end

  test "should update user_registration" do
    patch user_registration_url(@user_registration), params: { user_registration: { completed: @user_registration.completed, completed_at: @user_registration.completed_at, registration_klass_id: @user_registration.registration_klass_id, user_type: @user_registration.user_type } }
    assert_redirected_to user_registration_url(@user_registration)
  end

  test "should destroy user_registration" do
    assert_difference('UserRegistration.count', -1) do
      delete user_registration_url(@user_registration)
    end

    assert_redirected_to user_registrations_url
  end
end
