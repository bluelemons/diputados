class Estado < ActiveRecord::Base

  belongs_to :expediente

  def self.seed(attr)
    # REFACTOR:
    # attr[:expediente_id] = Expediente.find_by_legacy_id(attr).id

    attr[:expediente_id] = Expediente.where("numero = ? and letra = ? and pasada = ? and tipo = ? ",
        attr[:numero], attr[:letra], attr[:pasada], attr[:tipo]).first.id
    super(:expediente_id, :fechaent, :comision, attr)
  end
end

