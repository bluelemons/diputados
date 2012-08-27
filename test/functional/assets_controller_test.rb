require 'test_helper'

class AssetsControllerTest < ActionController::TestCase

  setup do
    @asset = assets(:escaneo_puente)
    stub_permisive_ability
  end

  test "should create asset" do
    assert_difference('Asset.count') do
      post :create, expediente_id: expedientes(:puente), asset: @asset.attributes
    end

    assert_redirected_to [:admin, @asset.adjuntable]
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, expediente_id: expedientes(:puente), id: @asset
    end

    assert_redirected_to [:admin, @asset.adjuntable]
  end

end

