<?php
include '../../bdd/bd.php';

$reqAfficheCats = $bd->prepare('SELECT nom_cat_personne, id_cat_personne FROM categorie_personne');
$reqAfficheCats->execute();

$reqAfficheSsCat = $bd->prepare('SELECT distinct (nom_cat_produit) FROM categorie_produit');
$reqAfficheSsCat->execute();

if (isset($_GET['mdf']) && isset($_GET['sscat'])) {
    $mdf = $_GET['mdf'];
    $ss_cat = $_GET['sscat'];
    $dnone = 'd-none';
    $dBlock = 'd-block';

    $reqNomSsCat = $bd->prepare('SELECT * FROM categorie_produit WHERE id_cat_produit = :idssc');
    $reqNomSsCat->bindValue(':idssc', $ss_cat, PDO::PARAM_INT);
    $reqNomSsCat->execute();

    $donneesNomSsCat = $reqNomSsCat->fetch();
    $nom_ss_cat = $donneesNomSsCat['nom_cat_produit'];
    $id_cat_pers = $donneesNomSsCat['cat_personne_id'];

    $req_catPer = $bd->prepare('SELECT nom_cat_personne, id_cat_personne FROM categorie_personne WHERE id_cat_personne = :id');
    $req_catPer->bindValue(':id', $id_cat_pers, PDO::PARAM_INT);
    $req_catPer->execute();
    $donnees = $req_catPer->fetch();

    $nomCat_per = $donnees['nom_cat_personne'];


}


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
                    <a href="index.php?page=4">
                        <button type="button" class="btn btn-round btn-info">Taille</button>
                    </a>
                    <a href="index.php?page=5">
                        <button type="button" class="btn btn-round btn-info">Couleur</button>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2 class="<?php if (isset($mdf)) {
                        echo $dnone;
                    } ?>">Ajout de Sous-catégorie</h2>
                    <h2 class="d-none <?php if (isset($mdf)) {
                        echo $dBlock;
                    } ?>">Modification de Sous-catégorie</h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
                        <form class="form-horizontal form-label-left">

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Catégorie</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <select class="form-control" name="liste_cat" id="liste_cat"
                                            onchange="listeSsCat_affiche(this.value);" required>
                                        <option value="">Choisir une Catégorie</option>
                                        <?php
                                        if (isset($mdf)) {
                                            echo '<option value="' . $id_cat_pers . '">' . $nomCat_per . '</option>';
                                        } else {
                                            while ($donneesAffCats = $reqAfficheCats->fetch()) {
                                                if (isset($mdf)) {
                                                    echo '<option value="' . $ss_cat . '">' . $nom_ss_cat . '</option>';
                                                } else {
                                                    echo '<option value="' . $donneesAffCats['id_cat_personne'] . '">' . $donneesAffCats['nom_cat_personne'] . '</option>';
                                                }
                                            }
                                        }

                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row ">
                                <label class="control-label col-md-3 col-sm-3 ">Nom de sous-catégorie</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" class="form-control" placeholder="Default Input" id="nomSsCat"
                                           name="nomSsCat" value="<?php if (isset($mdf)) {
                                        echo $nom_ss_cat;
                                    } ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 col-sm-3  control-label">En ligne
                                </label>

                                <div class="col-md-9 col-sm-9 ">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" value="1" id="enLigneSsCat"
                                                   name="enLigneSsCat"> Oui
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" value="0" id="enLigneSsCat"
                                                   name="enLigneSsCat"> Non
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9  offset-md-3">
                                    <button type="button" class="btn btn-success <?php if (isset($mdf)) {
                                        echo $dnone;
                                    } ?>" name="submit" id="submit"
                                            onclick="updateSsCat('ajouter', '<?php if (isset($ss_cat)) {
                                                echo $ss_cat;
                                            } ?>');">Ajouter
                                    </button>
                                    <button type="button" class="btn btn-success d-none <?php if (isset($mdf)) {
                                        echo $dBlock;
                                    } ?>"
                                            onclick="updateSsCat('modifier', '<?php echo $ss_cat; ?>');">Modifier
                                    </button>
                                </div>
                            </div>
                        </form>
                        <div id="test"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">

            <div class="x_panel tile">
                <div class="x_title">
                    <h2>Liste des catégories</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-md-12 icButtons">
                            <?php

                            /*while ($donneesAffSsCat = $reqAfficheSsCat->fetch()) {
                            echo '<div class="col-md-6 mt-3"><h6 class="control-label">' . $donneesAffSsCat['nom_cat_produit'] . '</h6>';
                                echo '<button type="button" class="btn btn-outline-warning"><img src="images/pencil.png"></button>';
                                echo '<button type="button" class="btn btn-outline-primary"><img src="images/photos.png"></button>';
                                echo '<button type="button" class="btn btn-outline-danger"><img src="images/delete.png"></button>';
                                echo '</div>';
                            }*/
                            ?>
                            <div class="col-md-12 mt-3" id="sscats_list">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /******************* Ajax *****************/
    function listeSsCat_affiche(idVal) {
        $.ajax({
            type: 'POST',
            url: 'sousCategorieSelect_edit.php',
            data: 'ident_cat=' + idVal,
            success: function (data) {
                $('#sscats_list').html(data);

            }

        });
    }

    function updateSsCat(ac, idSsCat) {
        var act = ac;
        var identifiant = idSsCat;
        var categorie = $('#liste_cat').val();
        var libelle = $('#nomSsCat').val();
        var enLigne = $('input[type=radio][name=enLigneSsCat]:checked').attr('value');

        if (categorie.trim() == '') {
            alert('Merci de choisir une catégorie');
            return false;
        } else if (!$("input[name='enLigneSsCat']").is(':checked')) {
            alert("Merci de choisir si la sous-catégorie sera mise en ligne ou pas");
            return false;
        } else if (libelle.trim() == '') {
            alert("Merci de définir le nom de la sous-catégorie");
            return false;
        } else {
            $.post('traitement_sscat_ajout.php',
                {
                    action: act,
                    ident: identifiant,
                    cat: categorie,
                    nomsscat: libelle,
                    ligne: enLigne
                },

                function (data) {
                    $('#test').html(data);

                }
            );
        }


    }

</script>
