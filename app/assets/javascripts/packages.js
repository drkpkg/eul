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

  $('#package_delivery_date').attr('disabled', true);
  $('#shipping_date').calendar({
    type: 'date',
    monthFirst: false,
    formatter: {
      date: function (date, settings) {
        if (!date) return '';
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        return day + '/' + month + '/' + year;
      }
    },
    minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
    maxDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 5),

    onChange: function (date, text) {
      day = date.getDate();
      $('#package_delivery_date').attr('disabled', false).val('');
      $('#delivery_date').calendar({
        type: 'date',
        monthFirst: false,
        formatter: {
          date: function (date, settings) {
            if (!date) return '';
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            return day + '/' + month + '/' + year;
          }
        },
        minDate: new Date(today.getFullYear(), today.getMonth(), day),
        maxDate: new Date(today.getFullYear(), today.getMonth(), day + 5)
      });
    }
  });

  $('.pop').popup();

  $('#package_size').keyup(function(event){
    var reg = new RegExp("^[0-9]+x[0-9]+x[0-9]+$");
    var value = $(this).val();
    if (reg.test(value)) {
      call_calculator();
    }else{
      return false;
    }
  });

  $('#package_weight').keyup(function(event){
    var reg = new RegExp("^[0-9]+.[0-9]+$");
    var value = $(this).val();
    if (reg.test(value)) {
      call_calculator();
    }else{
      return false;
    }
  });

  $('#package_fragility').change(function(){
    call_calculator();
  });

  $('#package_express').change(function(){
    call_calculator();
  });

  // $('#package_express').change(function(){
  //   $('')
  // });

  // $('#package_receiver_id').change(function(){
  //   $.get('/admin/receivers/'+ $(this).val() + '.json', function(data){
  //     navigator.geolocation.getCurrentPosition(function(position) {
  //       var lat = position.coords.latitude;
  //       var lon = position.coords.longitude;
  //       $.ajax({
  //         url: '/api/geo/calculate',
  //         type: 'GET',
  //         data: {location:{lat: lat,lon: lon}, destiny:{lat: data.lat, lon: data.lon}},
  //         success: function(data){
  //           call_calculator();
  //           t = parseFloat($('#package_value').val()) + parseFloat(data.total);
  //           $('#package_value').val(t);
  //         }
  //       });
  //     });
  //   });
  // });
}


function call_calculator(){
  var size = $('#package_size').val();
  var weight = $('#package_weight').val();
  var checked = $('#package_fragility').is(':checked');
  var express = $('#package_express').is(':checked');
  $.ajax({
    url: '/api/packages/calculate/',
    type: 'POST',
    async: false,
    data: {size: size, weight: weight, checked: checked, express: express}
  }).done(function(data){
    $('#package_value').val(data.total)
    $.get('/admin/courses.json?e=' + express, function(data){
      $('#package_course_id').empty();
      $.each(data, function(index, item){
        $('#package_course_id').append("<option value='"+ item.id +"'>" + item.title + "</option>");
      });

      console.log(data);
    });


  }).fail(function(){
    console.log('error');
  });
}
