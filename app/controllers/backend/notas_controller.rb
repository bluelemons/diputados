class Backend::NotasController < Backend::AuthenticatedApplicationController

  def new
    @nota = Nota.new
    @nota.build_pases
    @nota.build_initiator
  end

  def show
    @nota = Nota.find(params[:id])

    @tags = @nota.tags.map do |t|
      t.name
    end
  end

  def attributes
    [:id, :year, :ingreso, :area]
  end

end
