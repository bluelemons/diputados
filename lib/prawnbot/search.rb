module Resource

  module Search

    def informacion_de_busqueda(params)
      convierte(params[:q])
    end

    def clean(params)
      params.delete_if {|key, value| value == "" }
    end

    def convierte(params)
      filtro = clean(params) if params
      bounding_box([20, cursor], :width => 500) do
        if filtro
          text "Filtros de busqueda:"
          filtro.each{|k,v| text "<b>#{human_attribute_name k.to_s}</b>: #{v}",:inline_format => true}
        end
      end

    end

    def human_attribute_name(attribute)
      name = ""
      attribute = attribute.split("_")
      attribute.each{|a| name = name + I18n.translate(a, :scope => [:prawnbot, :attributes]) + " " }
      name
    end

  end

end
