var markers = gon.markers
handler = Gmaps.build('Google');  
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){  
  markers = handler.addMarkers(markers);  
  handler.bounds.extendWith(markers);  
  handler.fitMapToBounds();  
});