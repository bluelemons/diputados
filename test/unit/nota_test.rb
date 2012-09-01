# Encoding: UTF-8
require 'test_helper'

class NotaTest < ActiveSupport::TestCase

  test "No se pueden crear notas sin un primer paso." do
    nota = Nota.new
    assert !nota.save, "la nota no se puede crear sin un primer paso."
    @area = areas(:comision)
    nota = Nota.new(:pases_attributes => [{:ingreso => Date.new, :area => @area}])
    assert nota.save
  end

  test "solo se pueden borrar notas sin pases" do
    pending "Hay que ver, porque dijimos que no se puede crear notas sin pases."
  end

  test "year tiene que devolver el año del primer pase" do
    nota = notas(:despacho)
    assert_equal nota.year, "2012"
  end

  test "ingreso tiene que mostrar el ingreso del primer pase" do
    nota = notas(:despacho)
    assert_equal nota.ingreso, Date.new(2012, 8, 17)
  end

end
