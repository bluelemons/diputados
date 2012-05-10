class Final < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:numero, :letra, :tipo, :pasada, :nota, :nronota,
      :fechanota, :nroexpte, :respu, :archi, :tomo, :ley, :decreto, :promu,
      :veto, :tipoveto, :expveto, :caducado]

  # @return [Expediente]
  belongs_to :expediente
  
  #dependiendo que campos se guardaron, el expediente tiene una descripcion distinta.
  def descripcion
    t = "VER ESTO"
    t = "Fin de tramite parlamentario. Nota: #{nronota} del #{promu}" if promu
    t = "Nota N:#{nronota} Archivado:#{archi}" if archi
    t
  end

end

