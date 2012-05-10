ActiveAdmin.register Expediente do

  actions :index, :show

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

  show :title=> :clave do
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Asuntos entrados", "#xtabs-2"
        li link_to "Pase por comisiones", "#xtabs-3"
        li link_to "Tratamiento en Sesion", "#xtabs-4"
        li link_to "Preferencia", "#xtabs-5" if expediente.prefers.count > 0
      end

      div(:id => "xtabs-1") do
        attributes_table_for expediente,
          :numsenado, :tema,
          :descrip, :entrada, :autor, :firmantes, :periodo,
          :estado #,:expte, :marca, :etiq

        expediente.finals.each do |final|
          div final.descripcion
        end
        
      end

      div(:id => "xtabs-2") do

        expediente.asuntos.each do |asunto|
          attributes_table_for asunto,
            :asuntoentr, :numreunion, :numsesion

          panel "Comisiones Asignadas" do
            asunto.comisiones.each do |comision|
              div comision.nombre
            end
          end
        end
      end

      div(:id => "xtabs-3") do
        expediente.estados.each do |estado|
          panel estado.comision.name do
            div "<b>Entrada </b> #{estado.fechaent}".html_safe
            estado.dictamenes.each do |dictamen|
              div do
                b dictamen[:tipo]
                div dictamen[:dictamen]
                div dictamen[:fecha]
              end
            end
            div "<b>Salida </b>#{estado.fechasal}".html_safe
          end
        end
      end

      div(:id => "xtabs-4") do
        if expediente.sesion
          attributes_table_for expediente.sesion,
            :periodo, :ordendia, :fechaordia, :numreunion, :numsesion,
            :fechases, :tratamiento, :resultado
        else
          "Este expediente no ha sido tratado en sesion"
        end
      end

      div(:id => "xtabs-5") do
        expediente.prefers.each do |pre|
          attributes_table_for pre, :fechasol, :fechapref, :tratado
        end
      end

    end
# active_admin_comments
  end

end
