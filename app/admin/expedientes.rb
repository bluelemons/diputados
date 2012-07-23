ActiveAdmin.register Expediente do

  before_filter :only => :index do |controller|
    @per_page = 300 if ['application/pdf', 'application/xml'].include?(request.format)
  end

  actions :index, :show

  scope :all, :default => true
  scope :week
  scope :month

  controller do
    respond_to :html, :xml, :json, :pdf

    def index(options={}, &block)
      super(options) do |format|
        block.call(format) if block
        format.pdf {
          report = ExpedientesReport.new.detalle @expedientes
          send_file(report)
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
    column :descrip
    default_actions
  end

  member_action :print do

    report = ExpedientesReport.new.listado(params)
    send_file(report)

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

        panel "Archivos" do
          expediente.archivos_digitales.each do |archivo|
            div link_to archivo, archivo
          end
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

