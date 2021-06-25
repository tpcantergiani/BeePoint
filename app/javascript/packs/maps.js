// src="//maps.google.com/maps/api/js?key=" +gon.gmaps_key
// src="//cdn.rawgit.com/mahnunchik/markerclustererplus/master/dist/markerclusterer.min.js"
// src='//cdn.rawgit.com/printercu/google-maps-utility-library-v3-read-only/master/infobox/src/infobox_packed.js'
// src='//cdn.jsdelivr.net/gmaps4rails/2.1.2/gmaps4rails.js'
// src='//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js'

var markers = gon.markers
handler = Gmaps.build('Google');  
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){  
  markers = handler.addMarkers(markers);  
  handler.bounds.extendWith(markers);  
  handler.fitMapToBounds();  
});