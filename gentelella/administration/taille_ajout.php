<?php
include '../../bdd/bd.php';
$reqAfficheSsCat= $bd->prepare('SELECT distinct (nom_cat_produit) FROM categorie_produit');
$reqAfficheSsCat->execute();

$reqAfficheTailles=$bd->prepare('SELECT taille FROM tailles');
$reqAfficheTailles->execute();
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
        <div class="col-md-6">
            <div class="x_content">
                <div>
                    <a href="index.php?page=2"><button type="button" class="btn btn-round btn-info">Catégories</button></a>
                    <a href="index.php?page=3"><button type="button" class="btn btn-round btn-info">Sous-catégorie</button></a>
                    <a href="index.php?page=5"><button type="button" class="btn btn-round btn-info">Couleur</button></a>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Ajout de Taille</h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
                        <form class="form-horizontal form-label-left">

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Sous-catégorie</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <select class="form-control">
                                        <option selected="selected">Choisir une catégorie de produit</option>
                                        <?php
                                        while ($donneesAffSsCat = $reqAfficheSsCat->fetch()){
                                            echo '<option>'.$donneesAffSsCat['nom_cat_produit'].'</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row ">
                                <label class="control-label col-md-3 col-sm-3 ">Taille</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" class="form-control" placeholder="exemple: XXL">
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9  offset-md-3">
                                    <button type="button" class="btn btn-dark">Annuler</button>
                                    <button type="submit" class="btn btn-success">Créer</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">

            <div class="x_panel tile">
                <div class="x_title">
                    <h2>Liste des tailles</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-md-12 icButtons">
                            <?php
                            while ($donneesTailles = $reqAfficheTailles->fetch()){
                                echo '<div class="col-md-2"><h6 class="control-label">'.$donneesTailles['taille'].'</h6>';
                                echo '</div>';
                                echo '<div class="col-md-4" >';
                                echo '<button type="button" class="btn btn-outline-warning"><img src="images/pencil.png"></button>';
                                echo '<button type="button" class="btn btn-outline-danger"><img src="images/delete.png"></button>';
                                echo '</div>';
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
