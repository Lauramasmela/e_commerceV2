<?php
include '../../bdd/bd.php';

$rq=$bd->prepare('SELECT * FROM produits WHERE id_modele = (SELECT MAX(id_modele) FROM produits)');
$rq->execute();
$d = $rq->fetch();

$maxIdMdl= $d['id_modele'];

if (isset($_POST['sbtEtape1'])) {

    if (isset($_POST['liste_cat']) and isset($_POST['list-Sous-Cat']) and isset($_POST['nomPrd']) and isset($_POST['couleurChoix']) and
            isset($_POST['taillesPrd']) and  isset($_POST['descPrd']) and isset($_POST['qtePrd']) and isset($_POST['prixPrd']) and isset($_POST['choix_statut']) and
        !empty($_POST['liste_cat']) and !empty($_POST['list-Sous-Cat']) and !empty($_POST['nomPrd']) and
        !empty($_POST['couleurChoix']) and !empty($_POST['taillesPrd']) and !empty($_POST['descPrd']) and
        !empty($_POST['qtePrd']) and !empty($_POST['prixPrd'])) {


        $reqRefVal = $bd->prepare('SELECT * FROM categorie_produit WHERE id_cat_produit = :idcp');
        $reqRefVal->bindValue('idcp', $_POST['list-Sous-Cat'], PDO::PARAM_STR);
        $reqRefVal->execute();
        $donneesValCats = $reqRefVal->fetch();

        $reqNomCatPersonne = $bd->prepare('SELECT id_cat_personne, nom_cat_personne FROM categorie_personne WHERE id_cat_personne = :idCPers');
        $reqNomCatPersonne->bindValue(':idCPers', $donneesValCats['cat_personne_id'], PDO::PARAM_INT);
        $reqNomCatPersonne->execute();

        $donneesNomPersonne = $reqNomCatPersonne->fetch();


        /***** TRAITEMENT IMAGE ********/
        $nom_cat_pers = $donneesNomPersonne['nom_cat_personne'];
        $nom_pers_fichier = strtolower($nom_cat_pers);

        $nom_cat_prod = $donneesValCats['nom_cat_produit'];
        $nom_prods_fichier = strtolower($nom_cat_prod);

        if ($nom_prods_fichier != 'chaussures') {
            $nom_prods_fichier = $nom_prods_fichier . 's';
        }

        if ($nom_pers_fichier == 'garçon') {
            $nom_pers_fichier = 'garcon';
        }


        $img = $_FILES['imgDft'];

        if (is_uploaded_file($img['tmp_name'])) {
            if ($img['error'] != 0) {
                echo "L'image n'a pas pu être téléchargée";
            }
        }

        $extAutorisees = array(IMAGETYPE_JPEG, IMAGETYPE_GIF, IMAGETYPE_PNG);
        $extReelle = exif_imagetype($img['tmp_name']);
        if (!in_array($extReelle, $extAutorisees)) {
            echo 'les seules extensions acceptées sont: .jpeg, .gif, .png';
        }

        $destination = 'imgs/produits/' . $nom_pers_fichier . '/' . $nom_prods_fichier . '/' . $img['name'];
        if (!move_uploaded_file($img['tmp_name'], $destination)) {
            echo 'un probleme est survenu avec les fichiers';
        }
        /***************************************************************/

        $idMdl = $maxIdMdl + 1;
        $sscat = $_POST['list-Sous-Cat'];
        $nomPrd = $_POST['nomPrd'];

        $descPrd = $_POST['descPrd'];
        $qtePrd = $_POST['qtePrd'];
        $prixPrd = $_POST['prixPrd'];
        $choix_enligne = $_POST['choix_statut'];

        foreach ($_POST['couleurChoix'] as $valCouleur){

        if ($valCouleur < 10) {
            $refCouleur = '0' . $valCouleur;
        } else {
            $refCouleur = $valCouleur;
        }


        foreach ($_POST['taillesPrd'] as $valTaille) {
            if ($valTaille < 10) {
                $refTaille = '0' . $valTaille;
            } else {
                $refTaille = $valTaille;
            }

            if ($donneesValCats['cat_personne_id'] < 9) {
                $cat_per = '0' . $donneesValCats['cat_personne_id'];
            } else {
                $cat_per = $donneesValCats['cat_personne_id'];
            }

            if ($sscat < 9) {
                $cat_pro = '0' . $sscat;
            } else {
                $cat_pro = $sscat;
            }

            $ref = 'ref' . $cat_per . $cat_pro . '-' . $refTaille . $refCouleur . '-' . $idMdl;


            $reqAjoutPrd = $bd->prepare('INSERT INTO produits (id_modele, cat_produit_id, taille_id, couleur_id, libelle_prod, prix_prod, ref_prod, description_prod, quantite, img_default, statut_produit)
VALUES (:id_modele, :cat_produit_id, :taille_id, :couleur_id, :libelle_prod, :prix_prod, :ref_prod, :description_prod, :quantite, :img_default, :statut_produit)');
            $reqAjoutPrd->bindValue(':id_modele', $idMdl, PDO::PARAM_INT);
            $reqAjoutPrd->bindValue(':cat_produit_id', $sscat, PDO::PARAM_INT);
            $reqAjoutPrd->bindValue(':taille_id', $valTaille, PDO::PARAM_INT);
            $reqAjoutPrd->bindValue(':couleur_id', $valCouleur, PDO::PARAM_INT);
            $reqAjoutPrd->bindValue(':libelle_prod', $nomPrd, PDO::PARAM_STR);
            $reqAjoutPrd->bindValue(':prix_prod', $prixPrd, PDO::PARAM_STR);
            $reqAjoutPrd->bindValue(':ref_prod', $ref, PDO::PARAM_STR);
            $reqAjoutPrd->bindValue(':description_prod', $descPrd, PDO::PARAM_STR);
            $reqAjoutPrd->bindValue(':quantite', $qtePrd, PDO::PARAM_INT);
            $reqAjoutPrd->bindValue(':img_default', $destination, PDO::PARAM_LOB);
            $reqAjoutPrd->bindValue(':statut_produit', $choix_enligne, PDO::PARAM_INT);
            $reqAjoutPrd->execute();

            $msg_ok_prd_ajout = '<div class="alert alert-success" role="alert">
                                Le produit a été ajouté avec succès 
                                </div>';
            $_SESSION['ok_prd_ajout'] = $msg_ok_prd_ajout;

            header('Location: http://localhost/Formation_cci/e_commerceV2/gentelella/administration/index.php?page=6');
        }
    }

    } else {
        echo 'merci de remplir tout les champs';
    }

}









