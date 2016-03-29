<?php

/**
 *
 */
class PDOMElement
{
  protected static $num = 0;
  private $mOperationList = array();
  private $mJSCode = "";
  private $mID ="";
  private $mProperties = array();
  private $mVariableSetUp = "";

  public static function body()
  {
    $instance = new static();
    $instance->mID = "__".self::$num;
    $instance->mVariableSetUp = "var {$instance->mID}=document.body;";
    self::$num++;
    return $instance;
  }

  public static function fromExistingByID($id)
  {
    $instance = new static();
    $instance->mID = "__".$id;
    $t = $instance->mID;
    $instance->mVariableSetUp = "var {$t}=document.getElementById(\"$id\");";
    return $intance;
  }

  public static function createElement($element)
  {
    $ins = new static();
    $ins->
      mID
        = "__PHPGeneratedDOMObject".self::$num;
    $t = $ins->mID;
    self::$num++;
    $ins->mVariableSetUp = "var {$t}=document.createElement(\"$element\");\n";
    return $ins;
  }

  protected function __construct()
  {
  }



  public function __toString()
  {
    $ret = "\n".$this->mVariableSetUp;
    $ret .= $this->getPropertySetUpJS();
    foreach ($this->mOperationList as $key => $value)
    {
        $ret .= $value."\n";
    }
    return $ret;
  }

  public function getID()
  {
    return $this->mID;
  }
  public function getName()
  {
    return $this->mID;
  }
  public function doRawOperation($operation)
  {
    array_push($this->mOperationList,$operation);
  }
  public function setAttribute($key,$value)
  {
    $this->mProperties[$key] = $value;
  }
  public function onThis($string)
  {
    $this->doRawOperation("{$this->mID}.".$string);
  }
  protected function getPropertySetUpJS()
  {
    $ret = "";

    foreach ($this->mProperties as $key => $value) {
      $ret.= "{$this->mID}.setAttribute(\"{$key}\",\"{$value}\");";
    }

    return "\n".$ret;
  }
}



 ?>
