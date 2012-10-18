class Final < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:numero, :letra, :tipo, :pasada, :nota, :nronota,
      :fechanota, :nroexpte, :respu, :archi, :tomo, :ley, :decreto, :promu,
      :veto, :tipoveto, :expveto, :caducado]

  # @return [Expediente]
  belongs_to :expediente

  #dependiendo que campos se guardaron, el expediente tiene una descripcion distinta.
  def descripcion
    [descripcion_promulgado, descripcion_respuesta, descripcion_archivado].compact.join ", "
  end

  private

  def descripcion_promulgado
    "Fin de tramite parlamentario. Nota: #{nronota} del #{I18n.l promu}, en #{I18n.l fechanota}" if promu?
  end

  def descripcion_respuesta
    "Respuesta: #{I18n.l respu}" if respu?
  end

  def descripcion_archivado
    "Archivado: #{I18n.l archi}" if archi?
  end

end

