# Encoding: UTF-8
require 'test_helper'
require 'fileutils'

class ProyectoTest < ActiveSupport::TestCase
  test "la ley sobre el puente y sus relaciones" do
    @proyecto = expedientes(:puente)
    assert_equal "Ley", @proyecto.tipo, "el tipo no es leido correctamente"
    assert_equal temas(:edificaciones), @proyecto.tema, "tema no devuelve una relacion"
    assert_equal "Mesa de entrada", @proyecto.tipoentr, "la entrada no se muestra correctamente"
    assert_equal "De prorroga", @proyecto.tipoperiod, "el periodo no se muestra correctamente"
    assert_equal 6, @proyecto.estados.count, "No tiene los estados"
    assert_equal asuntos(:puente), @proyecto.asunto, "El asunto no está asociado"
    assert_equal finals(:puente), @proyecto.finals.first, "El final no esta asociado"
  end

  test "Proyecto debe tener un scope que muestre los proyectos del dia" do
    @proyecto = expedientes(:day)
    assert Proyecto.day.include?(@proyecto), "este es el error"
  end

  test "Proyecto debe tener un scope que muestre los proyectos de la semana" do
    @proyecto = expedientes(:week)
    assert Proyecto.week.include?(@proyecto)
  end

  test "Proyecto debe tener un scope que muestre los proyectos del mes " do
    @proyecto = expedientes(:month)
    assert Proyecto.month.include?(@proyecto)
  end

  test "tiene un estado_actual" do
    assert_nil expedientes(:puente).estado_actual, "el puente no tiene estado_actual"
    @proyecto = expedientes(:legalizacion)
    refute_nil @proyecto.estado_actual.comision, "no anda el estado_actual"
  end

  test "tiene una comisión" do
    assert_nil expedientes(:puente).comision, "en que comisión?"
    @proyecto = expedientes(:legalizacion)
    assert_equal comisions(:asuntos), @proyecto.comision, "no funca la comisión"
  end

  test "se puede buscar por comision" do
    @proyectos = Proyecto.search(:comision_id_eq => comisions(:asuntos).id).all
    assert_includes @proyectos, expedientes(:legalizacion), "legalizacion, deberia ser un resultado"
    refute_includes @proyectos, expedientes(:puente), "el puente esta en asuntos?"
  end

  test "encuentra los archivos del proyecto" do
    @proyecto = expedientes(:puente)
    FakeFS do
      archivos = ["dc1378212.pdf","dc1375212.doc"]
      base_path = Rails.root.join "public", "system", "pdf", "01-proyecto", "comunicacion"
      FileUtils::mkpath(base_path.join "finalizados")
      archivos.each do |archivo|
        File.open( File.join(base_path, archivo), "w" ){|file|}
        File.open( File.join(base_path, "finalizados", archivo), "w" ){|file|}
      end
      assert @proyecto.archivos_digitales.length == 2, "No está encontrando los arhivos."
    end
  end

end

