class Pase < ActiveRecord::Base

  belongs_to :expediente
  belongs_to :area

  validates :expediente_id, :presence => true
  validates :area_id, :presence => true
  validates :ingreso, :presence => true

end

