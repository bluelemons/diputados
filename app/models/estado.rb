class Estado < ActiveRecord::Base

  belongs_to :expediente

  def self.seed(attr)
    # TODO: Esta busqueda podría ir anotada en un paso como build_relations en
    #  este modelo o en otro lado.
    attr[:expediente_id] = Expediente.find_by_legacy_id(attr).try :id
    super(:expediente_id, :fechaent, :comision, attr)
  end
end

