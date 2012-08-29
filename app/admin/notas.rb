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

  show do
    attributes_table_for nota,
      :fojas, :iniciador

    panel "Pases" do
      table_for nota.pases do
        column :ingreso
        column :area
        column :descripcion
      end
    end

    panel "Agregar Pase" do
      render :partial => 'admin/pases/form',
             :locals => { :pase => nota.pases.build }
    end

  end

end
