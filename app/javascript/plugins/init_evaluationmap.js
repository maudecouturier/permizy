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
      center: [2.3159171, 48.852388],
      zoom: 15
    });
    addMarkersToMap(evalMap, markers);
    fitMapToMarkers(evalMap, markers);
    // displayFlashcard(markers);

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
      element.id = marker.coordinate_id
      // element.setAttribute('id', 'marker-success')
    } else {
      element.className = 'marker-fail';
      element.id = marker.coordinate_id
    }

    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
    // .setAttribute('id', `${marker.coordinate_id}`)
    .addTo(map);
  });
  displayFlashcard(markers);
};

  const displayFlashcard = (markers) => {
    // const failMarkers = document.querySelectorAll('.marker-fail')
    markers.forEach((marker) => {
      const element = document.getElementById(`${marker.coordinate_id}`)
      // if (marker.incident_category != 'ok'){
        element.addEventListener('click', (event) => {
          const flashcard = document.getElementById(`flashcard${marker.coordinate_id}`)
          const displayed_card = document.querySelector('.js-flashcard-displayed')
          const large_marker = document.querySelector('.marker-fail-large')
          if (large_marker) {
            large_marker.classList.replace('marker-fail-large', 'marker-fail')
          }
          if (displayed_card) {
            displayed_card.classList.replace('js-flashcard-displayed', 'js-flashcard-hidden')
          }
          if (marker.incident_category != 'ok') {
            element.classList.replace('marker-fail', 'marker-fail-large')
            flashcard.classList.replace('js-flashcard-hidden', 'js-flashcard-displayed')
          }
        });
      // }
    });
  }


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker=> bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};



export { initEvaluationmap };
