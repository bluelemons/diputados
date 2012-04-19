class Final < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:numero, :letra, :tipo, :pasada, :nota, :nronota,
      :fechanota, :nroexpte, :respu, :archi, :tomo, :ley, :decreto, :promu,
      :veto, :tipoveto, :expveto, :caducado]

  # @return [Expediente]
  belongs_to :expediente
end

