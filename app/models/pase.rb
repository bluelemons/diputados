class Pase < ActiveRecord::Base

  before_destroy :chekea_ultimo

  belongs_to :nota
  belongs_to :area

  validates :nota, :presence => true
  validates :area, :presence => true
  validates :ingreso, :presence => true

  def chekea_ultimo
    if nota.pases.last != self
      errors.add :base, "No se puede borrar un pase a menos que sea el ultimo"
      false
    end
  end

end
