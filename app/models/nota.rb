class Nota < ActiveRecord::Base
  has_many :pases
  belongs_to :iniciador

  validates :pases, :presence => true
  validates :iniciador, :presence => true

  accepts_nested_attributes_for :pases
end
