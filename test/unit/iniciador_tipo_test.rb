require 'test_helper'

class IniciadorTipoTest < ActiveSupport::TestCase
  test "El nombre tipo" do
    tipo = IniciadorTipo.new
    assert !tipo.save, "debe tener un nombre"
    tipo.name = "administrativos oficiales"
    assert !tipo.save, "el nombre no puede estar repetido"
    tipo.name = "cualquier otro nombre"
    assert tipo.save
  end
end
