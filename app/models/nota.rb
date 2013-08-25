class Nota < Expediente

  belongs_to :primer_pase, class_name: Pase
  belongs_to :ultimo_pase, class_name: Pase
  has_many :areas, through: :ultimo_pase

  validates :pases, presence: true

  accepts_nested_attributes_for :pases

  before_save :check_pases

  delegate :area, to: :ultimo_pase, prefix: true
  delegate :ingreso, to: :primer_pase

  def check_pases
    self.primer_pase = pases.first
    self.ultimo_pase = pases.last
  end

  def year
    ingreso.strftime("%Y")
  end

  def build_pases
    pases.build if pases.empty?
    pases
  end

  def area
    self.ultimo_pase.area.name
  end

end
