import mapboxgl from 'mapbox-gl';

const initEvaluationmap = () => {
  const mapElementEval = document.getElementById('map');
  if (mapElementEval) {
    const coordinates = JSON.parse(mapElementEval.dataset.coordinates)
    const markers = JSON.parse(mapElementEval.dataset.markers)

    mapboxgl.accessToken = mapElementEval.dataset.mapboxApiKey;
    const evalMap = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [-122.486052, 37.830348],
      zoom: 15
    });
    addMarkersToMap(evalMap, markers);
    fitMapToMarkers(evalMap, markers);
    // displayFlashcard

    evalMap.on('load', function() {
      evalMap.addSource('route', {
        'type': 'geojson',
        'data': {
            'type': 'Feature',
            'properties': {},
            'geometry': {
                'type': 'LineString',
                'coordinates': coordinates
            }
        }
      });
      evalMap.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
            'line-join': 'round',
            'line-cap': 'round'
        },
        'paint': {
            'line-color': '#888',
            'line-width': 8
        }
      });
    });
  }
};


const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) =>{
    const element = document.createElement('div');
    if (marker.incident_category === 'ok') {
      element.className = 'marker-success';
      // element.setAttribute('id', 'marker-success')
    } else {
      element.className = 'marker-fail';
    }

    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
  });
};

const displayFlashcard = (map, markers) => {
  const failMarkers = document.querySelectorAll('.marker-fail')
  failMarkers.addEventListener('click', (event) => {
    // ADD EVENT
  });
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker=> bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};


export { initEvaluationmap };
