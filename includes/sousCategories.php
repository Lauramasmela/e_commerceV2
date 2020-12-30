<?php
$sc=$_GET['sc'];
$reqProds=$bd->prepare('SELECT DISTINCT id_modele FROM produits WHERE cat_produit_id = :cat_produit_id');
$reqProds->bindValue(':cat_produit_id', $sc, PDO::PARAM_STR);
$reqProds->execute();

echo '<div class="container chems">';
echo '<div class="row chColum">';

while($donneesProduits=$reqProds->fetch()){

    $reqProdsNom=$bd->prepare('SELECT *  FROM produits WHERE id_modele = :id_modele');
    $reqProdsNom->bindValue(':id_modele', $donneesProduits['id_modele'], PDO::PARAM_STR);
    $reqProdsNom->execute();

    $donneesProduitsNoms=$reqProdsNom->fetch();

    echo ' <div class="col col-lg-4 col-md-6 col-sm-1">'.
            '<a href="index.php?page=40&mdl='.$donneesProduitsNoms['id_modele'].'">'.
                '<img src="./'.$donneesProduitsNoms['img_default'].'" alt="'. $donneesProduitsNoms['libelle_prod'].'">'.
                    '<p>'. $donneesProduitsNoms['libelle_prod'].'<br>'.$donneesProduitsNoms['prix_prod'].'€</p>'.
            '</a>'.
        '</div>';
}

echo '</div>';
echo '</div>';