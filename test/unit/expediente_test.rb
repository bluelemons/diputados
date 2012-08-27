# Encoding: UTF-8
require 'test_helper'
require 'fakefs'
require 'fileutils'

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
    refute_nil @expediente.estado_actual.comision, "no anda el estado_actual"
  end

  test "tiene una comisión" do
    assert_nil expedientes(:puente).comision, "en que comisión?"
    @expediente = expedientes(:legalizacion)
    assert_equal comisions(:asuntos), @expediente.comision, "no funca la comisión"
  end

  test "se puede buscar por comision" do
    @expedientes = Expediente.search(:comision_id_eq => comisions(:asuntos).id).all
    assert_includes @expedientes, expedientes(:legalizacion), "legalizacion, deberia ser un resultado"
    refute_includes @expedientes, expedientes(:puente), "el puente esta en asuntos?"
  end

  test "encuentra los archivos del expediente" do
    @expediente = expedientes(:puente)
    FakeFS do

      archivos = ["dc1378212.pdf","dc1375212.doc"]
      base_path = Rails.root.join "public", "system", "pdf", "01-proyecto", "comunicacion"
      FileUtils::mkpath(base_path.join "finalizados")
      archivos.each do |archivo|
        File.open( File.join(base_path, archivo), "w" ){|file|}
        File.open( File.join(base_path, "finalizados", archivo), "w" ){|file|}
      end

      assert @expediente.archivos_digitales.length == 2, "No está encontrando los arhivos."
    end
  end

end

