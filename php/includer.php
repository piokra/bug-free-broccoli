<?php

  if (isset($_REQUEST["target"])) {
      include $_REQUEST["target"].".php";
  }
  else
  {
    include "php\includer_form.php";
  }



 ?>
