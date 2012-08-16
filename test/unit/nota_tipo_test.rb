require 'test_helper'

class NotaTipoTest < ActiveSupport::TestCase
   test "El nombre no puede estar en blanco" do
     nota_tipo = NotaTipo.new(:name => "algun lado")
     assert !nota_tipo.save, "No se pueden guardar tipos de notas sin letra"
   end

   test "La letra no puede estar en blanco" do
     nota_tipo = NotaTipo.new(:letra => "a")
     assert !nota_tipo.save, "No se pueden guardar tipos de notas sin nombre"
   end

   test "El nombre tiene que ser unico" do
     @nota_tipo = nota_tipos(:administrativas)
     nota_tipo = NotaTipo.new(:name => "algun lado", :letra => "AO")
     assert !nota_tipo.save, "La letra debe ser unica"
   end

   test "La letra tiene que ser unico" do
     @nota_tipo = nota_tipos(:administrativas)
     nota_tipo = NotaTipo.new(:name => "Administrativas Oficiales", :letra => "Letra")
     assert !nota_tipo.save, "El nombre debe ser unico"
   end

   test "No se pueden borrar tipo de notas si hay notas que lo usan" do
   end

end
