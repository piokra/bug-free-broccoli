  <script type="text/javascript" src="src/bundle.js"></script>

  <div class="starter-template" id = "p_holder">
    <p class="lead" id="canvas_holder" >
      <canvas onclick='toggleFullscreen(document.getElementById("canvas_holder","resizeCanvas")); resizeCanvas();' style="background-color: red;" id = "gl_canvas">
    </p>
  </div>



<?php

function printHidden($string,$id)
{
  echo '<p class="hide" id="'.$id.'" shader_text="';
  echo $string;
  echo '"></p>';
}

function printJS($string)
{
  echo '<script type="text/javascript">';
  echo $string;
  echo '</script>';
}
$fragd = "shaders/frag.frag";
$vertd = "shaders/vert.vert";
$frag = fopen($fragd,"r") or die("Unable to read frag.frag");
$vert = fopen($vertd,"r") or die("Unable to read vert.vert");
$frags = fread($frag,filesize($fragd));
$verts = fread($vert,filesize($vertd));
fclose($frag);
fclose($vert);
printHidden($frags,"frag");
printHidden($verts,"vert");

 ?>
