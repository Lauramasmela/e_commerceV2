<?php
include '../../bdd/bd.php';

if (isset($_POST['idSscat'])){
    if (!empty($_POST['idSscat'])){
        $idsscat = $_POST['idSscat'];

        $reqTaillesSscat = $bd->prepare('SELECT distinct taille_id FROM produits WHERE cat_produit_id = :idscp');
        $reqTaillesSscat->bindValue(':idscp', $idsscat, PDO::PARAM_STR);
        $reqTaillesSscat->execute();

    }
}

        while ($donneesTailles=  $reqTaillesSscat->fetch()){
            $reqTailles = $bd->prepare('SELECT taille FROM tailles WHERE id_taille = :idT');
            $reqTailles->bindValue(':idT', $donneesTailles['taille_id'], PDO::PARAM_STR);
            $reqTailles->execute();

            $donneesNomTaille= $reqTailles->fetch();

            ?>
            <div class="col-md-1 mb-3">
            <input class="form-check-input" type="checkbox" name="taillesPrd[]" id="inlineCheckbox<?php echo $donneesTailles['taille_id'] ?>"
                   value="<?php echo $donneesTailles['taille_id'] ?>">
            <label class="form-check-label" for="inlineCheckbox<?php echo $donneesTailles['taille_id'] ?>"><?php echo $donneesNomTaille['taille'] ?>
            </label>
            </div>

<?php

}
?>