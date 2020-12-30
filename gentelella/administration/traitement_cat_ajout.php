<?php
include '../../bdd/bd.php';



$action = $_POST['action'];
$ident = $_POST['ident'];
$nomCat = $_POST['nom'];
$ligne = $_POST['ligne'];


if($action == 'ajouter'){
    $reqAjoutCat = $bd->prepare('INSERT INTO categorie_personne (nom_cat_personne, statut_cat_personne) 
VALUES (:nom_cat_personne, :statut_cat_personne)');
    $reqAjoutCat->bindValue(':nom_cat_personne', $nomCat, PDO::PARAM_STR);
    $reqAjoutCat->bindValue(':statut_cat_personne', $ligne, PDO::PARAM_INT);
    $reqAjoutCat->execute();

    $reqIdCat=$bd->prepare('SELECT id_cat_personne FROM categorie_personne WHERE nom_cat_personne =:nomC');
    $reqIdCat->bindValue(':nomC', $nomCat, PDO::PARAM_STR );
    $reqIdCat->execute();
    $dnn= $reqIdCat->fetch();
    $idCatActu = $dnn['id_cat_personne'];

    $lien= '<a href="index.php?page=2&mod=ok&cat='.$idCatActu.'">';

    echo '<div><h6 id="span-'.$idCatActu.'">' .$nomCat. '</h6></div>
            <div>'.$lien.'<button type="button" name="editerCat" id="editerCat" class="btn btn-outline-warning">
                            <img src="images/pencil.png">
                          </button>
                   </a>
                   <button type="button" name="changerPh" id="changerPh" class="btn btn-outline-primary">
                         <img src="images/photos.png">
                   </button>
                   <a href="index.php?page=12&ic='.$idCatActu.'"><button type="button" name="supprCat" class="btn btn-outline-danger">
                         <img src="images/delete.png">
                    </button></a>
         </div>';




}
else{
    $reqModifCat = $bd->prepare('UPDATE categorie_personne SET nom_cat_personne = :n_c_p, statut_cat_personne = :s_c_p 
WHERE id_cat_personne = :id_cat_p');
    $reqModifCat->bindValue(':id_cat_p', $ident, PDO::PARAM_INT);
    $reqModifCat->bindValue(':n_c_p', $nomCat, PDO::PARAM_STR);
    $reqModifCat->bindValue(':s_c_p', $ligne, PDO::PARAM_INT);
    $reqModifCat->execute();

    $msg =  $nomCat.' a été modifiée correctement!';
    echo $action.'/'.$nomCat.'/'.$msg;
}




