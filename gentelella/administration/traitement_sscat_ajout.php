<?php
include '../../bdd/bd.php';

$action = $_POST['action'];
$ident = $_POST['ident'];
$cat = $_POST['cat'];
$nomSousCat = $_POST['nomsscat'];
$enLigne = $_POST['ligne'];

echo $action.'/'.$ident.'/'.$cat.'/'.$nomSousCat.'/'.$enLigne;