class Nota < Expediente

  belongs_to :primer_pase, :class_name => Pase
  belongs_to :ultimo_pase, :class_name => Pase
  has_many :areas, :through => :ultimo_pase

  validates :pases, :presence => true

  accepts_nested_attributes_for :pases

  def area_actual
    ultimo_pase.area
  end

  def year
    ingreso.strftime("%Y")
  end

  def ingreso
    primer_pase.ingreso
  end
end
