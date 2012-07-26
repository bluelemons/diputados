jQuery.datepicker.setDefaults
  changeYear: true
  changeMonth: true
  yearRange: '1992:+0' # no hay registros anteriores a 1992

# Fix issue with hardcoded format in Active Admin
jQuery ->
  $(".datepicker")
    .datepicker("option", "dateFormat", "dd/mm/yy")

