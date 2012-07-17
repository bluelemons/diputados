$(document).ready(function(){
  var dateFormat = $( ".datepicker" ).datepicker( "option", "dateFormat" );
  $( ".datepicker" ).datepicker( "option", "dateFormat", 'dd/mm/yy' );
  $( ".datepicker" ).datepicker( "option", "changeYear", 'true' );
  $( ".datepicker" ).datepicker( "option", "changeMonth", 'true' );
}); 
