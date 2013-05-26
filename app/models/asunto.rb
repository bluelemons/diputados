class Asunto < ActiveRecord::Base
  include Comisionable

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo, :asuntoentr]

  # @return [Expediente]
  belongs_to :expediente

end

