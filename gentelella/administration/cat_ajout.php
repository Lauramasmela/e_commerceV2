<?php
include '../../bdd/bd.php';
$reqAfficheCats = $bd->prepare('SELECT * FROM categorie_personne');
$reqAfficheCats->execute();

if (isset($_GET['mod']) && isset($_GET['cat'])) {
    $mod = $_GET['mod'];
    $cat = $_GET['cat'];
    $dBlock = 'd-block';
    $dnone = 'd-none';

    $reqNomCat = $bd->prepare('SELECT nom_cat_personne FROM categorie_personne WHERE id_cat_personne = :cat');
    $reqNomCat->bindValue(':cat', $cat, PDO::PARAM_INT);
    $reqNomCat->execute();

    $donneesNomCat = $reqNomCat->fetch();
    $nom_cat = $donneesNomCat['nom_cat_personne'];
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
                    <a href="index.php?page=3">
                        <button type="button" class="btn btn-round btn-info">Sous-catégorie</button>
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
        <div class="col-md-7">
            <div class="x_panel">
                <div class="x_title">
                    <h2 class="<?php if (isset($mod)) {
                        echo $dnone;
                    } ?>">Ajout de Catégorie</h2>
                    <h2 class="d-none <?php if (isset($mod)) {
                        echo $dBlock;
                    } ?>">Modification de Catégorie</h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
                        <form class="form-horizontal form-label-left" method="post">

                            <div class="form-group row ">
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="hidden" name="idCat" id="idCat" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row ">
                                <label class="control-label col-md-3 col-sm-3 ">Nom de catégorie</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" name="nomCat" id="nomCat" class="form-control"
                                           value="<?php if (isset($mod)) {
                                               echo $nom_cat;
                                           } ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 col-sm-3  control-label">En ligne
                                </label>
                                <div class="col-md-9 col-sm-9 ">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" value="1" id="optionsRadios1"
                                                   name="enLigneCat"> Oui
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" value="0" id="optionsRadios2" name="enLigneCat"> Non
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9  offset-md-3">
                                    <button type="button" onclick="updateCat('ajouter', '<?php if (isset($cat)) {
                                        echo $cat;
                                    } ?>');" name="submit"
                                            id="submit" class="btn btn-success <?php if (isset($mod)) {echo $dnone;} ?>">Ajouter
                                    </button>

                                    <button type="button" onclick="updateCat('modifier','<?php if (isset($cat)){echo $cat;}  ?>');"
                                            name="modifierCat"
                                            class="btn btn-success d-none <?php if (isset($mod)) {echo $dBlock;} ?>">Modifier
                                    </button>
                                </div>
                            </div>
                        </form>
                        <div id="test" style="display: none"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-5" id="tabOptions">

            <div class="x_panel tile">
                <div class="x_title">
                    <h2>Liste des catégories</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-md-12 icButtons">
                            <?php
                            while ($donneesAffCats = $reqAfficheCats->fetch()) {
                                $id_cat = $donneesAffCats['id_cat_personne'];
                                $nom_cat = $donneesAffCats['nom_cat_personne'];

                                echo '<div id="newLine"></div>';

                                echo '<div>
                                
                                          <h6 id="span-' . $id_cat . '">' . $nom_cat . '</h6>
                                          </div>';

                                echo '<div><a href="index.php?page=2&mod=ok&cat=' . $id_cat . '">
                                              <button type="button" name="editerCat" id="editerCat" class="btn btn-outline-warning">
                                                  <img src="images/pencil.png">
                                              </button>
                                          </a>';
                                echo '<button type="button" name="changerPh" id="changerPh" class="btn btn-outline-primary">
                                              <img src="images/photos.png">
                                          </button>';
                                echo '<a href="index.php?page=12&ic=' . $id_cat . '"><button type="button" name="supprCat" class="btn btn-outline-danger">
                                                <img src="images/delete.png">
                                          </button></a>';
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


<script>
    /***************** Ajax ******************************/

    function updateCat(ac, idCat) {
        var act = ac;
        var identifiant = idCat;
        var libelle = $('#nomCat').val();
        var enLigne = $('input[type=radio][name=enLigneCat]:checked').attr('value');

        $.post('traitement_cat_ajout.php',
            {
                action: act,
                ident: identifiant,
                nom: libelle,
                ligne: enLigne
            },

            function (data) {
                var res = data.split('/');
                var acCat = res[0];
                var nomCat = res[1];
                var msg = res[2];

                if (act == 'ajouter') {
                    $('#newLine').html(data);
                    $('#nomCat').val('');
                } else {
                    $('#span-' + identifiant).html(nomCat);
                    $('#test').html(msg);
                    $("#test").show("slow").delay(5000).hide("slow");
                    setTimeout(function () {
                        window.location.replace("http://localhost/Formation_cci/e_commerceV2/gentelella/administration/index.php?page=2");
                    }, 6000);
                }
            }
        );

    }

</script>