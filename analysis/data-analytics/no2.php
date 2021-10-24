<h2 class="headerAnalyz">NO2</h2>
<?php 
if(isset($_POST['btnStartNO2'])){
  
  $varArrayNO2 = array();
  $urlClientOrderNO2 = "http://no2.makievksy.ru.com/predict";
  for ($i=0; $i < 72; $i++) { 
    $koef = 1;
        
        $arrayClientNewNO2 = 
        '{
          "Date":"'.$_POST['txtDateNO2'].'",
          "Time":"'.$_POST['txtTimeNO2'].'",
          "NO":'.$_POST['txtNO2NO2'] * $koef.',
          "CO":'.$_POST['txtCO2NO2'] * $koef.',
          "PM10":'.$_POST['txtPM10NO2'] * $koef.',
          "SkorostVetra": '.$_POST['txtSpeedNO2'] * $koef.',
          "NapravlenieVetra":'.$_POST['txtNaprNO2'] * $koef.',
          "Davlenie":'.$_POST['txtDavlenieNO2'] * $koef .', 
          "Vlajno2st":'.$_POST['txtVlajnostNO2'] * $koef.'
          }';	

        $chOrderNO2 = curl_init($urlClientOrderNO2);
        curl_setopt($chOrderNO2, CURLOPT_POST, 1);
        curl_setopt($chOrderNO2, CURLOPT_POSTFIELDS, $arrayClientNewNO2); 
        curl_setopt($chOrderNO2, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($chOrderNO2, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($chOrderNO2, CURLOPT_HEADER, false);
        curl_setopt($chOrderNO2, CURLOPT_HTTPHEADER,
            array(
                'Content-Type:application/json',
                'Accept: text/plain'
            )
        );  
        $getDataInfoNO2 = curl_exec($chOrderNO2);
        $trimmedNO2 = trim($getDataInfoNO2, ' {"score": ');
        $dataNO2 = round(str_replace("}", ", ", $trimmedNO2), 3) . ',';
        $varArrayNO2[$i] = $dataNO2;
        $statusNO2 = curl_getinfo($chOrderNO2, CURLINFO_HTTP_CODE);
        curl_close($chOrderNO2);
      }
    }
?>
      <div class="dataForAPI" style="margin-top: 43px;">
      <h2 style="text-align: left; margin-left: 10%;"></h2>
        <ul>
            <li class="aboutli-right">Дата:</li>
            <li class="aboutli-right">Время:</li>
            <li class="aboutli-right">СО:</li>
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
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtDateNO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtTimeNO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtCO2NO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNO2NO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtPM10NO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtSpeedNO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNaprNO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtDavlenieNO2"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtVlajnostNO2"></li>
            <input type="submit" name="btnStartNO2" class="btnCheck">
          </form>
        </ul>
      </div>
      <div class="dataForAPI">
      <div><h2 style="display: inline-block;">Прогнозируемый уровень загрязнения: </h2> <h2 style="margin-left: 5px; font-size: 25pt; display: inline-block;"><?php echo str_replace(",", "", $varArrayNO2[1]);?></h2></div>
        <canvas id="speedChartNO2" width="350" height="100" style="display: block; margin-left: 65px;"></canvas>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script>
var speedCanvasNO2 = document.getElementById("speedChartNO2");

Chart.defaults.global.defaultFontFamily = "Lato";
Chart.defaults.global.defaultFontSize = 18;

var speedDataNO2 = {
  labels: ["0:00:00","0:20:00","0:40:00","1:00:00","1:20:00","1:40:00","2:00:00","2:20:00","2:40:00","3:00:00","3:20:00","3:40:00","4:00:00","4:20:00","4:40:00","5:00:00","5:20:00","5:40:00","6:00:00","6:20:00","6:40:00","7:00:00","7:20:00","7:40:00","8:00:00","8:20:00","8:40:00","9:00:00","9:20:00","9:40:00","10:00:00","10:20:00","10:40:00","11:00:00","11:20:00","11:40:00","12:00:00","12:20:00","12:40:00","13:00:00","13:20:00","13:40:00","14:00:00","14:20:00","14:40:00","15:00:00","15:20:00","15:40:00","16:00:00","16:20:00","16:40:00","17:00:00","17:20:00","17:40:00","18:00:00","18:20:00","18:40:00","19:00:00","19:20:00","19:40:00","20:00:00","20:20:00","20:40:00","21:00:00","21:20:00","21:40:00","22:00:00","22:20:00","22:40:00","23:00:00","23:20:00","23:40:00"],
  datasets: [{
    label: "График прогноза NO2",
    data: [<?php for ($i=0; $i < 72; $i++) { 
      echo $varArrayNO2[$i];
    }?>],
  }]
};

var chartOptionsNO2 = {
  legend: {
    display: true,
    position: 'top',
    labels: {
      boxWidth: 80,
      fontColor: 'black'
    }
  }
};


var lineChartNO2 = new Chart(speedCanvasNO2, {
  type: 'line',
  data: speedDataNO2,
  options: chartOptionsNO2
});
</script>