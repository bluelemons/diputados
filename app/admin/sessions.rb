ActiveAdmin.register Session do
  menu :if => proc{ can?(:manage, Session) }

  filter :numero_de_periodo
  filter :numero_de_reunion
  filter :session_type
  filter :numero_de_sesion
  filter :fecha, :as => :date_range
  filter :area
  
  controller do
    respond_to :html, :xml, :json, :pdf

    def index(options={}, &block)
      super(options) do |format|
        block.call(format) if block
        format.pdf {
          report = SessionsReport.new.detalle @sessions
          send_file report, :type => "application/vnd.oasis.opendocument.text"
        }
      end
    end
  end
  
  form do |f|
    f.inputs "" do
      f.input :numero_de_sesion
      f.input :numero_de_periodo
      f.input :session_type
      f.input :numero_de_reunion
      f.input :fecha, as: :string, input_html: { class: 'datepicker' }
    end
    f.buttons
  end

  action_item :only => :show do
    link_to "Expedientes de la sesión", admin_session_pases_path(session)
  end
end

