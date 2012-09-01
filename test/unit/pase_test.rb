require 'test_helper'

class PaseTest < ActiveSupport::TestCase
  test "Datos de pase" do
    @nota = expedientes(:despacho)
    @area = areas(:comision)
    pase = Pase.new
    assert !pase.save, "falta fecha de ingreso"
    pase.ingreso = Date.new
    assert !pase.save, "falta un destino"
    pase.area = @area
    assert pase.save
  end

  test "Un pase solo se puede borrar si es el ultimo pase de una nota" do
    @nota = expedientes(:despacho)
    @pase = @nota.pases.first
    assert !@pase.destroy, "no se pueden borrar pases a menos que sea el ultimo"
    @pase = @nota.pases.last
    assert @pase.destroy
  end

  test "Un pase no puede tener una fecha de ingreso mayor a la del dia" do
    pending
  end

  test "Un pase no puede tener un ingreso anterior al que tiene el pase anterior" do
    pending
  end

end
