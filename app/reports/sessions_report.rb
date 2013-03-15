class SessionsReport
  def detalle(sessions)
    report = ODFReport::Report.new(Rails.root.join("app/reports/sessions.odt")) do |r|
      r.add_section "SESSION", sessions do |s|
        expediente.attributes.each do |attr|
          add_field(s, attr)
        end
      end
    end
    report_file_name = report.generate
  end
end
