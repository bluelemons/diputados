require 'test_helper'

class Admin::NotaTiposControllerTest < ActionController::TestCase

  setup do
    @area = areas(:ao)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin_users(:admin)
  end

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show detalles" do
    get :show, id: @area
    assert_response :success
  end

  test "should show new" do
    get :new
    assert_response :success
  end

  test "should show edit" do
    get :edit, id: @area
    assert_response :success
  end

end
