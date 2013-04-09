//= require jquery.tokeninput
$ ->
  $('#nota_tags_tokens').
    tokenInput '/admin/tags.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      prePopulate: $('#nota_tags_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los tags que desea incluir'
      noResultsText: "No existe este tag"
