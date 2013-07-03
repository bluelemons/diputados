class Backend::NotasController < Backend::AuthenticatedApplicationController

  def new
    @nota = Nota.new
    @nota.build_pases
  end

  def attributes
    [:id, :year, :ingreso, :area]
  end

end
