module Search
  def informacion_de_busqueda(params)
    convierte(params[:q])
  end

  def clean(params)
    params.delete_if {|key, value| value == "" }
  end

  def convierte(params)
    filtro = clean(params) if params
    bounding_box([20, bounds.top - 30], :width => 500, :height => bounds.top-30*2) do
      if filtro
        text "Criterio de busqueda:"
        filtro.each{|k,v| text "<b>#{k.to_s}</b>: #{v}",:inline_format => true}
      else
        text "Listado completo:"
      end
    end

  end

end
