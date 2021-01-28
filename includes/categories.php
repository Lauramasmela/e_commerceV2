<?php

$c=$_GET['c'];

if (isset($bd)) {
    $reqSousCat= $bd->prepare('SELECT  id_cat_produit, nom_cat_produit, image FROM categorie_produit WHERE cat_personne_id = :cat_personne_id');
    $reqSousCat->bindValue(':cat_personne_id', $c, PDO::PARAM_INT);
    $reqSousCat->execute();
}


echo '<div id="categoriesF">';
while($donneesSousCat=$reqSousCat->fetch()){

    echo '<div class="cf1"><a href="index.php?page=30&sc='. $donneesSousCat['id_cat_produit'].'">'.
            '<div id="motCat1"><p>'.$donneesSousCat['nom_cat_produit'].'</p></div>'.
                '<img id="im1" src="./'.$donneesSousCat['image'].'" alt="'.$donneesSousCat['nom_cat_produit'].'"></a>';
    echo '</div>';
}
echo '</div>';











