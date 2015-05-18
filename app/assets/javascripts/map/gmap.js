function initialize() {
  var mapOptions = {
    zoom: 8,
    //center: new google.maps.LatLng(26.1333, -80.1500)
  };

    
          
    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    
    
    
     
    map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
     
    directionsDisplay.setMap(map);
     
    var request = {
      origin: "Davie, FL",
      destination: address,
      travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      //Check if request is successful.
      if (status == google.maps.DirectionsStatus.OK) {
        console.log(status);
        directionsDisplay.setDirections(response); //Display the directions result
      }
    });
    

}


function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
      '&signed_in=true&callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;