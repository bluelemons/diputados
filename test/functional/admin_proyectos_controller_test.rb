require 'test_helper'

class Admin::ProyectosControllerTest < ActionController::TestCase

  setup do
    @proyecto = expedientes(:puente)
#    stub_permisive_ability
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin_users(:admin)
  end

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show detalles" do
    get :show, id: @proyecto
    assert_response :success
  end

  test "no se rompe si no tiene asunto" do
    get :show, id: expedientes(:legalizacion).to_param
    assert_response :success
  end

  test "Se puede imprimir la busqueda" do
    get :index, format: :pdf
    assert_response :success
    assert_equal "application/vnd.oasis.opendocument.text", response.content_type, "an odt file was expected"
  end

  test "Se puede imprimir el proyecto" do
    get :print, id: @proyecto
    assert_response :success
    assert_equal "application/vnd.oasis.opendocument.text", response.content_type, "an odt file was expected"
  end

end

