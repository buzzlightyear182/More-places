$(function() {
  return $('#trip_destination_name').autocomplete({
    source: '/destinations'
  });
});
