class Area < ActiveRecord::Base

  before_destroy :chekear_sin_subareas

  belongs_to :area
  has_many :areas

  validates :name, :presence => true, :uniqueness => true

  private

    def chekear_sin_subareas
      if areas.count > 0
        errors.add :base, "No se puede borrar un area que contienen otras areas"
        false
      end
    end

end

