require 'test_helper'

class IniciadorTest < ActiveSupport::TestCase
  test "El nombre de iniciador" do
    iniciador = Iniciador.new
    assert !iniciador.save, "Debe tener un nombre"
    iniciador.name ="Diputado Oldani Pablo"
    assert !iniciador.save, "El nombre no puede estar repetido"
    iniciador.name = "Eloy Espicano"
    assert !iniciador.save, "falta el tipo"
    tipo = iniciador_tipos(:municipios)
    iniciador.iniciador_tipo = tipo
    assert iniciador.save
  end
end
