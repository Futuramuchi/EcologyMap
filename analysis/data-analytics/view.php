
<body style="margin:0px;">
<?php 
    echo "Данные по округу: Троицк";
  

?>

<?php
//  $arr = array (
//   'Воздух:'=>191,
//   'Вода:'=>67,
//   'Почва:'=>2
//  ); //Массив с парами данных "подпись"=>"значение"
//  require_once('SimplePlot.php'); //Подключить скрипт
//  $plot = new SimplePlot($arr); //Создать диаграмму
//  $plot->show(); //И показать её
?>

<?php
$i = 0;
for ($nextWeek = time() + (24 * 60 * 60); $i < 7; $nextWeek = $nextWeek + (24 * 60 * 60)) { 
  $array[$i] = date('d.m.Y',$nextWeek);
  $i++;
}
?>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="speedChart" width="800" height="400"></canvas>
<script>

var speedCanvas = document.getElementById("speedChart");
var arrayFromPhp = new Array();
arrayFromPhp = <?php 
echo json_encode($array);
?>;
console.log(arrayFromPhp);

Chart.defaults.global.defaultFontFamily = "Lato";
Chart.defaults.global.defaultFontSize = 18;

var speedData = {
  labels: arrayFromPhp,
  datasets: [{
    data: [1,3,2,6,5,2,3],
    backgroundColor: '#5c96dd'
  }]
};

var chartOptions = {
  legend: {
    display: true,
    position: 'none',
    labels: {
      boxWidth: 30,
      fontColor: 'black'
    }
  },
  animations: {
      tension: {
        duration: 1000,
        easing: 'linear',
        from: 1,
        to: 0,
        loop: true
      }
    }
};


var lineChart = new Chart(speedCanvas, {
  type: 'line',
  data: speedData,
  options: chartOptions
});
</script>

</body>