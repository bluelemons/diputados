# Encoding: UTF-8
require 'test_helper'

class ExpedienteTest < ActiveSupport::TestCase
  test "la ley sobre el puente y sus relaciones" do
    @expediente = expedientes(:puente)
    assert_equal "Ley", @expediente.tipo, "el tipo no es leido correctamente"
    assert_equal temas(:edificaciones), @expediente.tema, "tema no devuelve una relacion"
    assert_equal "Mesa de entrada", @expediente.tipoentr, "la entrada no se muestra correctamente"
    assert_equal "De prorroga", @expediente.tipoperiod, "el periodo no se muestra correctamente"
    assert_equal 6, @expediente.estados.count, "No tiene los estados"
    assert_equal asuntos(:puente), @expediente.asuntos.first, "El asunto no está asociado"
    assert_equal finals(:puente), @expediente.finals.first, "El final no esta asociado"
  end

  test "Expediente debe tener un scope que muestre los expedientes del dia" do
    @expediente = expedientes(:day)
    assert Expediente.day.include?(@expediente), "este es el error"
  end

  test "Expediente debe tener un scope que muestre los expedientes de la semana" do
    @expediente = expedientes(:week)
    assert Expediente.week.include?(@expediente)
  end

  test "Expediente debe tener un scope que muestre los expedientes del mes " do
    @expediente = expedientes(:month)
    assert Expediente.month.include?(@expediente)
  end

  test "tiene un estado_actual" do
    assert_nil expedientes(:puente).estado_actual, "el puente no tiene estado_actual"
    @expediente = expedientes(:legalizacion)
    assert_equal comisions(:asuntos), @expediente.estado_actual.comision, "no anda el estado_actual"
  end

end

