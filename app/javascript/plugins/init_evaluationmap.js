import mapboxgl from 'mapbox-gl';

const mapElementEval = document.getElementById('map');
const coordinates = JSON.parse(mapElementEval.dataset.coordinates)
const markers = JSON.parse(mapElementEval.dataset.markers)

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) =>{
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker=> bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initEvaluationmap = () => {
  mapboxgl.accessToken = mapElementEval.dataset.mapboxApiKey;
  const evalMap = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [-122.486052, 37.830348],
    zoom: 15
  });
  addMarkersToMap(evalMap, markers);
  fitMapToMarkers(evalMap, markers);

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
  };



export { initEvaluationmap };
