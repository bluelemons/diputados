class Backend::NotasController < Backend::ApplicationController

def new
  @nota = Nota.new
  @nota.build_pases
end

  def attributes
    [:id, :year, :ingreso, :area]
  end
end
