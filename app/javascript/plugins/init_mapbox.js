import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import places from 'places.js';

const mapElement = document.getElementById('map');
// document.getElementById('booking_address').value = ''

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkerToMap = (map, marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
};

const fitMapToMarker = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ marker.lng, marker.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initAutocomplete = () => {
  const addressInput = document.getElementById('booking_address');
  if (addressInput) {
    const input_address = places({ container: addressInput });
    input_address.on('change', (e) => {
      const map = buildMap();
      const newMarker = { lng: e.suggestion.latlng.lng, lat: e.suggestion.latlng.lat }
      addMarkerToMap(map, newMarker)
      fitMapToMarker(map, newMarker)
      //$address.textContent = e.suggestion.value
    });
  }
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const marker = JSON.parse(mapElement.dataset.marker);
    addMarkerToMap(map, marker);
    fitMapToMarker(map, marker);
    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //                                   mapboxgl: mapboxgl }));
  }
};

export { initMapbox, initAutocomplete };
