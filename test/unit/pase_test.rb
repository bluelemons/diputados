# Encoding: UTF-8
require 'test_helper'

class PaseTest < ActiveSupport::TestCase

  def setup
    @pase = pases(:entrada)
  end

  test "Datos de pase" do
    assert @pase.valid?, "Fixture invalido: #{@pase.errors.full_messages}"
    pase_sin_area = @pase.clone.tap { |p| p.ingreso = nil }
    refute pase_sin_area.valid?, "es valido un pase a ningun lado?"
    pase_sin_ingreso = @pase.clone.tap { |p| p.ingreso = nil }
    refute pase_sin_area.valid?, "es valido un pase sin fecha?"
    pase_sin_expediente = @pase.clone.tap { |p| p.expediente = nil }
    refute pase_sin_expediente.valid?, "es valido un pase de ningun expediente?"
  end

  test "Un pase no puede tener una fecha de ingreso mayor a la del dia" do
    pending
    @pase.ingreso = Date.tomorrow
    refute @pase.valid?, "Son validos los pases futuros"
  end

end

