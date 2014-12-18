$(function() {
  $('#experience_destination_name').autocomplete({
    source: '/destinations'
  });
  $('#experience_activity_name').autocomplete({
    source: '/activities'
  });
});
