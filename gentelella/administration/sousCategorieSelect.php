<?php
include '../../bdd/bd.php';

if(isset($_POST['id_cat'])){
    if (!empty($_POST['id_cat'])){
        $cat = $_POST['id_cat'];

        $reqAfficheSsCat= $bd->prepare('SELECT * FROM categorie_produit WHERE cat_personne_id = :idCat');
        $reqAfficheSsCat->bindValue(':idCat',  $cat, PDO::PARAM_STR );
        $reqAfficheSsCat->execute();
    }
}

?>

<option value="">Sélectionnez la Sous-categorie</option>

<?php
while ($donneesIdCat = $reqAfficheSsCat->fetch()){
    ?>
    <option value="<?php echo $donneesIdCat['id_cat_produit'] ?>"><?php echo $donneesIdCat['nom_cat_produit'] ?></option>

<?php

}
?>

