class Estado < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:expediente_id, :fechaent, :comision]

  belongs_to :expediente

end

