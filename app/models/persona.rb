class Persona < ActiveRecord::Base
  validates :name, :presence => true
end
