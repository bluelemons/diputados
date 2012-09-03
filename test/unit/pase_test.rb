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

  test "si no se completa el ingreso del pase, tiene que tomar la fecha actual" do
  end

  test "cuando se crea un primer pase, se tiene que guardar en la nota" do
#    @area = areas(:comision)
#    @pase = Pase.new(:ingreso => Date.new, :area => @area)
#    @pase.save
#    @nota = Nota.new
#    @nota.pases.push @pase
#    binding.pry
#    @nota.save
#    assert_equal @nota.pases.first, @nota.primer_pase
     pending "no se como testear esto, dejo comentado arriba mi intento"
  end

  test "cuando se crea un pase se tiene que sobre escribir como ultimo pase" do
    @area = areas(:comision)
    @nota = expedientes(:despacho)
    pase = Pase.new(:area => @area, :expediente => @nota, :ingreso => Date.new)
    assert pase.save
    assert_equal @nota.pases.last, @nota.ultimo_pase
  end

end
