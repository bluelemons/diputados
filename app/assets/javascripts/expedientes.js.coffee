jQuery ->
  
  oTable = $('.index_as_table #expedientes').dataTable
    bPaginate: false
    bProcessing: true

  $('.index_as_table #expedientes tbody tr').click( () ->
    if oTable.fnIsOpen(this)
      oTable.fnClose( this )
    else
      oTable.fnOpen( this, fnFormatDetails(this), 'details' );

  );

  fnFormatDetails = ( nTr ) ->
    sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
    sOut += '<tr><td>Rendering engine:</td><td></td></tr>';
    sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
    sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
    sOut += '</table>';
