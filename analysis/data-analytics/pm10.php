<h2 class="headerAnalyz">PM10</h2>
<?php 
if(isset($_POST['btnStartPM10'])){
  
  $varArrayPM10 = array();
  $urlClientOrderPM10 = "http://PM10.makievksy.ru.com/predict";
  for ($i=0; $i < 72; $i++) { 
        $koefPM10PM10 = 1;
        
        $arrayClientNewPM10 = 
        '{
          "Date":"'.$_POST['txtDatePM10'].'",
          "Time":"'.$_POST['txtTimePM10'].'",
          "NO":'.$_POST['txtNOPM10'] * $koefPM10.',
          "NO2":'.$_POST['txtNO2PM10'] * $koefPM10.',
          "CO":'.$_POST['txtCOPM10'] * $koefPM10.',
          "SkorostVetra": '.$_POST['txtSpeedPM10'] * $koefPM10.',
          "NapravlenieVetra":'.$_POST['txtNaprPM10'] * $koefPM10.',
          "Davlenie":'.$_POST['txtDavleniePM10'] * $koefPM10 .', 
          "Vlajnost":'.$_POST['txtVlajPM10stPM10'] * $koefPM10.'
          }';	

        $chOrderPM10 = curl_init($urlClientOrderPM10);
        curl_setopt($chOrderPM10, CURLOPT_POST, 1);
        curl_setopt($chOrderPM10, CURLOPT_POSTFIELDS, $arrayClientNewPM10); 
        curl_setopt($chOrderPM10, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($chOrderPM10, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($chOrderPM10, CURLOPT_HEADER, false);
        curl_setopt($chOrderPM10, CURLOPT_HTTPHEADER,
            array(
                'Content-Type:application/json',
                'Accept: text/plain'
            )
        );  
        $getDataInfoPM10 = curl_exec($chOrderPM10);
        $trimmedPM10 = trim($getDataInfoPM10, ' {"score": ');
        $dataPM10 = round(str_replace("}", ", ", $trimmedPM10), 3) . ',';
        $statusPM10 = curl_getinfo($chOrderPM10, CURLINFO_HTTP_CODE);
        curl_close($chOrderPM10);
        $varArrayPM10[$i] = $dataPM10;
      }
    }
?>
      <div class="dataForAPI" style="margin-top: 43px;">
      <h2 style="text-align: left; margin-left: 10%;"></h2>
        <ul>
            <li class="aboutli-right">Дата:</li>
            <li class="aboutli-right">Время:</li>
            <li class="aboutli-right">NO:</li>
            <li class="aboutli-right">NO2:</li>
            <li class="aboutli-right">CO:</li>
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
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtDatePM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtTimePM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNOPM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNO2PM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtCOPM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtSpeedPM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtNaprPM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtDavleniePM10"></li>
            <li class="aboutli-left"><input type="text" size="40" class="visualData" name="txtVlajPM10stPM10"></li>
            <input type="submit" name="btnStartPM10" class="btnCheck">
          </form>
        </ul>
      </div>
      <div class="dataForAPI">
      <div><h2 style="display: inline-block;">Прогнозируемый уровень загрязнения: </h2> <h2 style="margin-left: 5px; font-size: 25pt; display: inline-block;"><?php echo str_replace(",", "", $varArrayPM10[1]);?></h2></div>
      <canvas id="speedChartPM10" width="200" height="80" style="display: block; margin-left: 65px; width: 200px;"></canvas>
      </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
var speedCanvasPM10 = document.getElementById("speedChartPM10");


Chart.defaults.global.defaultFontFamily = "Lato";
Chart.defaults.global.defaultFontSize = 18;

var speedDataPM10 = {
  labels: ["0:00:00","0:20:00","0:40:00","1:00:00","1:20:00","1:40:00","2:00:00","2:20:00","2:40:00","3:00:00","3:20:00","3:40:00","4:00:00","4:20:00","4:40:00","5:00:00","5:20:00","5:40:00","6:00:00","6:20:00","6:40:00","7:00:00","7:20:00","7:40:00","8:00:00","8:20:00","8:40:00","9:00:00","9:20:00","9:40:00","10:00:00","10:20:00","10:40:00","11:00:00","11:20:00","11:40:00","12:00:00","12:20:00","12:40:00","13:00:00","13:20:00","13:40:00","14:00:00","14:20:00","14:40:00","15:00:00","15:20:00","15:40:00","16:00:00","16:20:00","16:40:00","17:00:00","17:20:00","17:40:00","18:00:00","18:20:00","18:40:00","19:00:00","19:20:00","19:40:00","20:00:00","20:20:00","20:40:00","21:00:00","21:20:00","21:40:00","22:00:00","22:20:00","22:40:00","23:00:00","23:20:00","23:40:00"],
  datasets: [{
    label: "График прогноза PM10",
    data: [<?php for ($i=0; $i < 72; $i++) { 
      echo $varArrayPM10[$i];
    }?>],
  }]
};

var chartOptionsPM10 = {
  legend: {
    display: true,
    position: 'top',
    labels: {
      boxWidth: 80,
      fontColor: 'black'
    }
  }
};


var lineChartPM102 = new Chart(speedCanvasPM10, {
  type: 'line',
  data: speedDataPM10,
  options: chartOptionsPM10
});
</script>
