<?php
   $title = "";
   if(isset($_GET['title'])) {
      $title = $_GET['title'];
   }
   $fileName = "../images/".time()."-".$title.round(rand(1,10000)).".png"; // ƒtƒ@ƒCƒ‹–¼‚ÍŽžŠÔ‚©‚ç
   $fp = fopen($fileName, 'wb');
   fwrite($fp, $GLOBALS['HTTP_RAW_POST_DATA']);
   fclose($fp);
?>