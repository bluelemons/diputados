require 'test_helper'

class Admin::ExpedientesControllerTest < ActionController::TestCase

  setup do
    @expediente = expedientes(:puente)
  end

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show detalles" do
    get :show, id: @expediente
    assert_response :success
  end

  test "Se puede imprimir la busqueda" do
    get :index, format: :pdf
    assert_response :success
  end

  test "Se puede imprimir el expediente" do
    get :print, id: @expediente
    assert_response :success
  end

end

