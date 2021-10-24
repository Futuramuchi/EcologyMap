<?php
include 'calculation.php'; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>easy4 ::: Экологическая карта мониторинга</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="icon" href="e.ico" type="image/x-icon"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../leaflet.css" />
	<link rel="stylesheet" type="text/css" href="./style.css">
    <link rel="stylesheet" href="../css/leaflet-sidebar.css" />
    <link href="../css/spinner-style.css" rel="stylesheet" type="text/css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            padding: 0;
            margin: 0;
            background: #f1f3f5;
            font-family: 'Montserrat', sans-serif;
            
        }
		
        html, body, #map {
            height: 100%;
        }

        </style>
</head>
<body>
    <div id="page-preloader">
        <span class="spinner"></span>
    </div>
    

    <div id="sidebar" class="sidebar collapsed">
        <!-- Nav tabs -->

        <div class="sidebar-tabs">
            <ul role="tablist">
                <li><a href="#home" role="tab"><i class="fa fa-bars"></i></a></li>
                <li><a href="#profile" role="tab"><i class="fa fa-user"></i></a></li>
                <li class="disabled"><a href="#messages" role="tab"><i class="fa fa-envelope"></i></a></li>
                <li><a href="https://github.com/stasnorman" role="tab" target="_blank"><i class="fa fa-github"></i></a></li>
            </ul>
            
            <ul role="tablist"> 
                <li><a href="#settings" role="tab"><i class="fa fa-gear"></i></a></li>
            </ul>
        </div>
		
        <!-- Tab panes -->
        <div class="sidebar-content" style="overflow: hidden;">
			<div class="sidebar-pane" id="home">
                <h1 class="sidebar-header">
					<text ><a href="../" class="header-map header-unactive">Карта №1</a></text> <  Карта №2 
                    <span class="sidebar-close"><i class="li-icon fa fa-caret-left"></i></span>
                </h1>
				
                <p class="nameEasy4">EASY4</p>
                <div class="stl-blc">
                    <div class="legend-map"> 
                        <h2 class="legend-header" style="font-size: 18pt;">Легенда карты</h2>
                        
                        <div>
                            <h2 class="legend-header">Относительно низкие выбросы</h2>
                            <div class="small-kv1">10%</div>
                            <div class="small-kv1" style="background: blue;">11%-20%</div>
                            <div class="small-kv1" style="background: cyan;">21%-30%</div>
                        </div>
                        
                        <div>
                            <h2 class="legend-header">Выбросы находятся в норме</h2>
                            <div class="small-kv2" style="background: lime;">31%-40%</div>
                            <div class="small-kv2" style="background: yellow;">41%-50%</div>
                            <div class="small-kv2">51%-60%</div>
                        </div>
                        
                        <div>
                            <h2 class="legend-header">Высокие показатели выброса</h2>
                            <div class="small-kv3" style="background: red;">61%-70%</div>
                            <div class="small-kv3" style="background: Maroon;">71%-80%</div>
                            <div class="small-kv3" style="background: #660066;">81%-90%</div>
                        </div>
                        <div>
                            <h2 class="legend-header">Критические показания выброса</h2>
                            <div class="small-kv3" style="background: #990099;">91%-95%</div>
                            <div class="small-kv3" style="background: #ff66ff;">96%-100%</div>
                        </div>
                    </div>
                    <div class="blck-mid">
                        <p><strong>Роза ветров</strong></p>
                        <img src="./images/unnamed.jpg" class="imgMapVozduha"/>
                        Описание, статистика, фильтрация данных
                    </div>
            </div>

            <div class="sidebar-pane" id="profile">
				<h1 class="sidebar-header">Profile<span class="sidebar-close"><i class="fa fa-caret-left"></i></span></h1>
            </div>
			
   
        </div>
    </div>
    
</div>
    <div id="map" class="sidebar-map"></div>
</body>
    <script src="./src/leaflet.js"></script>
    <script src="./js/leaflet-sidebar.js"></script>
    <script src="./src/leaflet-idw.js"> </script>
    <script>
    var addressPoints = [
        [55.658163,37.471434, 300],
        [55.649412,37.535874, 300],
        [55.811801,37.71249,  0], 
        [55.833222,37.525158, 100],
        [55.652695,37.751502, 2], 
        [55.821154,37.612592, 300],
        [55.635129,37.658684, 0],
        [55.759354,37.595584, 0], 
        [55.856324,37.426628, 0],
        [55.715698,37.6052377, 0]
    ]
    </script>
    
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

        var sidebar = L.control.sidebar('sidebar').addTo(map);
        
    </script>
    <script src="./markers-data.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    $(window).on('load', function () {
        var $preloader = $('#page-preloader'),
        $spinner   = $preloader.find('.spinner');    

        $spinner.fadeOut();
        $preloader.delay(350).fadeOut('slow');
    });
</script>
</html>
