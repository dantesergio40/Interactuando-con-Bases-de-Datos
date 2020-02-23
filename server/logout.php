<?php

 session_start();

  if (isset($_SESSION['username'])) {
    session_destroy();
    echo "OK";
    header('location:http:/Final-PhP/client/index.html');
  }
    
    


 ?>
