<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../leaflet.css" />
	<link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>
    <div id="map" class="sidebar-map"></div>
</body>
    <script src="./src/leaflet.js"></script>
    <script src="./src/leaflet-idw.js"> </script>
    <script src="./exampledata.js"></script>
    
    <script>
        var map = L.map('map');
        map.setView({lon: 37.57905600, lat: 55.7522200}, 11);

        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors'
        }).addTo(map);

        var idw = L.idwLayer(addressPoints,{
            opacity: 0.3,
            maxZoom: 18,
            cellSize: 10,
            exp: 3,
            max: 1200
        }).addTo(map);

        
    </script>
</html>
