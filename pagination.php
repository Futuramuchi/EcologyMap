<?php
// Поверка, есть ли GET запрос
if (isset($_GET['pageno'])) {
    if($_GET['pageno'] == 1){
        echo "Стандартная карта";
    }
    else{
        echo "Прогноз по карте ".$_GET['pageno'];
    }
    $pageno = $_GET['pageno'];
} else { 
    $pageno = 1;
}



$size_page = 5;
$offset = ($pageno-1) * $size_page;
$total_rows = 72;
$total_pages = ceil($total_rows / $size_page);

?>
<ul class="pagination">
    <li><a href="?pageno=1">First</a></li>
    <li class="<?php if($pageno <= 1){ echo 'disabled'; } ?>">
        <a href="<?php if($pageno <= 1){ echo '#'; } else { echo "?pageno=".($pageno - 1); } ?>">Prev</a>
    </li>
    <li class="<?php if($pageno >= $total_pages){ echo 'disabled'; } ?>">
        <a href="<?php if($pageno >= $total_pages){ echo '#'; } else { echo "?pageno=".($pageno + 1); } ?>">Next</a>
    </li>
    <li><a href="?pageno=<?php echo $total_pages; ?>">Last</a></li>
</ul>