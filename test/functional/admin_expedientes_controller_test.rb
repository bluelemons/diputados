require 'test_helper'

class Admin::ExpedientesControllerTest < ActionController::TestCase

  setup do
    @expediente = expedientes(:puente)
  end

  test "should show index" do
    skip "Hay que actualizar por los permisos"
    get :index
    assert_response :success
  end

  test "should show detalles" do
    skip "Hay que actualizar por los permisos"
    get :show, id: @expediente
    assert_response :success
  end

  test "Se puede imprimir la busqueda" do
    skip "hay que actualizar a los odt"
    get :index, format: :pdf
    assert_response :success
  end

  test "Se puede imprimir el expediente" do
    skip "hay que actualizar a los odt"
    get :print, id: @expediente
    assert_response :success
  end

end

