require 'test_helper'

class PaseTest < ActiveSupport::TestCase
  test "siempre tiene una nota" do
    @nota = notas(:despacho)
    @area = areas(:comision)
    pase = Pase.new(:ingreso => Date.new, :area_id => @area.id)
    assert !pase.save, "falta nota"
    pase.nota_id = @nota.id
    assert pase.save
  end

  test "siempre tiene un area (destino)" do
    @nota = notas(:despacho)
    @area = areas(:comision)
    pase = Pase.new(:ingreso => Date.new, :nota_id => @nota.id)
    assert !pase.save, "falta un destino"
    pase.area_id = @area.id
    assert pase.save
  end

  test "Tiene que tener fecha" do
    @nota = notas(:despacho)
    @area = areas(:comision)
    pase = Pase.new(:area_id => @area.id, :nota_id => @nota.id)
    assert !pase.save, "falta fecha de ingreso"
    pase.ingreso = Date.new
    assert pase.save
  end

  test "Un pase solo se puede borrar si es el ultimo pase de una nota" do
    @nota = notas(:despacho)
    @pase = @nota.pases.first
    assert !@pase.destroy, "no se pueden borrar pases a menos que sea el ultimo"
    @pase = @nota.pases.last
    assert @pase.destroy
  end

end
