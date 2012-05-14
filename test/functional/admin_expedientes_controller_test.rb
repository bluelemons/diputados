require 'test_helper'

class Admin::ExpedientesControllerTest < ActionController::TestCase

  setup do
    @expediente = expedientes(:puente)
  end

  test "should show index" do
    get :index
    assert_response :success
  end

end

