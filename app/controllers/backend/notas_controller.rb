class Backend::NotasController < Backend::ApplicationController
  def attributes
    [:id, :year, :ingreso, :ultimo_pase_area]
  end
end
