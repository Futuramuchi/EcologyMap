<script>
var map = L.map('map');
map.setView({lon: 37.4505600, lat: 55.7522200}, 11);
L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    maxZoom: 18,
    attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors'
}).addTo(map);
var sidebar = L.control.sidebar('sidebar').addTo(map);
</script>
<script src="/genMap.js"></script>
<script src="/markers.js"></script>
<script src="../leaflet.rainviewer.js"></script>
<script>
        var rainviewer = L.control.rainviewer({
        position: 'bottomleft',
        nextButtonText: '>',
        playStopButtonText: 'Начать/Пауза',
        prevButtonText: '<',
        positionSliderLabelText: "Время:",
        opacitySliderLabelText: "Яркость:",
        animationInterval: 500,
        opacity: 0.5
    });
    rainviewer.addTo(map);
</script>