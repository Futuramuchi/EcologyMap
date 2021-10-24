<!DOCTYPE html>
<html lang="en">
<head>
    <title>easy4 ::: Экологическая карта мониторинга</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="icon" href="e.ico" type="image/x-icon"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../style.css">
	  <link href="../css/spinner-style.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">
	
</head>
<body style="margin:0px; font-family: 'Montserrat', sans-serif; ">
  <div id="page-preloader">
    <span class="spinner"></span>
  </div>

<?php 
    $data = $_GET['name_area'];
    $id_area_data = $_GET['id_area'];
    echo "<center><img src='../images/icons8.gif' /><h1 style='font-weight:600; font-size:13pt;'>";
    echo $data . ' ' . $id_area_data; 
    echo "</h1></center>";
    
  ?>

    
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


