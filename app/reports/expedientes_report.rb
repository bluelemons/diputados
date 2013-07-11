class ExpedientesReport
  EXPEDIENTE_ATTRIBUTES = [ :clave, :autor, :entrada,  :firmantes, :descripcion, :estado, :tema ]
  EXPEDIENTE_DETAILED_ATTRIBUTES =  [:clave, :autor, :tema, :estado, :descripcion, :firmantes, :fechaentr, :tipoentr, :hora, :tipoperiod, :numperiodo]
  EXPEDIENTE_MAY_HAVE = [:tratamiento, :resultado, :fechases, :periodo]
  COMISION = [:comision_nombre, :fechaentr, :fechasal]
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
      # debugger
        EXPEDIENTE_MAY_HAVE.each do |possible_attribute|
          if expediente.sesion
            r.add_field(possible_attribute, expediente.sesion[possible_attribute].to_s)
          else
            r.add_field(possible_attribute, '-')
          end
        end

      r.add_section "COMISION", expediente.estados do |s|
        COMISION.each do |attribute|
          s.add_field(attribute) { |item| item.send(attribute).to_s }
        end
        # s.add_field(:comision_nombre) { |estado| estado.comision_nombre }
        # s.add_field(:fechaent) { |estado| estado.fechaent }
        # s.add_field(:fechasal) { |estado| estado.fechasal }
        s.add_section("DICTAMEN", :dictamenes) do |ss|
          DICTAMEN.each do |attribute|
            ss.add_field(attribute) { |item| item.send(attribute).to_s }
          end
          # ss.add_field(:tipo) { |n| n[:tipo].to_s }
          # ss.add_field(:fecha) { |n| n[:fecha].to_s }
          # ss.add_field(:dictamen) { |n| n[:dictamen].to_s }
        end
      end
    end
  report.generate
  end

end

