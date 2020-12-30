<?php
include '../bdd/bd.php';

$vSession = $_POST['session'];
$idmdl = $_POST['ident'];
$nomprd = $_POST['nom'];
$valCouleur = $_POST['couleur'];
$taillePrd = $_POST['taille'];
$prixPrd = $_POST['prix'];
$qantite = $_POST['quantite'];

$reqVerifRef=$bd->prepare('SELECT * FROM produits WHERE id_modele = :id_modele AND couleur_id = :couleur_id AND taille_id = :taille_id ');
$reqVerifRef->bindValue(':id_modele', $idmdl, PDO::PARAM_STR);
$reqVerifRef->bindValue(':couleur_id', $valCouleur, PDO::PARAM_STR);
$reqVerifRef->bindValue(':taille_id', $taillePrd, PDO::PARAM_STR);
$reqVerifRef->execute();

$donneesSpecifPanier= $reqVerifRef->fetch();
$id = $donneesSpecifPanier['id_produit'];

$refPrd = $donneesSpecifPanier['ref_prod'];

/*
$retour = 'session :' . $vSession . '/id_modele:' . $idmdl . '/nom:' .
    $nomprd . '/couleur:' . $couleurPrd .'/taille:' . $taillePrd.  '/prix:' .
    $prixPrd. '/quantite:'. $qantite. '/ref: '. $refPrd . '/id_prod: '.$id ;

echo $retour ;*/



// verification de qtite de ref

$reqVerifQteRef= $bd->prepare('SELECT  * FROM panier WHERE panier_ref_produit = :refPrd');
$reqVerifQteRef->bindValue(':refPrd', $refPrd, PDO::PARAM_STR);
$reqVerifQteRef->execute();

$donneesVerifQteRef= $reqVerifQteRef->fetch();

if($donneesVerifQteRef){
    $refPrdPanier= $donneesVerifQteRef['panier_ref_produit'];
    $qtePrdPanier=$donneesVerifQteRef['panier_qtite_produit'];

    if($refPrdPanier === $refPrd){
        $plusQte= $qtePrdPanier + $qantite;
        $reqModifPanier=$bd->prepare('UPDATE panier SET panier_qtite_produit = :plusQte WHERE panier_ref_produit = :refPrdPanier');
        $reqModifPanier->bindValue(':plusQte', $plusQte, PDO::PARAM_STR);
        $reqModifPanier->bindValue(':refPrdPanier', $refPrdPanier, PDO::PARAM_STR);
        $reqModifPanier->execute();
    }
}else{

    $reqPhoto01=$bd->prepare('SELECT * FROM imgs WHERE produit_modele = :produit_modele AND couleur_id = :couleur_id LIMIT 1');
    $reqPhoto01->bindValue(':produit_modele', $idmdl, PDO::PARAM_INT);
    $reqPhoto01->bindValue('couleur_id', $valCouleur, PDO::PARAM_INT);
    $reqPhoto01->execute();

    $donneesPhoto01= $reqPhoto01->fetch();
    $imgProd = $donneesPhoto01['fichier_prod_img'];

    $idCommande = $vSession;

    $reqInsertPanier= $bd->prepare('INSERT INTO panier (panier_photo_produit, panier_nom_produit, panier_ref_produit, panier_qtite_produit, panier_prix_produit, panier_id_commande)
    VALUES (:imgProd, :nomprd, :refPrd, :qantite, :prixPrd, :idCommande)');
    $reqInsertPanier->bindValue(':imgProd', $imgProd, PDO::PARAM_STR);
    $reqInsertPanier->bindValue(':nomprd', $nomprd, PDO::PARAM_STR);
    $reqInsertPanier->bindValue(':refPrd', $refPrd, PDO::PARAM_STR);
    $reqInsertPanier->bindValue(':qantite', $qantite, PDO::PARAM_INT);
    $reqInsertPanier->bindValue(':prixPrd', $prixPrd, PDO::PARAM_STR);
    $reqInsertPanier->bindValue(':idCommande',  $idCommande, PDO::PARAM_STR);
    $reqInsertPanier->execute();
}
echo $qantite;










