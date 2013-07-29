class NotasReport

# Numero,  Tipo de iniciador,  Iniciador, Area,  Weekly session,
# Ingreso, Fojas, Descripcion

  # def initialize (notas)
  #   @notas = notas
  # end

  def self.listado (notas)
    @notas = notas

    report = ODFReport::Report.new(Rails.root.join("app/reports/notas.odt")) do |r|
      r.add_section "NOTAS", @notas do |n|
        n.add_field(:nada, :numero)
        n.add_field(:numero) { |item| item.numero.to_s }
        n.add_field(:organizacion) { |item| item.organization.to_s }
        n.add_field(:autor) { |item| item.initiator.to_s }
        n.add_field(:area) { |item| item.area.to_s }
        # n.add_field(:descripcion) { |item| item.primer_pase.descripcion.to_s }
        # n.add_field(:sesion) { |item| item.weekly_session.to_s }
        # n.add_field(:ingreso) { |item| item.primer_pase.ingreso.to_s }
      end
    end

    report.generate

  end

end
