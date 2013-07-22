class WeeklySession < ActiveRecord::Base
  belongs_to :session_type
  has_many :pases

  attr_accessible :numero_de_periodo, :numero_de_reunion, :numero_de_sesion,
   :session_type_id

  validates :numero_de_sesion, presence: true
  validates :numero_de_periodo, presence: true
  validates :session_type, presence: true
  validates :numero_de_reunion, presence: true

  def to_s
    "Sesion: #{numero_de_sesion} Periodo: #{numero_de_periodo} Reunion: #{numero_de_reunion} Tipo: #{session_type}"
  end
end
