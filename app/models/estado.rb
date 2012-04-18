class Estado < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo, :fechaent, :comision]

  belongs_to :expediente

end

