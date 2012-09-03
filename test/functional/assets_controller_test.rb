require 'test_helper'

class AssetsControllerTest < ActionController::TestCase

  setup do
    @asset = assets(:escaneo_puente)
    @expediente = expedientes(:puente)
    stub_permisive_ability
  end

  test "should create asset" do
    @asset = Asset.new
    @asset.asset = fixture_file_upload('files/dc1378212.pdf')

    assert_difference('Asset.count') do
      post :create, expediente_id: @expediente.to_param, asset: @asset
    end

    assert_redirected_to [:admin, @expediente]
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, expediente_id: @expediente.to_param, id: @asset.to_param
    end

    assert_redirected_to [:admin, @asset.adjuntable]
  end

end

