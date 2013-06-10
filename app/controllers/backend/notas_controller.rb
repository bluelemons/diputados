class Backend::NotasController < Backend::ApplicationController
  def attributes
    [:id, :año, :ingreso, :ultimo_pase_area]
  end
end
