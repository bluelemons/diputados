class Nota < ActiveRecord::Base
  has_many :pases
  has_many :assets, :as => :adjuntable
  belongs_to :iniciador

  validates :pases, :presence => true
  validates :iniciador, :presence => true

  accepts_nested_attributes_for :pases

  delegate :letra, :iniciador_tipo_name, :to => :iniciador, :prefix => false, :allow_nil => true

  def year
    ingreso.strftime("%Y")
  end

  def ingreso
    pases.last.ingreso
  end
end
