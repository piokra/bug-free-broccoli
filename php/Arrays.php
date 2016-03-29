<?php

/**
 *
 */
class Arrays
{
  public static function printAsKeyValue($array)
  {
    self::checkArray($array);
    $buf = "";
    self::printAsKeyValue(0,$indentCount,$buf);
    return $buf;
  }
  public static function printAsKeyValue($array, $indentCount, $buf)
  {
    if(is_array($array))
    {
      $buf.="<br>"
      $buf.
      self::printAsKeyValue($array, $indentCount+1, $buf);
    } else
    {
      $buf.=self::tabs($indentCount);
      $buf.=$array;

    }
    $buf.="<br>"

  }
  protected static function throwAnArrayException($array)
  {
    throw new Exception("Not an array exception {__class__}", 1);
  }

  protected static function checkArray($array)
  {
    if(!is_array($array))
    {
      self::throwAnArrayException($array);
    }
  }
  protected static function tabs($count)
  {
    $ret = "";
    for ($i=0; $i < $count; $i++) {
      $ret .= "\t"
    }
    return $ret;
  }
}



 ?>
