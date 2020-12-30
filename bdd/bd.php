<?php
if(session_status() == PHP_SESSION_NONE){
    session_start();
}
if(!isset($_SESSION['id_session'])){
    $_SESSION['id_session']= session_id();
}
try
{
    $bd = new PDO('mysql:host=127.0.0.1:3306;dbname=e-commerce;charset=utf8', 'root', 'root');
    $bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $bd->setAttribute(PDO::ERRMODE_SILENT, PDO::ERRMODE_WARNING);
    $bd->setAttribute(PDO::ATTR_EMULATE_PREPARES , false);
}
catch(PDOException  $e)
{
    echo 'Échec de la connexion : ' . $e->getMessage();
    exit;

}

