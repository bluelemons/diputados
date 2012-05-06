require 'test_helper'

class AsuntoTest < ActiveSupport::TestCase
  test "Se indican las comisiones asignadas" do
    asunto = asuntos(:puente)
    assert asunto.comisiones.first.kind_of?(Comision), "No tiene asignada comisiones"
    assert_equal 3, asunto.comisiones.count, "La cantidad de comisiones esta mal"
  end
end

