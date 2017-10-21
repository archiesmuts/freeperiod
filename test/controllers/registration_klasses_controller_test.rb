require 'test_helper'

class RegistrationKlassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_klass = registration_klasses(:one)
  end

  test "should get index" do
    get registration_klasses_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_klass_url
    assert_response :success
  end

  test "should create registration_klass" do
    assert_difference('RegistrationKlass.count') do
      post registration_klasses_url, params: { registration_klass: { course_id: @registration_klass.course_id, name: @registration_klass.name, school_id: @registration_klass.school_id, year: @registration_klass.year } }
    end

    assert_redirected_to registration_klass_url(RegistrationKlass.last)
  end

  test "should show registration_klass" do
    get registration_klass_url(@registration_klass)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_klass_url(@registration_klass)
    assert_response :success
  end

  test "should update registration_klass" do
    patch registration_klass_url(@registration_klass), params: { registration_klass: { course_id: @registration_klass.course_id, name: @registration_klass.name, school_id: @registration_klass.school_id, year: @registration_klass.year } }
    assert_redirected_to registration_klass_url(@registration_klass)
  end

  test "should destroy registration_klass" do
    assert_difference('RegistrationKlass.count', -1) do
      delete registration_klass_url(@registration_klass)
    end

    assert_redirected_to registration_klasses_url
  end
end
