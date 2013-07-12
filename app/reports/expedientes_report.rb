class ExpedientesReport
  EXPEDIENTE_ATTRIBUTES = [ :clave, :autor, :entrada,  :firmantes, :descripcion, :estado, :tema ]
  EXPEDIENTE_DETAILED_ATTRIBUTES =  [:clave, :autor, :tema, :estado, :descripcion, :firmantes, :fechaentr, :tipoentr, :hora, :tipoperiod, :numperiodo]
  EXPEDIENTE_MAY_HAVE = [:tratamiento, :resultado, :fechases, :periodo]
  COMISION = [:nombre_comision, :fechaentr, :fechasal]
  DICTAMEN = [:tipo, :fecha, :dictamen]

  def listado(expedientes)
    report = ODFReport::Report.new(Rails.root.join("app/reports/expedientes.odt")) do |r|
      r.add_section "EXPEDIENTES", expedientes do |s|
        EXPEDIENTE_ATTRIBUTES.each do |attribute|
          s.add_field(attribute) { |item| item.send(attribute).to_s }
        end
      end
    end
    report.generate
  end

  def detalle(expediente)

    report = ODFReport::Report.new(Rails.root.join("app/reports/expediente.odt")) do |r|

      EXPEDIENTE_DETAILED_ATTRIBUTES.each do |attribute|
        r.add_field(attribute, expediente.send(attribute).to_s)
      end

      EXPEDIENTE_MAY_HAVE.each do |possible_attribute|
        if expediente.sesion
          r.add_field(possible_attribute, expediente.sesion[possible_attribute].to_s)
        else
          r.add_field(possible_attribute, '-')
        end
      end

      r.add_section "COMISION", expediente.estados do |s|
        COMISION.each do |attribute|
          s.add_field(attribute) { |item| item[attribute].to_s }
        end
        s.add_section("DICTAMEN", :dictamenes) do |ss|
          DICTAMEN.each do |attribute|
            ss.add_field(attribute) { |item| item.send(attribute).to_s }
          end
        end
      end
    end
  report.generate
  end

end

