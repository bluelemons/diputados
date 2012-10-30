require 'test_helper'

class ExpedientePathHelperTest < ActionView::TestCase

  def test_proyecto_paths
    proyecto = expedientes(:puente)
    asset = proyecto.assets.build
    assert_equal polymorphic_path([proyecto, asset]), expediente_assets_path(proyecto, asset)
  end

end

