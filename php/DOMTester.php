<p class="starter-template">

<?php

  include_once 'php/PDOMElement.php';
  $de = PDOMElement::createElement("div");
  $de->setAttribute("style","text-align: center; border-radius: 10px; ");
  $de->setAttribute("class","swag");
  $de->onThis("innerHTML=\"SWAG SEX SEX\";");
  $docbody = PDOMElement::body();
  $docbody->onThis("appendChild({$de->getName()});");
  echo "<script type=\"text/javascript\">{$de}{$docbody}</script>";

 ?>
 </p>
