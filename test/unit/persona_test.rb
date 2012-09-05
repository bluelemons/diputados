require 'test_helper'

class PersonaTest < ActiveSupport::TestCase

  setup do
    @persona = personas(:john)
  end

  test "name cant be blank" do
    persona = Persona.new
    assert !persona.save, "no se pueden guardar personas en blanco"
  end

  test "dni cant be repeat unless its no define" do
  end

  test "name, last_name, dni and tipo_dni must be uniq" do
  end

end
