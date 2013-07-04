class Backend::NotasController < Backend::AuthenticatedApplicationController

  def new
    @nota = Nota.new
    @nota.build_pases
  end

  def edit
    @nota = Nota.find(params[:id])
    @nota.build_pases
    render 'edit'
  end

  def attributes
    [:id, :year, :ingreso, :area]
  end

end
