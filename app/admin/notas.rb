ActiveAdmin.register Nota do
  menu :if => proc{ can?(:create, Nota) }

  controller do

    def new
      @nota = Nota.new
      @nota.pases.build
      new!
    end

  end

  form do |f|
    render :partial => 'form'
  end

end
