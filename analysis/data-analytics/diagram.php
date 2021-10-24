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
<body style="margin:0px; font-family: 'Montserrat', sans-serif; background: url('../images/background.png'); background-size: cover;">


<main>
<?php 
    $data = $_GET['name_area'];
    $id_area_data = $_GET['id_area'];
echo "<center><h1 class='header-data'>";
    echo $data; 
    echo "</h1>";
    echo "</center>";
    
  ?>
  <a href="../" class="linkToMap"><i class="fa fa-chevron-right" aria-hidden="true"></i>
</a>
</main>
<center>
<div class='info'>

    <div class="data-weight">
      <?php include 'co.php';?>

      <iframe src="../maps.php" class="maomap">
    Ваш браузер не поддерживает плавающие фреймы!
 </iframe>
    </div>

    <div class="data-weight">
      <?php include 'no.php';?>
      <iframe src="../maps.php" class="maomap">
    Ваш браузер не поддерживает плавающие фреймы!
 </iframe>
    </div>

    <div class="data-weight">
      <?php include 'no2.php';?>
      <iframe src="../maps.php" class="maomap">
    Ваш браузер не поддерживает плавающие фреймы!
 </iframe>
    </div>

    <div class="data-weight">
      <?php include 'pm10.php';?>
      <iframe src="../maps.php" class="maomap">
    Ваш браузер не поддерживает плавающие фреймы!
 </iframe>
    </div>

    <!-- <div>
      <div class="data-double">1</div>      
      <div class="data-double">1</div>
    </div> -->

</div>
</center>


<div class="scrollup">
  <!-- Иконка fa-chevron-up (Font Awesome) -->
  <i class="fa fa-chevron-up"></i>
</div>
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
<script>
$(function() {
  // при нажатии на кнопку scrollup
  $('.scrollup').click(function() {
    // переместиться в верхнюю часть страницы
    $("html, body").animate({
      scrollTop:0
    },1000);
  })
})
// при прокрутке окна (window)
$(window).scroll(function() {
  // если пользователь прокрутил страницу более чем на 200px
  if ($(this).scrollTop()>200) {
    // то сделать кнопку scrollup видимой
    $('.scrollup').fadeIn();
  }
  // иначе скрыть кнопку scrollup
  else {
    $('.scrollup').fadeOut();
  }
});
</script>
</html>


