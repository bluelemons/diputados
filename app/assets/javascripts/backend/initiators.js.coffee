$ ->
  items = []
  $.getJSON "/backend/initiators.json", (data) ->
    $.each data, (key, val) ->
      items.push val.name

  $("#nota_initiator_attributes_name").typeahead
    source: items
