<?php
  
 include('conector.php');
 
     session_start();

  if (isset($_SESSION['username'])) {

    $con = new ConectorBD('localhost', 'root','');      
    if ($con->initConexion('agenda_db')=='OK') {
         ////function   eliminarRegistro($tabla, $condicion){
    if ($con->eliminarRegistro('eventos',"id = '".$_POST['id']."'")){

       $response['msg'] = "OK";
         //echo "Se han actualizado los datos correctamente";
    }

    }else{
      $response['msg'] = "No se pudo conectar a la Base de Datos";
  }


}else {
    $response['msg'] = "No se ha iniciado una sesión";
  }

  echo json_encode($response);

 ?>
