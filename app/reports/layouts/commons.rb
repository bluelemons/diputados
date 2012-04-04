module Commons
  def form(data, position)
    bounding_box position, :width => 500, :height => bounds.top-30*2 do
      data.each{|k,v| text "<b>#{k.to_s}</b>: #{clean_string(v)}",:inline_format => true}
    end
  end

  def clean_string(s)
    s = s.to_s
    s.slice! "<p>"
    s.slice! "</p>"
    s
  end

end
