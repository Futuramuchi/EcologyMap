
<script>
    var mapNext = L.map('map');
    mapNext.setView({lon: 37.4505600, lat: 55.7522200}, 11);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        maxZoom: 18,
        attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors'
    }).addTo(mapNext);
    var sidebar = L.control.sidebar('sidebar').addTo(map);
</script>
<?php require_once 'genMapNext.php';?>
<script src="/markersNext.js"></script>

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
    rainviewer.addTo(mapNext);
</script>