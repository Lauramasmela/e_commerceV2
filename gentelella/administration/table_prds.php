<?php
include '../../bdd/bd.php';
$reqAfficherPrds01 = $bd->prepare('SELECT DISTINCT id_modele FROM produits');
$reqAfficherPrds01->execute();
?>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="x_content">
                <a href="index.php?page=1">
                    <button type="button" class="btn btn-secondary">Retour à l'accueil</button>
                </a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="x_content">
                <div>
                    <a href="index.php?page=7">
                        <button type="button" class="btn btn-round btn-info">Ajouter produit</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Liste des produits</h2>
                    <div class="clearfix"></div>
                    <div id="msg_ajout">
                        <?php
                        if(isset($_SESSION['ok_prd_ajout'])){
                            $msg_ajout_prd = $_SESSION['ok_prd_ajout'];
                            echo $msg_ajout_prd;
                            unset($_SESSION['ok_prd_ajout']);
                        }
                        ?>
                    </div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <table id="datatable-buttons" class="table table-striped table-bordered"
                                       style="width:100%">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>Nom produit</th>
                                        <th>Référence</th>
                                        <th>Catégorie</th>
                                        <th>Sous-catégorie</th>
                                        <th>Prix</th>
                                        <th>Enligne</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <?php
                                        while ($donneesAffichePrdsInfo = $reqAfficherPrds01->fetch()) {

                                            $reqAfficherPrds = $bd->prepare('SELECT * FROM produits WHERE id_modele = :idMod');
                                            $reqAfficherPrds->bindValue(':idMod', $donneesAffichePrdsInfo['id_modele'], PDO::PARAM_STR);
                                            $reqAfficherPrds->execute();
                                            $donneesAffichePrds = $reqAfficherPrds->fetch();

                                            $reqCatP = $bd->prepare('SELECT nom_cat_produit, cat_personne_id FROM categorie_produit WHERE id_cat_produit = :idCP');
                                            $reqCatP->bindValue(':idCP', $donneesAffichePrds['cat_produit_id'], PDO::PARAM_STR);
                                            $reqCatP->execute();
                                            $donneesNomCatProduit = $reqCatP->fetch();

                                            $reqCatNomPersonne = $bd->prepare('SELECT nom_cat_personne FROM categorie_personne WHERE id_cat_personne = :idCPer');
                                            $reqCatNomPersonne->bindValue(':idCPer', $donneesNomCatProduit['cat_personne_id'], PDO::PARAM_STR);
                                            $reqCatNomPersonne->execute();
                                            $donneesNomCatPersonne = $reqCatNomPersonne->fetch();


                                            echo '<td><img src="../../' . $donneesAffichePrds['img_default'] . '" style="width: 50px"></td>' .
                                                '<td>' . $donneesAffichePrds['libelle_prod'] . '</td>' .
                                                '<td>' . $donneesAffichePrds['ref_prod'] . '</td>' .
                                                '<td>' . $donneesNomCatPersonne['nom_cat_personne'] . '</td>' .
                                                '<td>' . $donneesNomCatProduit['nom_cat_produit'] . '</td>' .
                                                '<td>' . $donneesAffichePrds['prix_prod'] . '</td>';
                                            if ($donneesAffichePrds['statut_produit'] == '1') {
                                                echo '<td>oui</td>';
                                            } else {
                                                echo '<td>non</td>';
                                            }

                                            echo '<td>
                                                    <div style="display: block">
                                                    <div><button type="button" class="btn btn-outline-info"><img style="width: 20px" src="images/detail.png"></button></div>                       
                                                        <div><button type="button" class="btn btn-outline-warning"><img style="width: 20px" src="images/pencil.png"></button></div>
                                                        <div><button type="button" class="btn btn-outline-primary"><img style="width: 20px" src="images/photos.png"></button></div>
                                                       <div> <button type="button" class="btn btn-outline-danger"><img style="width: 20px" src="images/delete.png"></button></div>
                                                    </div>
                                                </td>';
                                            echo '</tr>';

                                        }

                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

