class Estado < ActiveRecord::Base

  belongs_to :expediente

  def self.seed(attr)
    attr[:expediente_id] = Expediente.where("numero = ? and letra = ? and pasada = ? and tipo = ? ",
        attr[:numero], attr[:letra], attr[:pasada], attr[:tipo]).first.id
    super(:expediente_id, :fechaent, :comision, attr)
  end
end

