<meta http-equiv="refresh" content="1200">
<?php
date_default_timezone_set("Europe/Moscow");
$dateNow = date('H:i');


$randData = rand(1, 2);

    if(isset($dateNow)){
        $normalCO = rand(1, 20) / 100;
        $normalNO = rand(1, 5) / 100;
        $normalNO2 = rand(1, 7) / 100;
        $normalPM10 = rand(1, 4) / 100;

        $randCO = $normalCO * $randData; //примерные показатели CO
        $randNO = $normalNO * $randData; //примерные показатели NO
        $randNO2 = $normalNO2 * $randData; //примерные показатели NO2
        $randPM10 = $normalPM10 * $randData; //примерные показатели PM1


    }
    $file = './log/logdata.txt';
    $fileCO = './log/crit_data_CO.txt';
    $fileNO = './log/crit_data_NO.txt';
    $fileNO2 = './log/crit_data_NO2.txt';
    $filePM10 = './log/crit_data_PM10.txt';
    // Открываем файл для получения существующего содержимого
    $currentCO = file_get_contents($fileCO);
    $currentNO = file_get_contents($fileNO);
    $currentNO2 = file_get_contents($fileNO2);
    $currentPM10 = file_get_contents($filePM10);
    $current = file_get_contents($file);
    // Добавляем нового человека в файл
    if($randCO > $normalCO) $current .= $randCO."\t".$normalCO."\t".$dateNow."\t"."CO"."\n";
    if($randNO > $normalNO) $current .= $randNO."\t".$normalNO."\t".$dateNow."\t"."NO"."\n";
    if($randNO2 > $normalNO2) $current .= $randNO2."\t".$normalNO2."\t".$dateNow."\t"."NO2"."\n";
    if($randPM10 > $normalPM10) $current .= $randCO."\t".$normalCO."\t".$dateNow."\t"."PM10"."\n";


    if($randCO > $normalCO) $currentCO .= $randCO."\t".$normalCO."\t".$dateNow."\t"."CO"."\n";
    if($randNO > $normalNO) $currentNO .= $randNO."\t".$normalNO."\t".$dateNow."\t"."NO"."\n";
    if($randNO2 > $normalNO2) $currentNO2 .= $randNO2."\t".$normalNO2."\t".$dateNow."\t"."NO2"."\n";
    if($randPM10 > $normalPM10) $currentPM10 .= $randCO."\t".$normalCO."\t".$dateNow."\t"."PM10"."\n";
    // Пишем содержимое обратно в файл
    file_put_contents($fileCO, $currentCO);
    file_put_contents($fileNO, $currentNO);
    file_put_contents($fileNO2, $currentNO2);
    file_put_contents($filePM10, $currentPM10);
    file_put_contents($file, $current);



    $stationTyrist =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationKoptevo =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationOstankino =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationGlebovska =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationSpiridonovka =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationShabolovka =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationMarino =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationProletarsky =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationButlerova =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;
    $stationAcademika =  $randCO + $randNO + $randNO2 + $randPM10 * 10000;

    $dataTwo = 500;
?>