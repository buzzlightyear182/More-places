$(function() {
  return $('#trip_destination_name').autocomplete({
    source: '/destinations'
  });
});

// $(function() {
//   return $('#trip_destination_name').autocomplete({
//     minLength: 2,
//     source: function(request, response) {
//       return $.ajax({
//         url: $('#trip_destination_name').data('autocomplete_source'),
//         dataType: "json",
//         data: {
//           name: request.term
//         },
//         success: function(data) {
//           return response(data);
//         }
//       });
//     }
//   });
// });

// $('#trip_destination_name').data('autocomplete_source')
