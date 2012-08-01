toggle_comision = (event) ->
  target = $("#q_comision_id")
  if ($(this).find("option:selected").text().match(/Comisi/))
    target.parent().slideDown()
  else
    target.val("").parent().slideUp()

jQuery ->
  $("#filters_sidebar_section").on('change', '#q_estado_id', toggle_comision)
    .find("#q_estado_id").change()

