<?php
  include_once 'DOMElement.php'
  /**
   * This is a class that makes it easier to manage
   * htmltemplates.
   */
  class HTMLTemplate
  {
    private $mJS = "";
    private $mID;
    private $mOperation = array('' => , );
    private $mDOMs = array('' => , );
    public function __construct($template_id)
    {
      $this.$mID = "__".$template_id
      $this.doRawOperation("var {$this.$mID}=document.getElementById(\"$template_id\")");

    }


    public function __toString()
    {
      return $this.toJS();
    }

    public function toJS()
    {
      $this.finalizeJS();
      return '<script type="text\javascript">'$this.mJS.'<\script>';
    }

    protected function finalizeJS()
    {
      foreach ($this.$mOperation as $key => $value) {
        $this.$mJS.=$value;
      }
    }

    function setHTML($html)
    {

    }

    function addDOMElement($name, $dom)
    {
      $this.$mDOMs[$name] = $dom;
      $this.$mOperation.push($dom);
    }

    function doRawOperation($opr)
    {
      $this.$mOperation.push($opr);
    }
  }




 ?>
