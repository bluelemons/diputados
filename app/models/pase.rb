class Pase < ActiveRecord::Base

  before_destroy :chekea_ultimo

  belongs_to :expediente
  belongs_to :area

  validates :area, :presence => true
  validates :ingreso, :presence => true

  def chekea_ultimo
    if expediente.pases.last != self
      errors.add :base, "No se puede borrar un pase a menos que sea el ultimo"
      false
    end
  end

end
