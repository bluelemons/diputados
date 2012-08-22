class Iniciador < ActiveRecord::Base

  belongs_to :iniciador_tipo

  validates :name, :presence => true, :uniqueness => true
  validates :iniciador_tipo, :presence => true

end
