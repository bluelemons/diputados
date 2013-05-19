class Nota < Expediente

  belongs_to :primer_pase, class_name: Pase
  belongs_to :ultimo_pase, class_name: Pase
  has_many :areas, through: :ultimo_pase

  validates :pases, presence: true

  accepts_nested_attributes_for :pases

  delegate :area, to: :ultimo_pase, prefix: true
  delegate :ingreso, to: :primer_pase
  delegate :initiators_kind_name, to: :initiator, allow_nil: true

  def year
    ingreso.strftime("%Y")
  end

  def build_pases
    pases.build if pases.empty?
    pases
  end
end
