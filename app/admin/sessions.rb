ActiveAdmin.register Session do
  menu :if => proc{ can?(:manage, Session) }

  filter :numero_de_periodo
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
      f.input :fecha, as: :string, input_html: { class: 'datepicker' }
      f.input :numero_de_periodo
    end
    f.buttons
  end

end

