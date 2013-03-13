class Asunto < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo, :asuntoentr]

  # @return [Expediente]
  belongs_to :expediente

  # @return [Array<Comision>] Comisiones asignadas en el orden correcto.
  def comisiones
    comisiones_ids = [comision6, comision5, comision4, comision3, comision2,
      comision1].delete_if { |i| i == 0 }
    # I make use of an on memory array to avoid multiple queries.
    comisiones_array = Comision.where(:id => comisiones_ids).all
    comisiones_ids.map do |i|
      comisiones_array.detect { |c| c.id == i }
    end
  end

end

