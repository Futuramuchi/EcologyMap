<!DOCTYPE html>
<html lang="en">
<head>
    <title>easy4 ::: Экологическая карта мониторинга</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/leaflet-sidebar.css" />
    <link rel="icon" href="e.ico" type="image/x-icon"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./leaflet.css" />
	<link rel="stylesheet" type="text/css" href="../leaflet.rainviewer.css">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="./leaflet.js"></script>
    <link rel="stylesheet" href="../css/leaflet-sidebar.css" />
    <link href="./css/spinner-style.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">

</head>
<body>
    <div id="page-preloader">
        <span class="spinner"></span>
    </div>
    
   
    <?php
       require_once "menu.php"; 
        if (isset($_GET['pageno'])) {   
        $pageno = $_GET['pageno'];
    ?>
            <div id="map" class="sidebar-map"></div>       
            <?php
            require_once "monitor-data.php";
        } else {
            ?>
        <div id="map" class="sidebar-map"></div>
        <?php       
        require_once "map-data.php";
        $pageno = 0;
                }
                
                $size_page = 1;
                $offset = ($pageno-1) * $size_page;
                $total_rows = 24;
                $total_pages = ceil($total_rows / $size_page);
        ?>
        <div class="timer-panel">

        <ul style='display: flex;'>
            
            <li style='list-style-type: none;'><a style='text-decoration: none;' href="?pageno=1">
                <p class='text-pagenation'>
                    <?php
                    echo $time1  = date('H:i', time());    

                ?>
                    
                    </p>
                </a>
            </li>

            <li style='list-style-type: none;' class="<?php if($pageno <= 1){ echo 'disabled'; } ?>">
                <a class='btn-second-nonactive' href="<?php if($pageno <= 1){ echo '#'; } else { echo "?pageno=".($pageno - 1); } ?>"><p class='page-click-nav'><i class='fa fa-chevron-circle-left' aria-hidden='true'></i></p>

            </a>
        </li>
        
        <li style='list-style-type: none;' class="<?php if($pageno >= $total_pages){ echo 'disabled'; } ?>">
            <a class='btn-second-nonactive' href="<?php if($pageno >= $total_pages){ echo '#'; } else { echo "?pageno=".($pageno + 1); } ?>"><p class='page-click-nav'><i class='fa fa-chevron-circle-right' aria-hidden='true'></i></p>
                </a>
            </li>
        </ul>
        <?php 
        echo "<div class='text-bottom'>Прогноз экологической обстановки в часах: " . $_GET['pageno']."</div>";
    ?>
    </div>


</body>
</html>
