<?php
include '../../bdd/bd.php';

$reqAfficheCats = $bd->prepare('SELECT nom_cat_personne, id_cat_personne FROM categorie_personne');
$reqAfficheCats->execute();

$reqAfficheCouleurs = $bd->prepare('SELECT * FROM couleurs');
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
        <div class="col-md-3">
            <div class="x_content">
                <div>
                    <a href="index.php?page=6">
                        <button type="button" class="btn btn-round btn-info">Liste de produits</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Ajouter produit</h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
                        <form class="form-horizontal form-label-left" action="traitementPrd_ajout_et1.php"
                              method="post" enctype="multipart/form-data">
                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Catégorie</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <select class="form-control" name="liste_cat" id="liste_cat"
                                            onchange="listeSsCat(this.value);">
                                        <option>Sélectionnez la catégorie</option>
                                        <?php
                                        while ($donneesAffCats = $reqAfficheCats->fetch()) {
                                            echo '<option value="' . $donneesAffCats['id_cat_personne'] . '">' . $donneesAffCats['nom_cat_personne'] . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Sous-Categorie</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <select class="form-control" name="list-Sous-Cat" id="list-Sous-Cat"
                                            onchange="listeTailles(this.value);">
                                        <option value="">Sélectionnez la Sous-categorie</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row ">
                                <label class="control-label col-md-3 col-sm-3 ">Nom du produit</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" name="nomPrd" class="form-control"
                                           placeholder="ex: jupe en jean">
                                </div>
                            </div>
                            <div class="form-group row justify-content-center mb-3">
                                <label class="control-label col-md-3 col-sm-3 text-center">Couleur</label>
                                <div class="row col-md-12 form-check-inline">
                                    <?php
                                    while ($donneesAfficheCouleurs = $reqAfficheCouleurs->fetch()) {
                                        echo '<div class="col-md-2 mb-3">
                                            <input class="form-check-input" type="checkbox" name="couleurChoix[]"
                                           id="inlineCheckbox' . $donneesAfficheCouleurs['id_couleur'] . '" 
                                           value="' . $donneesAfficheCouleurs['id_couleur'] . '">' .
                                            '<label class="form-check-label" 
                                            for="inlineCheckbox' . $donneesAfficheCouleurs['id_couleur'] . '">' .
                                            $donneesAfficheCouleurs['nom_couleur'] . '
                                            <input class="carreCouleur" style="background: ' . $donneesAfficheCouleurs['codeHexa'] . '">
                                            </label>
                                            </div>';
                                    }
                                    ?>

                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Tailles</label>
                                <div class="row col-md-6 form-check form-check-inline" id="list_tailles">
                                </div>
                            </div>

                            <div class="ln_solid"></div>

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Photo par default du produit</label>
                                <div class="btn-group">
                                    <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i
                                                class="fa fa-picture-o"></i></a>
                                    <input type="file" name="imgDft" data-role="magic-overlay" data-target="#pictureBtn"
                                           data-edit="insertImage"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Description du produit
                                </label>
                                <div class="col-md-9 col-sm-9 ">
                                    <textarea class="form-control" placeholder="blouse en denim..."
                                              name="descPrd"></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Quantité en stock</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="number" name="qtePrd" class="form-control"
                                           placeholder="3">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Prix</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="number" step="0.01" name="prixPrd" class="form-control"
                                           placeholder="19.99">
                                </div>
                            </div>
                            <div class="ln_solid"></div>

                            <div class="form-group row">
                                <label class="col-md-3 col-sm-3  control-label">En ligne
                                    <br>
                                    <small class="text-navy">Mise en ligne du produit</small>
                                </label>
                                <div class="col-md-9 col-sm-9 ">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" value="1" id="optionsRadios1" name="choix_statut"> Oui
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" value="0" id="optionsRadios2" name="choix_statut"> Non
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9  offset-md-3">
                                    <button type="button" class="btn btn-dark">Annuler</button>
                                    <button type="submit" name="sbtEtape1" id="sbtEtape1" class="btn btn-success">
                                        Créer
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    /******************* Ajax *****************/

    function listeSsCat(idVal) {
        $.ajax({
            type: 'POST',
            url: 'sousCategorieSelect.php',
            data: 'id_cat=' + idVal,
            success: function (data) {
                $('#list-Sous-Cat').html(data);

            }

        });

    }

    function listeTailles(id_sscat) {
        $.ajax({
            type: 'POST',
            url: 'taillesSelect.php',
            data: 'idSscat=' + id_sscat,
            success: function (data) {
                $('#list_tailles').html(data);

            }
        });

    }


</script>