// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
// $(document).ready(function(){
//   initCourse();
// });
$(document).ready(function(){
  if(window.location.pathname == '/admin/courses/new'){
    initCourse();
  }
});

$(document).on('turbolinks:load', function(){
  if(window.location.pathname == '/admin/courses/new'){
    initCourse();
  }
});

function initCourse(){
  $('#map-container').empty().html('<div id="map-standar" class="map-standar"></div>');
  var map = L.map('map-standar').setView([0, 0], 2);
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'}).addTo(map);
  var routes = {};
  var lines = []
  var total = 0;

  $(".ui.dropdown").dropdown();

  $('.dropdown .item').click(function(){
    var v = $(this).attr('data-value');
    $.get('/admin/offices/'+ v +'.json', function(data){
      clearMap(map, routes);
      routes[v] = L.marker([data.lat, data.lon]).bindPopup(data.description);
      drawInMap(map, routes);

      $(".ui.label .delete.icon").click(function(){
        clearMap(map, routes);
        var v = $(this).parent().attr('data-value');
        delete routes[v];
        drawInMap(map, routes);
      });
    });
  });
}

function clearMap(map, routes) {
  $.each(routes, function(index, item){
    map.removeLayer(item);
  });

  for(i in map._layers) {
    if(map._layers[i]._path != undefined) {
      try {
        map.removeLayer(map._layers[i]);
      }
      catch(e) {
        console.log("problem with " + e + map._layers[i]);
      }
    }
  }
}

function drawInMap(map, routes){
  $.each(routes, function(index, item){
    item.addTo(map);
  });
}
