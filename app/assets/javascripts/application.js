// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google

function addEventToList(name){
	console.log(name)
}

$( document ).ready(function() {
	var map;
	var infowindow;

	var request;
	var services;
	var markers = [];

	$('.event-add-btn').click(function(e){
		console.log('*****************test')
	})


	function initialize(){
		var center = new google.maps.LatLng(39.9500, -75.1667);
		map = new google.maps.Map(document.getElementById('map'),{
			center: center,
			zoom: 14
		});
		request = {
			location: center,
		// this is in meters about 2.5 miles
			radius: 4047,
			types: ['food', 'bar', 'restaurant']
		};

		infowindow = new google.maps.InfoWindow({ content: 'TEST'});
		service = new google.maps.places.PlacesService(map);

		service.nearbySearch(request, callback);

		google.maps.event.addListener(map, 'click', function(event){
			map.setCenter(event.latLng)
			clearResults(markers)

			var request = {
				location: event.latLng,
				radius: 4047,
				query: ['food', 'bar', 'restaurant']
			};
			service.nearbySearch(request, callback);
		})
	}

	function callback(results, status){
		if (status == google.maps.places.PlacesServiceStatus.OK){
			for (var i = 0; i < results.length; i++){
				markers.push(createMarker(results[i]));
			}
		}
	}


	function createMarker(place){
		var placeLoc = place.geometry.location;
		var marker = new google.maps.Marker({
			map: map,
			position: place.geometry.location
		});
// this is adding the information to the information card 
		google.maps.event.addListener(marker, 'click', function(){
		
			popup = ''
			popup += '<br/>'
			popup += '<span class="place">'+ place.name +'</span>'
			popup += '<br/>'
			popup += place.vicinity
			popup += '<br/>'
			popup += place.rating + ' Rating'
			popup += '<br/>'
			popup += '<a href="#">Add me</a>'
			popup += '<br/>'
			
// this is calling the popup above for the infowindow
			infowindow.setContent(popup);
			console.log(place)
			infowindow.open(map, this);
		});
		return marker;
	}

	function clearResults(markers){
		for (var m in markers) {
			markers[m].setMap(null)
		}
		markers = []
	}

	google.maps.event.addDomListener(window, 'load', initialize);

	// this is the autocomplete code for google places

	var input = /** @type {!HTMLInputElement} */(
      document.getElementById('pac-input'));

  	var types = document.getElementById('type-selector');
		  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		  map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);


	var autocomplete = new google.maps.places.Autocomplete(input);
  		autocomplete.bindTo('bounds', map);

		  autocomplete.addListener('place_changed', function() {
	    infowindow.close();
	    marker.setVisible(false);
	    var place = autocomplete.getPlace();
	    if (!place.geometry) {
	      window.alert("Autocomplete's returned place contains no geometry");
	      return;
	    }

	    // If the place has a geometry, then present it on a map.
	    if (place.geometry.viewport) {
	      map.fitBounds(place.geometry.viewport);
	    } else {
	      map.setCenter(place.geometry.location);
	      map.setZoom(17);  // Why 17? Because it looks good.
	    }
	    marker.setIcon(/** @type {google.maps.Icon} */({
	      url: place.icon,
	      size: new google.maps.Size(71, 71),
	      origin: new google.maps.Point(0, 0),
	      anchor: new google.maps.Point(17, 34),
	      scaledSize: new google.maps.Size(35, 35)
	    }));
	    marker.setPosition(place.geometry.location);
	    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
  });

  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
  function setupClickListener(id, types) {
    var radioButton = document.getElementById(id);
    radioButton.addEventListener('click', function() {
      autocomplete.setTypes(types);
    });
  }

  setupClickListener('changetype-all', []);
  setupClickListener('changetype-address', ['address']);
  setupClickListener('changetype-establishment', ['establishment']);
  setupClickListener('changetype-geocode', ['geocode']);


	});




// var map;
// var infoWindow;
// var service;

// function initMap() {
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: -33.867, lng: 151.206},
//     zoom: 15,
//     styles: [{
//       stylers: [{ visibility: 'simplified' }]
//     }, {
  
//       elementType: 'labels',
//       stylers: [{ visibility: 'off' }]
//     }]
//   });

//   infoWindow = new google.maps.InfoWindow();
//   service = new google.maps.places.PlacesService(map);

//   // The idle event is a debounced event, so we can query & listen without
//   // throwing too many requests at the server.
//   map.addListener('idle', performSearch);
// }

// function performSearch() {
//   var request = {
//     bounds: map.getBounds(),
//     keyword: 'best view'
//   };
//   service.radarSearch(request, callback);
// }

// function callback(results, status) {
//   if (status !== google.maps.places.PlacesServiceStatus.OK) {
//     console.error(status);
//     return;
//   }
//   for (var i = 0, result; result = results[i]; i++) {
//     addMarker(result);
//   }
// }

// function addMarker(place) {
//   var marker = new google.maps.Marker({
//     map: map,
//     position: place.geometry.location,
//     icon: {
//       url: 'http://maps.gstatic.com/mapfiles/circle.png',
//       anchor: new google.maps.Point(10, 10),
//       scaledSize: new google.maps.Size(10, 17)
//     }
//   });

//   google.maps.event.addListener(marker, 'click', function() {
//     service.getDetails(place, function(result, status) {
//       if (status !== google.maps.places.PlacesServiceStatus.OK) {
//         console.error(status);
//         return;
//       }
//       infoWindow.setContent(result.name);
//       infoWindow.open(map, marker);
//     });
//   });
// }


