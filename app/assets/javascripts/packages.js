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
}
