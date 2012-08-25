ActiveAdmin.register Nota do
  menu :if => proc{ can?(:create, Nota) }

  def new
    @nota = Nota.new
    @nota.pases.build
    new!
  end

  form do |f|
    render :partial => 'nota'
  end

end
