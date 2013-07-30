class NotasReport

# Numero,  Tipo de iniciador,  Iniciador, Area,  Weekly session,
# Ingreso, Fojas, Descripcion

  def initialize (notas)
    @notas = notas
  end

  def listado
    report = ODFReport::Report.new(Rails.root.join("app/reports/notas.odt")) do |r|
      r.add_section "NOTAS", @notas do |s|
        s.add_field(:numero) { |item| item.numero.to_s }
        s.add_field(:area) { |item| item.area.to_s }
        s.add_field(:autor) { |item| item.autor.to_s }
        s.add_field(:organizacion) { |item| item.organization.to_s }

        s.add_field(:descripcion) { |item| item.primer_pase.descripcion.to_s }
        # s.add_field(:sesion) { |item| item.weekly_session.to_s }
        # s.add_field(:ingreso) { |item| item.primer_pase.ingreso.to_s }
      end
    end

    report.generate

  end

end
