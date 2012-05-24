jQuery ->
  
  oTable = $('.index_as_table #expedientes').dataTable({"bPaginate": false});

  $('.index_as_table #expedientes tbody tr').click( () ->
    if oTable.fnIsOpen(this)
      oTable.fnClose( this )
    else
      oTable.fnOpen( this, "Aca hay que poner la informacion", "info_row" );
  );
