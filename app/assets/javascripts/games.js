$(document).ready(function(){
  $('.form').hide();
  var map;
  function initialize() {
    var myLatlng = new google.maps.LatLng(0,0);
    var mapOptions = {
      zoom: 2,
      center: myLatlng
    }
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    google.maps.event.addListener(map, 'click', function(event) {
      placeMarker(event.latLng);

    });


  }

  function placeMarker(location) {
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        draggable: true
    });

    map.setCenter(location);
    $('#location-field').val(location);

    google.maps.event.addListener(marker, 'dragend', function(event){
      $('#location-field').val(marker.position);
    });

    google.maps.event.clearListeners(map,'click')
  }

  google.maps.event.addDomListener(window, 'load', initialize);
 });