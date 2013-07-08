class Area < ActiveRecord::Base
  before_destroy :checkear_sin_subareas, :checkear_sin_notas

  has_many :areas
  belongs_to :area
  has_many :pases
  has_many :expedientes, :through => :pases

  validates :name, :presence => true, :uniqueness => true

  def checkear_sin_subareas
    if areas.count > 0
      errors.add :base, "No se puede borrar un area que contienen otras areas"
      false
    end
  end

  def checkear_sin_notas
    if expedientes.count > 0
      errors.add :base, "No se puede borrar un area que contienen notas"
      false
    end
  end

end
