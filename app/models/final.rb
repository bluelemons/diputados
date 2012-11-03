class Final < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:numero, :letra, :tipo, :pasada, :nota, :nronota,
      :fechanota, :nroexpte, :respu, :archi, :tomo, :ley, :decreto, :promu,
      :veto, :tipoveto, :expveto, :caducado]

  # @return [Expediente]
  belongs_to :expediente

  #dependiendo que campos se guardaron, el expediente tiene una descripcion distinta.
  def descripcion
    [descripcion_nota, descripcion_promulgado, descripcion_respuesta, descripcion_archivado].compact.join ", "
  end

  private

  def descripcion_nota
   "Nota: #{nronota} del #{I18n.l fechanota}" if nronota?
  end

  def descripcion_promulgado
    "Fin de tramite parlamentario el #{I18n.l promu}" if promu?
  end

  def descripcion_respuesta
    "Contestado: #{I18n.l respu}" if respu?
  end

  def descripcion_archivado
    "Archivado: #{I18n.l archi}" if archi?
  end

end
