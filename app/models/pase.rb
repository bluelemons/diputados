class Pase < ActiveRecord::Base

  belongs_to :expediente
  belongs_to :area

  validates :area, :presence => true

end

