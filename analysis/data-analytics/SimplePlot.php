<?php
 class SimplePlot {
  private $data = array(), $headers=array(), $percent = array(), $pixels = array();
  private $width, $sum, $count;

  function __construct ($data,$width=100) {
   $this->width = $width;
   $this->headers = array_keys($data);
   $this->data = array_values($data);
   $this->count = count($this->data);
   $this->sum = array_sum($data);
   for ($i=0; $i<$this->count; $i++) {
    if ($this->sum) $this->percent[$i] = max(0,round($this->data[$i]/$this->sum*100.,1));
    else $this->percent[$i] = 0;
    $this->pixels[$i] = max(1,min($this->width,round($this->percent[$i]/$this->width*100.,0)));
   }

  }

  function getStyle() {
   return '<style type="text/css">
    .plotTable {
     border: 0;
     margin: 0;
     padding: 2px;
    }
    .plotHeaderCell {
     text-align: right;
    }
    .plotDataCell {
     text-align: left;
     vertical-align: middle;
     width: '.$this->width.'px;
    }
    .plotItemInCell {
     display: inline-block;
     height: 1em;
     vertical-align: middle;
     background-color: blue;
    }
    .plotCountCell {
     text-align: left;
     vertical-align: middle;
    }
   </style>'."\n";
  }

  function get () {
   $string = $this->getStyle().'<table class="plotTable">'."\n";
   for ($i=0; $i<$this->count; $i++) {
    $string .= '<tr><td class="plotHeaderCell">'.$this->headers[$i].'</td>'."\n";
    $string .= '<td class="plotDataCell"><div class="plotItemInCell" style="width: '.
     $this->pixels[$i].'%;"></div></td>'."\n";
    $string .= '<td class="plotCountCell">';
    $string .= $this->data[$i].' ('.$this->percent[$i].'%)';
    $string .= '</td></tr>'."\n";
   }
   $string .= '</table>'."\n";
   return $string;
  }

  function show () {
   echo $this->get();
  }
 }
?>