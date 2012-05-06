class Estado < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo, :fechaent, :comision_id]

  belongs_to :expediente
  belongs_to :comision

end

