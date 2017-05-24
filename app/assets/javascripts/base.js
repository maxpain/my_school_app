$(document).on('turbolinks:load', function(e) {
  getLocation();
  function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition);
      } else {
          console.log('1');
      }
  }
  function showPosition(position) {
      $.ajax({
        url: "/geolocations",
        method: 'PATCH',
        data: {
          currentlatitude: position.coords.latitude,
          currentlongitude: position.coords.longitude
        }
      })
  }

  $('#datetimepicker2').datetimepicker({locale: 'ru'})

  $('.selectpicker').selectpicker({
    liveSearch: true
  });
})

$(document).on('click', '.cancel-order-verification', function(e) {
  e.preventDefault();
  $('.order-confirmation-form').show();
  $('.order-verification-form').hide();
})