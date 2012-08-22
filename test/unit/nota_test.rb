require 'test_helper'

class NotaTest < ActiveSupport::TestCase

  test "No se pueden crear notas sin un primer paso." do
    nota = Nota.new
    assert !nota.save, "la nota no se puede crear sin un primer paso."
    @area = areas(:comision)
    @iniciador = iniciadors(:oldani)
    nota = Nota.new(:pases_attributes => [{:ingreso => Date.new, :nota => nota, :area => @area}])
    assert !nota.save, "no se puede crear notas sin iniciador"
    nota.iniciador = @iniciador
    assert nota.save
  end

  test "solo se pueden borrar notas sin pases" do
    pending "Hay que ver, porque dijimos que no se puede crear notas sin pases."
  end

end
