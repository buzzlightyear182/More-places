$(document).ready(function() {

  var input = document.getElementById('trip_destination_name');

  function initialize() {

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.setTypes(['(regions)']);

  google.maps.event.addListener(autocomplete, 'place_changed', function() {

    var place = autocomplete.getPlace();
    console.log(place);

    var address = '';
    var country = '';

    if (place.address_components) {
      for (i=0; i < place.address_components.length; i++){
        var type_array = place.address_components[i].types;
        if (type_array.indexOf("country") >= 0){
          country = place.address_components[i].long_name;
        }
      }

      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''), (country || '')
      ].join(' ');
    }
  });

}
  google.maps.event.addDomListener(window, 'load', initialize);

  $('#trip_activity_name').autocomplete({
    source: '/activities'
  });

});
