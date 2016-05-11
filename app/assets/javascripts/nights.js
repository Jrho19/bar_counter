$(document).ready(function(){
  $('#enter').parent().on('ajax:success', function(event, data){
    console.log('complete');
    console.log(data);
    $('#count').html(data);
  });
})
