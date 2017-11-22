function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);
  console.log(components)

  var storeAddress = document.getElementById('store_address');
  storeAddress.blur();
  storeAddress.value = components.address;

  document.getElementById('store_zipcode').value = components.zip_code;
  document.getElementById('store_city').value = components.city;
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  if (window.console && typeof console.log === "function") {
    console.log(place);
  }

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type === 'street_number') {
        street_number = component.long_name;
      } else if (type === 'route') {
        route = component.long_name;
      } else if (type === 'postal_code') {
        zip_code = component.long_name;
      } else if (type === 'locality' || type === 'administrative_area_level_2') {
        city = component.long_name;
      } else if (type === 'postal_town' && city === null) {
        city = component.long_name;
      } else if (type === 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number === null ? route : (route + ' , ' + street_number),
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}

document.addEventListener("DOMContentLoaded", function() {
  var storeAddress = document.getElementById('store_address');

  if (storeAddress) {
    var autocomplete = new google.maps.places.Autocomplete(storeAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(storeAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
