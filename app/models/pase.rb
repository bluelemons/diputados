class Pase < ActiveRecord::Base

  before_save :asigna_ingreso
  after_save :asigna_primer_pase, :asigna_ultimo_pase
  before_destroy :chekea_ultimo

  belongs_to :expediente
  belongs_to :area

  validates :area, :presence => true

  def chekea_ultimo
    if expediente.pases.last != self
      errors.add :base, "No se puede borrar un pase a menos que sea el ultimo"
      false
    end
  end

  def asigna_primer_pase
    if expediente and expediente.pases.count == 1
      expediente.primer_pase = self
      expediente.save
    end
  end

  def asigna_ultimo_pase
    if expediente
      expediente.ultimo_pase = self
      expediente.save
    end
  end

  def asigna_ingreso
    self.ingreso = ingreso || Date.today
  end

end
