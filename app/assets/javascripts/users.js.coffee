//= require jquery.tokeninput
$ ->
  $('#admin_user_roles_tokens').
    tokenInput '/admin/roles.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      prePopulate: $('#admin_user_roles_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los roles que desea incluir'
      noResultsText: "No existe este rol"
