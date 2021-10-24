<h2 class="headerAnalyz">CO</h2>

<?php 

if(isset($_POST['btnStartCO'])){
  
  $varArray = array();

  $urlClientOrder = "http://co.makievksy.ru.com/predict";
  for ($i=0; $i < 73; $i++) { 
    $koef = 1;
            $arrayClientNew = 
            '{
              "Date":"'.$_POST['txtDate'].'",
              "Time":"'.$_POST['txtTime'].'",
              "NO2":'.$_POST['txtNO2'] * $koef.',
              "NO":'.$_POST['txtNO'] * $koef.',
              "PM10":'.$_POST['txtPM'] * $koef.',
              "SkorostVetra": '.$_POST['txtSkorost'] * $koef.',
              "NapravlenieVetra":'.$_POST['txtNapravlenie'] * $koef.',
              "Davlenie":'.$_POST['txtDavlenie'] * $koef.', 
              "Vlajnost":'.$_POST['txtVlajnost'] * $koef.'
              }';	

            $chOrder = curl_init($urlClientOrder);
            curl_setopt($chOrder, CURLOPT_POST, 1);
            curl_setopt($chOrder, CURLOPT_POSTFIELDS, $arrayClientNew); 
            curl_setopt($chOrder, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($chOrder, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($chOrder, CURLOPT_HEADER, false);
            curl_setopt($chOrder, CURLOPT_HTTPHEADER,
                array(
                    'Content-Type:application/json',
                    'Accept: text/plain'
                )
            );  
            $getDataInfo = curl_exec($chOrder);
            $trimmed = trim($getDataInfo, ' {"score": ');
            $data = round(str_replace("}", "", $trimmed), 2) . ",";
            $status = curl_getinfo($chOrder, CURLINFO_HTTP_CODE);
            curl_close($chOrder);
            $varArray[$i] = $data;
            
            }
            // var_dump($varArray);
          }
          ?>

<div class="dataForAPI" style="margin-top: 43px;">
<h2 style="text-align: left; margin-left: 10%;"></h2>
  <ul>
    <li class="aboutli-right">Дата:</li>
    <li class="aboutli-right">Время:</li>
    <li class="aboutli-right">NO2:</li>
    <li class="aboutli-right">NO:</li>
    <li class="aboutli-right">PM10:</li>
    <li class="aboutli-right">Скорость ветра:</li>
    <li class="aboutli-right">Направление ветра:</li>
    <li class="aboutli-right">Давление:</li>
    <li class="aboutli-right">Влажность:</li>
  </ul>
</div>

<div class="dataForAPI">
<h2 style="text-align: left; margin-left: 10%;">Введите текущие параметры</h2>  
<ul>    
    <form method="post">
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtDate"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtTime"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNO"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNO2"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtPM"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtSkorost"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNapravlenie"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtDavlenie"></li>
      <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtVlajnost"></li>
      <input type="submit" name="btnStartCO" class="btnCheck">
    </form>
  </ul>
</div>


<div class="dataForAPI">
<div><h2 style="display: inline-block;">Прогнозируемый уровень загрязнения: </h2> <h2 style="margin-left: 5px; font-size: 25pt; display: inline-block;"><?php echo str_replace(",", "", $varArray[1]);?></h2></div>
  <canvas id="speedChart" width="200" height="80" style="display: block; margin-left: 65px;"></canvas>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
var speedCanvas = document.getElementById("speedChart");

Chart.defaults.global.defaultFontFamily = "Lato";
Chart.defaults.global.defaultFontSize = 18;

var speedData = {
  labels: ["0:00:00","0:20:00","0:40:00","1:00:00","1:20:00","1:40:00","2:00:00","2:20:00","2:40:00","3:00:00","3:20:00","3:40:00","4:00:00","4:20:00","4:40:00","5:00:00","5:20:00","5:40:00","6:00:00","6:20:00","6:40:00","7:00:00","7:20:00","7:40:00","8:00:00","8:20:00","8:40:00","9:00:00","9:20:00","9:40:00","10:00:00","10:20:00","10:40:00","11:00:00","11:20:00","11:40:00","12:00:00","12:20:00","12:40:00","13:00:00","13:20:00","13:40:00","14:00:00","14:20:00","14:40:00","15:00:00","15:20:00","15:40:00","16:00:00","16:20:00","16:40:00","17:00:00","17:20:00","17:40:00","18:00:00","18:20:00","18:40:00","19:00:00","19:20:00","19:40:00","20:00:00","20:20:00","20:40:00","21:00:00","21:20:00","21:40:00","22:00:00","22:20:00","22:40:00","23:00:00","23:20:00","23:40:00"],
  datasets: [{
    label: "График прогноза СО ",
    data: [
      <?php for ($i=0; $i < 72; $i++) { 
        echo $varArray[$i];
      }?>
    ],
  }]
};

var chartOptions = {
  legend: {
    display: true,
    position: 'top',
    labels: {
      boxWidth: 80,
      fontColor: 'black'
    }
  }
};


var lineChart = new Chart(speedCanvas, {
  type: 'line',
  data: speedData,
  options: chartOptions
});
</script>