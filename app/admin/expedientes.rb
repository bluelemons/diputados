ActiveAdmin.register Expediente do

  actions :index, :show

  scope :all, :default => true
  scope :week
  scope :month

  controller do
    respond_to :html, :xml, :json, :pdf

    def index
      super do |format|
        format.pdf {
          @expedientes = Expediente.search(params[:q])
          report = ODFReport::Report.new(Rails.root.join("app/reports/expedientes.odt")) do |r|
            r.add_table("EXPEDIENTES", @expedientes, :header=>true) do |t|
              t.add_column(:clave) { |item| item.clave.to_s }
              t.add_column(:entrada) { |item| item.entrada.to_s }
              t.add_column(:autor) { |item| item.autor.to_s }
              t.add_column(:firmantes) { |item| item.firmantes.to_s }
              t.add_column(:descripcion) { |item| item.descrip.to_s }

            end
          end

          report_file_name = report.generate

          send_file(report_file_name)
          }
      end
    end
  end

  filter :numero
  filter :tipo, :as => :select, :collection => Expediente::TiposColection
  filter :estado
  filter :fechaentr
  filter :autor, :as => :select,
    :collection => Diputado.pluck(:nombre).concat(Senado.pluck(:nombre)).sort
  filter :firmantes
  filter :descrip, :label => "Descripcion"

  index do
    column :numero
    column :tipo
    column :pasada
    column :fechaentr
    column :descrip, :html_descrip
    default_actions
  end

  member_action :print do

    @expediente = Expediente.find(params[:id])

    report = ODFReport::Report.new(Rails.root.join("app/reports/expediente.odt")) do |r|

      r.add_field(:clave,         @expediente.clave.to_s)
      r.add_field(:autor,         @expediente.autor.to_s)
      r.add_field(:tema,          @expediente.tema.to_s)
      r.add_field(:estado,        @expediente.estado.to_s)
      r.add_field(:descripcion,   @expediente.descrip.mb_chars.capitalize)
      r.add_field(:firmantes,     @expediente.firmantes.to_s)

      r.add_field(:fechaentr,     @expediente.fechaentr.to_s)
      r.add_field(:tipoentr,      @expediente.tipoentr.to_s)
      r.add_field(:hora,          @expediente.hora.to_s)
      r.add_field(:tipoperiod,    @expediente.tipoperiod.to_s)
      r.add_field(:numperiodo,    @expediente.numperiodo.to_s)

      r.add_field(:tratamiento,   @expediente.sesion.tratamiento.to_s)
      r.add_field(:resultado,     @expediente.sesion.resultado.to_s)
      r.add_field(:fechases,      @expediente.sesion.fechases.to_s)
      r.add_field(:periodo,       @expediente.sesion.periodo.to_s)

      r.add_section "COMISION", @expediente.estados do |s|
        s.add_field(:nombre) { |estado| estado.comision.nombre }
        s.add_field(:entrada) { |estado| estado.fechaent }
        s.add_field(:salida) { |estado| estado.fechasal }
        s.add_section("DICTAMEN", :dictamenes) do |ss|

          ss.add_field(:tipo) { |n| n[:tipo].to_s }
          ss.add_field(:fecha) { |n| n[:fecha].to_s }
          ss.add_field(:dictamen) { |n| n[:dictamen].to_s }
        end
      end

    end

    report_file_name = report.generate

    send_file(report_file_name)

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
          panel estado.comision.try(:name) do
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

