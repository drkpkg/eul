// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  initPackage();
});

$(document).on('turbolinks:load', function(){
  initPackage();
});


function initPackage(){
  var today = new Date();
  $('.ui.calendar').calendar({
    type: 'date',
    minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
    maxDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 5)
  });
  $('.pop').popup();
  $('#package_size').keyup(function(){
    call_calculator();
  });
  $('#package_weight').keyup(function(){
    call_calculator();
  });

  $('#package_fragility').change(function(){
    call_calculator();
  });
}


function call_calculator(){
  var size = $('#package_size').val();
  var weight = $('#package_weight').val();
  var checked = $('#package_fragility').is(':checked');
  $.ajax({
    url: '/api/packages/calculate/',
    type: 'POST',
    async: false,
    data: {size: size, weight: weight, checked: checked}
  }).done(function(data){
    $('#package_value').val(data.total)
  }).fail(function(){
    console.log('error');
  });
}
