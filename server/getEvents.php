<?php
  include('conector.php');

  session_start();

  if (isset($_SESSION['username'])) {

    $con = new ConectorBD('localhost', 'root', '');      
    if ($con->initConexion('agenda_db')=='OK') {
      $resultado = $con->consultar(['usuario'], ['id'], "WHERE email ='".$_SESSION['username']."'");
      $fila = $resultado->fetch_assoc();
     

      $resultado = $con->getEventUser($fila['id']);//getEventUser($user_id)cargar los eventos del usuario                    
      $i=0;
      //enviar los event con formato indicado title, start, end, allDay
      
      while ($fila = $resultado->fetch_assoc()) {
        $response['eventos'][$i]['id']=$fila['id'];
        $response['eventos'][$i]['title']=$fila['titulo'];
        //$response['eventos'][$i]['allDay']=$fila['allDay']; 
        if($fila['allDay'] == 0) {
        $response['eventos'][$i]['allDay']= false;   
        $response['eventos'][$i]['start']=$fila['start_date']." ".$fila['start_hour'];
        $response['eventos'][$i]['end']=$fila['end_date']." ".$fila['end_hour'];
        } else if($fila['allDay'] == 1){

          $response['eventos'][$i]['allDay']= true;
          $response['eventos'][$i]['start']=$fila['start_date'];
        }    
        $i++;
      }
      $response['msg'] = "OK";

    }else {
      $response['msg'] = "No se pudo conectar a la Base de Datos";
    }
  }else {
    $response['msg'] = "No se ha iniciado una sesión";
  }

  echo json_encode($response);



 ?>


