<!DOCTYPE html>
<html lang="en">
<head>
    <title>easy4 ::: Экологическая карта мониторинга</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="icon" href="../e.ico" type="image/x-icon"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../style.css">
	  <link href="../css/spinner-style.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">
	
</head>
<body style="margin:0px; font-family: 'Montserrat', sans-serif; background: url(../images/background-nebo.jpg);     background-size: cover;">
  <div id="page-preloader">
    <span class="spinner"></span>
  </div>

<main>
<?php 
    $data = $_GET['name_area'];
    $id_area_data = $_GET['id_area'];
    echo "<center><h1 style='font-weight:600;'>";
    echo $data; 
    // echo $data . ' ' . $id_area_data; 
    echo "</h1></center>";
    
  ?>
</main>
<center>
<div class='info'>
  <h2>Статистика последних замеров (будет в виде таблицы) + сделаю фильтр по датам</h2>
  <h2>Последняя аномальное значение </h2>
  <h2>Статистика последних замеров: ведение количества</h2>

</div>
</center>
  <footer>
<a href="../" style="text-decoration:none;">
  <img src="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-map-hotel-services-and-city-elements-flatart-icons-lineal-color-flatarticons.png" style="margin-top: -40px;"/>
  <div class="text-back">Назад</div>
</a>
    </footer>

    
  </body>
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


