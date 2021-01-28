
<?php
include 'bdd/bd.php';
include 'includes/constants.php';

if (isset($_GET['deconnexion'])) {
    $user = null;
    unset($_SESSION['loginUserId']);
    unset($_SESSION['loginUser']);
    header('Location: '.URL.'/index.php?page=0');
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Azucar</title>
    <link rel="stylesheet" href="./boot/bootstrap.css">
    <link rel="stylesheet" href="./style/style.css">

</head>
<body>

<?php
include 'includes/menuBar.php';
if(isset($_GET['page'])){

    $page=$_GET['page'];
    if($page=='0'){

        include ('includes/accueil.php');
    }
    elseif ($page=='3'){
        include "includes/panier.php";
    }elseif ($page=='4'){
        include 'includes/deletePrdPanier.php';
    }
    elseif ($page=='7'){
        include "includes/catN.php";
    }elseif ($page=='14') {
        include "includes/formInscription.php";
    }elseif ($page=='15') {
        include "includes/formConnexion.php";
    }elseif ($page=='16') {
        include "includes/validationConnexion.php";
    }elseif($page=='17'){
        include "includes/validationPanier.php";
    }elseif($page=='18') {
        include "includes/formAdresse.php";
    }elseif ($page=='20'){
        include 'includes/categories.php';
    }elseif ($page=='30'){
        include 'includes/sousCategories.php';
    }elseif ($page=='40'){
        include 'includes/produits.php';
    }elseif ($page=='50'){
        include 'includes/detailPhotosProduit.php';
    }elseif ($page=='60'){
        include 'includes/traitementPanier.php';
    }elseif ($page=='70'){
        include 'includes/recapInfoUser.php';
    }elseif ($page=='71'){
        include 'includes/apresPaiement.php';
    }elseif ($page=='72'){
        include 'includes/paiement.php';
    }
}else{
    include ('includes/accueil.php');
}
include 'includes/footer.php';

?>
<script type="text/javascript" src="js/anexe.js" async></script>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>