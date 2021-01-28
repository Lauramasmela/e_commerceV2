


<?php
include '../bdd/bd.php';
include 'constants.php';
$trans = $_POST['transaction'];
//echo $trans;


if (isset($bd)) {
    $reqCommandes = $bd->prepare('INSERT INTO commandes SELECT * FROM panier WHERE panier_transaction = :trans');

    $reqCommandes->bindValue(':trans', $trans, PDO::PARAM_INT);
    $reqCommandes->execute();


    $reqPanierSupprime = $bd->prepare('DELETE FROM panier WHERE panier_transaction = :trans');
    $reqPanierSupprime->bindValue(':trans', $trans, PDO::PARAM_INT);
    $reqPanierSupprime->execute();


    unset($_SESSION['total']);

    $infoSuccess = '<div class="alert alert-success" role="alert">
 Votre transaction No. ' . $trans . ' s\'est déroulée avec succèes !
</div>';

    $_SESSION['infoPaiementSucces'] = $infoSuccess;
    echo $_SESSION['infoPaiementSucces'];
    echo URL . '/index.php?page=71';

    header('Location:'.URL . '/index.php?page=71');

}

//echo '<script> window.location.replace('.URL.'"/index.php?page=71");</script>';


