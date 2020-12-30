


<?php
include '../bdd/bd.php';
$trans = $_POST['transaction'];
echo $trans;

$reqCommandes = $bd->prepare('INSERT INTO commandes SELECT * FROM panier WHERE panier_transaction = :trans');
$reqCommandes->bindValue(':trans', $trans, PDO::PARAM_INT);
$reqCommandes->execute();


$reqPanierSupprime = $bd->prepare('DELETE FROM panier WHERE panier_transaction = :trans');
$reqPanierSupprime->bindValue(':trans', $trans, PDO::PARAM_INT);
$reqPanierSupprime->execute();

unset($_SESSION['total']);

$infoSuccess= '<div class="alert alert-success" role="alert">
 Votre transaction No. '.$trans.' s\'est déroulée avec succèes !
</div>';

$_SESSION['infoPaiementSucces'] = $infoSuccess;

echo '<script> window.location.replace("http://localhost/Formation_cci/e_commerceV2/index.php?page=71");</script>';


?>

