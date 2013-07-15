class ExpedientesReport

  REPORTS_PATH = Rails.root.join("app/reports/")
  EXPEDIENTE_ATTRIBUTES = [ :clave, :autor, :entrada,  :firmantes, :descripcion, :estado, :tema ]
  EXPEDIENTE_DETAILED_ATTRIBUTES =  [:clave, :autor, :tema, :estado, :descripcion, :firmantes, :fechaentr, :tipoentr, :hora, :tipoperiod, :numperiodo]
  EXPEDIENTE_MAY_HAVE = [:tratamiento, :resultado, :fechases, :periodo]

  DICTAMEN = [:tipo, :fecha, :dictamen]
  COMISION = [:nombre, :entrada, :salida]

  def listado(expedientes)
    report = ODFReport::Report.new(REPORTS_PATH.join("expedientes.odt")) do |r|
      r.add_section "EXPEDIENTE_ATTRIBUTES", expedientes do |s|
        EXPEDIENTE_ATTRIBUTES.each do |attribute|
          s.add_field(attribute) { |item| item.send(attribute).to_s }
        end
      end
    end
    report.generate
  end

  def detalle expediente
    report = ODFReport::Report.new(REPORTS_PATH.join("expediente.odt")) do |r|
      EXPEDIENTE_DETAILED_ATTRIBUTES.each do |attribute|
        r.add_field(attribute, expediente.send(attribute).to_s)
      end

      r.add_section "COMISION", expediente.estados do |s|
        COMISION.each do |attribute|
          s.add_field(attribute) { |estado| estado.send(attribute).to_s }
        end
        s.add_section("DICTAMEN", :dictamenes) do |ss|
          DICTAMEN.each do |attribute|
            ss.add_field(attribute) { |n| n.send(attribute).to_s || '-' }
          end
        end
      end

      EXPEDIENTE_MAY_HAVE.each do |possible_attribute|
        if expediente.sesion
          r.add_field(possible_attribute, expediente.sesion[possible_attribute].to_s)
        else
          r.add_field(possible_attribute, '-')
        end
      end
    end

  report.generate
  end

end

