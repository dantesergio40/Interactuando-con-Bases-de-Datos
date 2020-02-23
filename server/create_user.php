<?php

 include('conector.php');

  $con = new ConectorBD('localhost','root','');  

  if ($con->initConexion('agenda_db')=='OK') {
    $conexion = $con->getConexion();

//crear plantilla una sola vez ($insert=) y reutilizarla
    $insert = $conexion->prepare('INSERT INTO usuario ( nombre, email, fechaNto, psw) VALUES (?,?,?,?)');
    //"sssi"=> tipo de dato da cada campo
    $insert->bind_param("ssss",  $nombre, $email, $fechaNto, $psw);

    //$id = 1;
    $nombre = 'Dante Sergio Caballero';
    $email = 'Dante@mail.com';
    $fechaNto = '1972-11-14';
    $psw = password_hash('12345Dante', PASSWORD_DEFAULT);
    $insert->execute();

    //$id = 2;
    $nombre = 'Diego Sebastian Caballero';
    $email = 'Diego@mail.com';
    $fechaNto = '1982-11-14';
    $psw = password_hash('12345Diego', PASSWORD_DEFAULT);
    $insert->execute();

    $nombre = 'Daniel Silvio Caballero';
    $email = 'Daniel@mail.com';
    $fechaNto = '1992-11-14';
    $psw = password_hash('12345Daniel', PASSWORD_DEFAULT);
    $insert->execute();    

    echo "Se insertaron los registros exitosamente";

    $con->cerrarConexion();

  }else {
    echo "Se presentó un error en la conexión";
  }




 ?>