class Session < ActiveRecord::Base
  belongs_to :area
  belongs_to :pase
  belongs_to :session_type
  
  validates :numero_de_sesion, presence: true
  validates :numero_de_periodo, presence: true
  validates :session_type, presence: true
  validates :numero_de_reunion, presence: true
end
