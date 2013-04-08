class Session < ActiveRecord::Base
  belongs_to :area
  belongs_to :session_type
  has_many :pases
  
  validates :numero_de_sesion, presence: true
  validates :numero_de_periodo, presence: true
  validates :session_type, presence: true
  validates :numero_de_reunion, presence: true
  
  def to_s
    "Sesion: #{numero_de_sesion} Periodo: #{numero_de_periodo} Reunion: #{numero_de_reunion} Tipo: #{session_type}"
  end
end
