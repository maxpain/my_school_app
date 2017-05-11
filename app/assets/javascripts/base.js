$(document).on('turbolinks:load', function(e) {
  getLocation();
  function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition);
      } else {
          console.log('ХУЕЦ');
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
})
