class Nota < ActiveRecord::Base
  has_many :pases
  has_many :assets, :as => :adjuntable

  validates :pases, :presence => true

  accepts_nested_attributes_for :pases

  def year
    ingreso.strftime("%Y")
  end

  def ingreso
    pases.last.ingreso
  end
end
