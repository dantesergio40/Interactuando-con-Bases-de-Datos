<?php

 include('conector.php');
 
   session_start();

  if (isset($_SESSION['username'])) {

    $con = new ConectorBD('localhost', 'root','');      
    if ($con->initConexion('agenda_db')=='OK'){

    	       $resultado = $con->consultar(['eventos'], ['dia_completo'], "WHERE id ='".$_POST['id']."'");
               $fila = $resultado->fetch_assoc();

               if($fila['dia_completo'] == 0) { 
                   $datos['fecha_fin'] = "'".$_POST['end_date']."'";
                   $datos['fecha_inicio'] = "'".$_POST['start_date']."'";
                    
                }else if($fila['dia_completo'] == 1){
                   $datos['fecha_inicio'] = "'".$_POST['start_date']."'";
                }


//     function actualizarRegistro($tabla, $data, $condicion){"WHERE nombre =" ")
    if ($con->actualizarRegistro('eventos', $datos, "id ='" .$_POST['id']."'" )) {

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


 
