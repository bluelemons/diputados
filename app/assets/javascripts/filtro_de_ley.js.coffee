toggle_ley = (event) ->
  target = $("#ley_numeric")
  if ($(this).find("option:selected").text().match(/Ley/))
    target.parent().slideDown()
  else
    target.val("").parent().slideUp()

jQuery ->
  $("#filters_sidebar_section").on('change', '#q_tipo', toggle_ley)
  $("#ley_numeric").parent().hide()
  
