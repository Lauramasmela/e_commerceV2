<?php

const ID_MODELE = ':id_modele';
$mdl = $_GET['mdl'];

if (isset($bd)) {
    $reqDetailProd = $bd->prepare('SELECT * FROM produits WHERE id_modele = :id_modele');
    $reqDetailProd->bindValue(ID_MODELE, $mdl, PDO::PARAM_STR);
    $reqDetailProd->execute();

    $donneesDetailPrd = $reqDetailProd->fetch();

    $modelePrduit = $donneesDetailPrd['id_modele'];
    $nomProduit = $donneesDetailPrd['libelle_prod'];
    $photoProduit = $donneesDetailPrd['img_default'];
    $prixProduit = $donneesDetailPrd['prix_prod'];
}

?>

<div class="container">
    <div class="retour1">
        <a href="">Retour</a>
    </div>
    <div class="row flex-row-reverse justify-content-end">
        <div class="col col-lg-4 col-md-6 col-sm-1">
            <table class="tabAchat">
                <tbody>
                <tr>
                    <td><h4><strong><?php echo $nomProduit; ?></strong></h4>
                        <h4><strong><?php echo $prixProduit; ?> €</strong></h4></td>
                </tr>
                <form method="POST">
                    <tr>
                        <?php
                        $reqProdsInfo = $bd->prepare('SELECT distinct(produits.id_modele), produits.couleur_id, couleurs.nom_couleur, couleurs.codeHexa
                        FROM produits, couleurs 
                        where produits.id_modele = :id_modele 
                          and produits.couleur_id = couleurs.id_couleur');
                        $reqProdsInfo->bindValue(ID_MODELE, $donneesDetailPrd['id_modele'], PDO::PARAM_STR);
                        $reqProdsInfo->execute();

                        echo '<td class="colores">' .
                            '<div class="text-center">COULEURS</div>';

                        while ($donneesCouleur = $reqProdsInfo->fetch()) {
                            $hexCode = $donneesCouleur['codeHexa'];
                            $couleurId = $donneesCouleur['couleur_id'];
                            $nomCouleur = $donneesCouleur['nom_couleur'];


                            echo '<label>' . $nomCouleur . '</label>';
                            echo '<label for="' . $nomCouleur . '">' .
                                '<input type="radio" name="couleurPrd" value="' . $couleurId . '">' .
                                '</label>' . '<br>';
                        }
                        echo '</td>'
                        ?>
                    </tr>

                    <tr>
                        <?php
                        $reqProdsInfoT = $bd->prepare('SELECT distinct (produits.id_modele),tailles.taille, tailles.id_taille 
                        FROM produits, tailles
                        where produits.id_modele = :id_modele
                        and produits.taille_id = tailles.id_taille');
                        $reqProdsInfoT->bindValue(ID_MODELE, $donneesDetailPrd['id_modele'], PDO::PARAM_STR);
                        $reqProdsInfoT->execute();
                        ?>
                        <td>
                            <div class="text-center">TAILLES</div>
                            <select name="taillePrd" id="taillePrd">
                                <option>Choisir taille</option>
                                <?php
                                while ($donneesTailles = $reqProdsInfoT->fetch()) {
                                    echo '<option value="' . $donneesTailles['id_taille'] . '">' . $donneesTailles['taille'] . '</option>';
                                }
                                ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>QUANTITE</div>
                            <div class="quantit">
                                <input type="number" name="qte" id="qte">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <div>
                            <input type="hidden" name="id_session" id="id_session"
                                   value="<?php echo $_SESSION['id_session'] ?>">
                            <input type="hidden" name="img_default" id="img_default"
                                   value="<?php echo $photoProduit ?>">
                            <input type="hidden" name="id_modele" id="id_modele"
                                   value="<?php echo $modelePrduit ?>">
                            <input type="hidden" name="libelle_prod" id="libelle_prod"
                                   value="<?php echo $nomProduit ?>">
                            <input type="hidden" name="prix_prod" id="prix_prod"
                                   value="<?php echo $prixProduit ?>">

                        </div>
                        <td>
                            <button type="button" onclick="ajoutPanier();" name="submit" class="btn btn-dark openbtn">
                                Ajouter au panier
                            </button>
                        </td>
                    </tr>

                </form>
                </tbody>
            </table>
        </div>
        <?php

        $reqImgsPrd = $bd->prepare('SELECT fichier_prod_img, id_imgs FROM imgs WHERE produit_id = :produit_id');
        $reqImgsPrd->bindValue(':produit_id', $donneesDetailPrd['id_produit'], PDO::PARAM_STR);
        $reqImgsPrd->execute();

        while ($donneesDetailImgs = $reqImgsPrd->fetch()) {
            echo '<div class=" col-lg-4 col-md-6 col-sm-1">' .
                '<a href="index.php?page=50&prd=' . $donneesDetailPrd['id_produit'] . '&act=' . $donneesDetailImgs['id_imgs'] . '">' .
                '<img class="imdet1" src="./' . $donneesDetailImgs['fichier_prod_img'] . '" alt="' . $donneesDetailPrd['libelle_prod'] . '">' .
                '</a>' .
                '</div>';
        }
        ?>
    </div>

</div>

<script>
    function ajoutPanier() {
        var session = $('#id_session').val();
        var identifiant = $('#id_modele').val();
        var nom = $('#libelle_prod').val();
        var couleur = $('input[type=radio][name=couleurPrd]:checked').attr('value');
        var taille = $('#taillePrd option:selected').attr('value');
        var prix = $('#prix_prod').val();
        var qte = $('#qte').val();

        $.post('./includes/traitementPanier.php',
            {
                session: session,
                ident: identifiant,
                nom: nom,
                couleur: couleur,
                taille: taille,
                prix: prix,
                quantite: qte

            },
            function (data) {
                $('#infoSuccess').css('display', 'block');
                setTimeout("$('#infoSuccess').css('display', 'none')", 2500);
                //$('#retour').html(data);
                $('#badge').css('display', 'block')
                if (isNaN(parseInt($('#badge').html()))) {
                    $('#badge').html(parseInt(data));
                } else {
                    $('#badge').html(parseInt($('#badge').html()) + parseInt(data));
                }
            }
        );
    }

</script>
