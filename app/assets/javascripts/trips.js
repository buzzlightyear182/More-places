$(document).ready(function() {

  $('#new_trip .trip_form_field').css("display","none");

  var input = document.getElementById('trip_destination_name');

  function initialize() {

    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.setTypes(['(regions)']);

    google.maps.event.addListener(autocomplete, 'place_changed', function(){

      var place = autocomplete.getPlace();
      // console.log(place.id);

      var address = '';
      var country = '';
      document.getElementById('trip_google_places_id').value = place.id;

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

  var count = 0;
  var previous = 0;
  var trip_form_fields = document.querySelectorAll('.trip_form_field');

  $('#next_button').click(function(event){
    if (count == 5) {
      displayAllFields();
    } else {
      displayField(count);
      count += 1;
    };
  })

  function displayField(count){
    trip_form_fields[count].style.display ='block';
    trip_form_fields[count].classList.add('animated');
    trip_form_fields[count].classList.add('centered');
    trip_form_fields[count].classList.add('fadeInUp');

    $('#next_button').insertAfter($('form'));

    if (count > 0) {
      removeField(previous);
      previous += 1;
    }
    count += 1;
  };

  function removeField(previous){
    trip_form_fields[previous].style.display ='none';
    trip_form_fields[previous].classList.remove('fadeInUp');
    trip_form_fields[previous].classList.add('fadeOut');
  }

  function displayAllFields(){
    $('.trip_form_field').removeClass('fadeOut centered');
    $('.trip_form_field').addClass('zoomIn');
    $('.trip_form_field').show();
    $('#next_button').hide();
  };

});
