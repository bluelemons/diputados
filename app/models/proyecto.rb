class Proyecto < Expediente

  def return_to_comision?
    sesions.any? { |sesion| sesion.return_to_comision? }
  end

  def reasigned_comisions
    sesion.comisiones if return_to_comision?
  end

end
