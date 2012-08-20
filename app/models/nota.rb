class Nota < ActiveRecord::Base
  has_many :pases
  validates :pases, :presence => true

  accepts_nested_attributes_for :pases
end
