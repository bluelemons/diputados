class Proyecto < Expediente

  def return_to_comision?
    sesions.any? { |sesion| sesion.return_to_comision? }
  end

  def reasignments
    sesions.map do |sesion|
      sesion.comisiones if sesion.return_to_comision?
    end.compact
  end

end
