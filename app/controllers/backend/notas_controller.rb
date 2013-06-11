class Backend::NotasController < Backend::ApplicationController
  def attributes
    [:id, :year, :ingreso, :area]
  end
end
