// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  if(window.location.pathname == '/admin/offices/new'){
    initMap();
  }
  if(window.location.pathname == '/admin/offices/'){
    initOffices();
  }
});

$(document).on('turbolinks:load', function(){
  if(window.location.pathname == '/admin/offices/new'){
    initMap();
  }
  if(window.location.pathname == '/admin/offices'){
    initOffices();
  }
});

function initOffices(){
  navigator.geolocation.getCurrentPosition(function(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    $('#map-container').empty().html('<div id="map-office" class="map-office"></div>');
    map = L.map('map-office').setView([lat, lon], 3);
    layer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'});
    layer.addTo(map);
    $.get('/admin/offices.json', function(data){
      $.each(data, function(index, pin){
          var marker = L.marker([pin.lat, pin.lon],{draggable: true});
          marker.bindPopup("<a href=/admin/offices/"+ pin.id + ">" + pin.description + "</a>");
          marker.addTo(map);
      });
      $('#loader').removeClass('active');
    });
  });
}

function initMap(){
  navigator.geolocation.getCurrentPosition(function(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    $('#map-container').empty().html('<div id="map-office" class="map-office"></div>');
    changeLocation(lat, lon);
    map = L.map('map-office').setView([lat, lon], 18);
    layer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'});
    marker = L.marker([lat, lon],{draggable: true});
    layer.addTo(map)
    marker.addTo(map);
    marker.on("drag", function(e) {
      var marker = e.target;
      var position = marker.getLatLng();
      map.panTo(new L.LatLng(position.lat, position.lng));
      changeLocation(position.lat, position.lng);
    });
  });
}

function changeLocation(lat, lon){
  $('#office_lat').val(lat);
  $('#office_lon').val(lon);
}
