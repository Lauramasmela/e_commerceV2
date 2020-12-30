<?php
include '../../bdd/bd.php';
$reqAfficheCouleurs=$bd->prepare('SELECT nom_couleur, codeHexa FROM couleurs');
$reqAfficheCouleurs->execute();
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
                    <a href="index.php?page=2">
                        <button type="button" class="btn btn-round btn-info">Catégorie</button>
                    </a>
                    <a href="index.php?page=3">
                        <button type="button" class="btn btn-round btn-info">Sous-catégorie</button>
                    </a>
                    <a href="index.php?page=4">
                        <button type="button" class="btn btn-round btn-info">Taille</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Ajout de couleur</h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
                        <form class="form-horizontal form-label-left">

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3">Code couleur</label>
                                <div class="col-md-9 col-sm-9  ">
                                    <div class="input-group demo2">
                                        <input type="text" name="codeCouleur" value="#e01ab5" class="form-control"/>
                                        <span class="input-group-addon"><i></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row ">
                                <label class="control-label col-md-3 col-sm-3 ">Nom de la couleur</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" name="nomCouleur" class="form-control"
                                           placeholder="Default Input">
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
                    <h2>Liste de couleurs</h2>
                    <div class="clearfix"></div>

                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-md-12 icButtons">
                            <?php
                            while ($donneesAfficheCouleurs = $reqAfficheCouleurs->fetch()){
                                echo '<div class="col-md-6 mt-3"><h6 class="control-label">' . $donneesAfficheCouleurs['nom_couleur'] . '</h6>';
                                echo '<div class="mb-1"><input class="carreCouleur" style="background: '.$donneesAfficheCouleurs['codeHexa'].'"></div>';
                                //echo '</div>';
                               // echo '<div class="col-md-6 mt-4">';
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


