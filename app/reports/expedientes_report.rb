class ExpedientesReport
  def listado(expedientes)

    report = ODFReport::Report.new(Rails.root.join("app/reports/expedientes.odt")) do |r|
      r.add_section "EXPEDIENTES", expedientes do |s|
        s.add_field(:clave) { |item| item.clave.to_s }
        s.add_field(:entrada) { |item| item.entrada.to_s }
        s.add_field(:autor) { |item| item.autor.to_s }
        s.add_field(:firmantes) { |item| item.firmantes.to_s }
        s.add_field(:descripcion) { |item| item.descrip.to_s }
        s.add_field(:estado) { |item| item.estado.to_s }
        s.add_field(:tema) { |item| item.tema.to_s }

      end
    end

    report_file_name = report.generate

  end

  def detalle(params)

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

      r.add_field(:tratamiento,   @expediente.sesion.try(:tratamiento).to_s)
      r.add_field(:resultado,     @expediente.sesion.try(:resultado).to_s)
      r.add_field(:fechases,      @expediente.sesion.try(:fechases).to_s)
      r.add_field(:periodo,       @expediente.sesion.try(:periodo).to_s)

      r.add_section "COMISION", @expediente.estados do |s|
        s.add_field(:nombre) { |estado| estado.comision_nombre }
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

  end

end
