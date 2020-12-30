<?php
include '../../bdd/bd.php';

if (isset($_GET['ic'])) {
    $id_cat = $_GET['ic'];

    $reqCat = $bd->prepare('SELECT * FROM categorie_personne where id_cat_personne = :idCat');
    $reqCat->bindValue(':idCat', $id_cat, PDO::PARAM_INT);
    $reqCat->execute();

    $donneesCat = $reqCat->fetch();
    if ($donneesCat) {
        $nomCat = $donneesCat['nom_cat_personne'];

        if (isset($_POST['suppr_cat'])) {

            $req_supp = $bd->prepare('DELETE FROM categorie_personne WHERE id_cat_personne = :id_cat_personne');
            $req_supp->bindValue(':id_cat_personne', $id_cat, PDO::PARAM_INT);
            $req_supp->execute();

            echo '<script> 
                    setTimeout(function() {
                       document.querySelector("#msg").innerHTML="Cette Catégorie a été supprimée avec succès!.<br> Redirection en cours...";
                   }, 1000) ;
                    
                   setTimeout(function() {          
                     window.location.replace("http://localhost/Formation_cci/e_commerceV2/gentelella/administration/index.php?page=2")
                   }, 5000) ;
                 </script>';
        }

    } else {
        echo "<div class='alert alert-warning' role='alert'>
                            Cette catégorie n'existe plus.
                    </div>";
    }

}


?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="msg"></div>
            <div class="x_panel">
                <div class="x_title">
                    <h2 class="text-center">Supprimer catégorie <?php echo $nomCat ?></h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
                        <div>
                            <h3>
                                Vous êtes sûr de bien vouloir supprimer la catégorie <?php echo $nomCat ?> ?
                            </h3>
                        </div>

                        <div>
                            <form action="#" method="post">

                                <a href="index.php?page=2">
                                    <button type="button" class="btn btn-secondary">Annuler</button>
                                </a>

                                <button type="submit" class="btn btn-danger" name="suppr_cat">Supprimer</button>
                            </form>
                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

