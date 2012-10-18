require 'test_helper'

class FinalTest < ActiveSupport::TestCase

  test "la descripcion" do
    descripcion_promulgado = "Fin de tramite parlamentario. Nota: 150905 del 8/9/2005, en 20/7/2005"
    descripcion_archivado = "Archivado: 15/9/2005"
    descripcion_respuesta = "Respuesta: 15/8/2005"

    @final = finals(:puente)
    assert_equal descripcion_promulgado, @final.descripcion

    @final.archi = Date.new(2005, 9, 15)
    assert_equal "#{descripcion_promulgado}, #{descripcion_archivado}",
                 @final.descripcion

    @final.promu = nil
    assert_equal descripcion_archivado, @final.descripcion

    @final.respu = Date.new(2005, 8, 15)
    assert_equal "#{descripcion_respuesta}, #{descripcion_archivado}",
                 @final.descripcion

    @final.archi = nil
    assert_equal descripcion_respuesta, @final.descripcion
  end

end

