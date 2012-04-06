ActiveAdmin.register Expediente do

  actions  :index, :show

  filter :numero
  filter :tipo, :as => :select, :collection => Expediente::Tipos.invert
  filter :letra
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
end
