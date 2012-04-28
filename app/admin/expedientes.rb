ActiveAdmin.register Expediente do

  actions  :index, :show

  controller do
    respond_to :html, :xml, :json, :pdf

    def index
      super do |format|
        datos = Expediente.search(params[:q])
        format.pdf {
          output = ExpedientesReport.new.index(datos,params)
          send_data output, :filename => "expedientes.pdf",
                            :type => "application/pdf"
          }
      end
    end
  end

  filter :numero
  filter :tipo, :as => :select, :collection => Expediente::TiposColection
  filter :letra
  filter :estado
  filter :fechaentr
  filter :autor
  filter :firmantes
  filter :descripcion

  index do
    column :numero
    column :tipo
    column :letra
    column :pasada
    column :fechaentr
    default_actions
  end

  member_action :print do
    expediente = Expediente.find params[:id]
    output = ExpedientesReport.new.show(expediente)
    send_data output, :filename => "expediente.pdf",
                          :type => "application/pdf"
  end

  action_item(:only =>[:show]) do
    link_to("Imprimir", print_admin_expediente_path(expediente))
  end
end
