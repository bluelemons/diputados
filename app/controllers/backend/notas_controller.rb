class Backend::NotasController < Backend::AuthenticatedApplicationController

  def new
    @nota = Nota.new
    @nota.build_pases
  end

  def show

    @nota = Nota.find(params[:id])
    @nota.build_pases

    @tags = []
    @nota.tags.each do |t|
      @tags.push t.name
    end
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
