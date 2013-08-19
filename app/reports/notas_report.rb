class NotasReport

  attr_accessor :notas

  def initialize notas
    self.notas = notas
  end

  def listado_notas

# numero, area, tipo de iniciador, iniciador, tags, weekly session,
# ingreso, fojas, descripcion

    report = ODFReport::Report.new(Rails.root.join("app/reports/notas.odt")) do |r|
      r.add_section "NOTAS", notas do |n|
        n.add_field(:numero) { |item| item.numero.to_s }
        # area es el nombre del primer pase? deberia ademas ir el de el ultimo?
        n.add_field(:area) { |item| item.area.to_s }
        n.add_field(:organizacion) { |item| item.organization.to_s }
        n.add_field(:autor) { |item| item.initiator.to_s }
        # s.add_section("DICTAMEN", :dictamenes) do
        n.add_section("PASES", :pases) do |s|
          s.add_field(:fojas) { |pase| pase.fojas.to_s }
          s.add_field(:ingreso) { |pase| pase.ingreso.to_s }
          s.add_field(:area) { |pase| pase.area_name.to_s }
          s.add_field(:descripcion) { |pase| pase.descripcion.to_s }
        end
        #tags?
        #Fojas esta en nota.ultimo_pase.fojas
        # n.add_field(:fojas) { |item| item.fojas.to_s }
        # aca deberia ir la descripcion del primer pase?
        # n.add_field(:descripcion) { |item| item.descrip.to_s }

      end
    end

    report.generate

  end

end