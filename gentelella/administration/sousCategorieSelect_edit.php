<?php
include '../../bdd/bd.php';

if (isset($_POST['ident_cat'])){
    $idCat= $_POST['ident_cat'];

    $reqAfficheSSCat= $bd->prepare('SELECT * FROM categorie_produit WHERE cat_personne_id = :idCat_pers');
    $reqAfficheSSCat->bindValue(':idCat_pers', $idCat, PDO::PARAM_INT);
    $reqAfficheSSCat->execute();

}


while ($donneesIdCat = $reqAfficheSSCat->fetch()){
    $nomCatPrd=$donneesIdCat['nom_cat_produit'];
    $idCatPrd= $donneesIdCat['id_cat_produit'];
    echo '<div class="col-md-6 mt-3"><h6 class="control-label">' . $nomCatPrd . '</h6>'.
    '<a href="index.php?page=3&mdf=ok&sscat='.$idCatPrd.'"><button type="button" class="btn btn-outline-warning"><img src="images/pencil.png"></button></a>'.
     '<button type="button" class="btn btn-outline-primary"><img src="images/photos.png"></button>'.
    '<button type="button" class="btn btn-outline-danger"><img src="images/delete.png"></button>'.
     '</div>';
}
?>


