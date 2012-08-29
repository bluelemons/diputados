class Iniciador < ActiveRecord::Base

  belongs_to :iniciador_tipo
  belongs_to :nota_tipo

  validates :name, :presence => true, :uniqueness => true
  validates :iniciador_tipo, :presence => true

  delegate :letra, :to => :nota_tipo, :prefix => false, :allow_nil => true
  delegate :name, :to => :iniciador_tipo, :prefix => true
end
