class Prefer < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo, :fechapref]

  belongs_to :expediente
end

