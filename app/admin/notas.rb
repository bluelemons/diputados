ActiveAdmin.register Nota do
  menu :if => proc{ can?(:manage, Nota) }

  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    def new
      @nota = Nota.new
      @nota.pases.build
      new!
    end

  end

  filter :id
  filter :iniciador_name, :as => :string
  filter :iniciador_iniciador_tipo_name, :as => :select, :label => "Tipo Iniciador", :collection => IniciadorTipo.all
  filter :iniciador_nota_tipo_name, :as => :select, :label => "Tipo de nota", :collection => NotaTipo.all
  filter :pases_descripcion, :as => :string
  filter :pases_ingreso, :as => :date_range

  index do
    column :id
    column :year
    column :letra
    column :iniciador
    column :iniciador_tipo_name
    column :ingreso
    column :fojas
#    column :fin_tramite
    default_actions
  end

  form do |f|
    render :partial => 'form'
  end

  show do
    attributes_table_for nota,
      :fojas, :iniciador, :iniciador_tipo_name, :letra

    panel "Pases" do
      table_for nota.pases do
        column :ingreso
        column :area
        column :descripcion
      end
    end

    if can? :manage, Nota
      panel "Agregar Pase" do
        render :partial => 'admin/pases/form',
               :locals => { :pase => nota.pases.build }
      end
    end
    panel "Archivos" do
      table_for nota.assets do
        column "Nombre" do |a|
          link_to a.asset_file_name, a.asset.url
        end
        if current_ability.can? :manage, Asset
          column "Borrar" do |asset|
            link_to("Borrar", [nota, asset], :confirm => "seguro?", :method => :delete)
          end
        end
      end
    end
    if can? :manage, Asset
      div do
        render :partial => 'assets/add_form',
               :locals => { :adjuntable => nota, :asset => nota.assets.build }
      end
    end

  end

end
