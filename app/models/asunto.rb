class Asunto < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo, :asuntoentr]

  # @return [Expediente]
  belongs_to :expediente

  # @return [ActiveRecord::Relation] Comisiones asignadas al expediente.
  def comisiones
    Comision.where :id => [comision1, comision2, comision3, comision4,
                           comision5, comision6]
  end

end

