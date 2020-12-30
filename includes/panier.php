<?php
include '../bdd/bd.php';

$vSession = $_SESSION['id_session'];

$reqPanier = $bd->prepare('SELECT * FROM panier WHERE panier_id_commande = :panier_id_commande');
$reqPanier->bindValue(':panier_id_commande', $vSession, PDO::PARAM_STR);
$reqPanier->execute();


$prdCourant = $bd->prepare('SELECT * FROM panier, produits
WHERE panier.panier_ref_produit = produits.ref_prod');
$prdCourant->execute();
?>
<div class="container" id="lePani">
    <h3>Mon Panier</h3>
    <!--    <p class="statusMsg"></p>-->
    <div class="row">
        <div class="col-sm-8 lePanier">
            <?php while ($donneesPanier = $reqPanier->fetch()) {


                $photoPrd = $donneesPanier['panier_photo_produit'];
                $nomPrd = $donneesPanier['panier_nom_produit'];
                $prixPrd = $donneesPanier['panier_prix_produit'];
                $refPrd = $donneesPanier['panier_ref_produit'];
                $qtePrd = $donneesPanier['panier_qtite_produit'];

                ?>
                <div class="infoProdPanier">
                    <div class="imageProdCourant">
                        <img src="./<?php echo $photoPrd ?>" alt="image chemise bleue">
                    </div>
                    <div class="infoVerticale">
                        <div class="lib_prix">
                            <h4><strong>
                                    <?php echo $nomPrd ?>
                                </strong><br>
                                <?php echo $prixPrd ?> €
                            </h4>
                        </div>
                        <div>
                            <?php
                            echo $donneesPanier['panier_ref_produit'];
                            ?>
                        </div>
                        <div class="infoSpec">
                            <?php
                            $reqInfoS = $bd->prepare('SELECT nom_couleur FROM couleurs, produits WHERE produits.ref_prod = :ref_prod
                            AND produits.couleur_id = couleurs.id_couleur ');
                            $reqInfoS->bindValue(':ref_prod', $donneesPanier['panier_ref_produit'], PDO::PARAM_STR);
                            $reqInfoS->execute();
                            $donneesCo = $reqInfoS->fetch();
                            ?>
                            <div>Couleur: <?php echo $donneesCo['nom_couleur']; ?></div>
                            <div class="taill">Taille:
                                <?php
                                $reqInfoS = $bd->prepare('SELECT taille FROM tailles, produits WHERE produits.ref_prod = :ref_prod
                            AND produits.taille_id = tailles.id_taille ');
                                $reqInfoS->bindValue(':ref_prod', $donneesPanier['panier_ref_produit'], PDO::PARAM_STR);
                                $reqInfoS->execute();
                                $donneesTa = $reqInfoS->fetch();
                                echo $donneesTa['taille']; ?>
                            </div>
                            <div class="form-group">
                                <div class="quantit">
                                    <input type="number" name="qte" id="qte" value="<?php echo $qtePrd ?>">
                                </div>
                            </div>
                        </div>
                        <div class="supPrd">
                            <a href="index.php?page=4">
                                <button type="button" class="btn btn-outline-light"><img src="./img/icons/deletePrd.png"
                                                                                         alt="supprimer produit">
                                </button>
                            </a>
                        </div>
                    </div>

                </div>

                <?php

                $total = $prixPrd * $qtePrd;
                $somme += $total;
            } ?>
        </div>

        <div class="col-sm-4 formuValider">
            <div class="row">
                <div class="col-sm-12"></div>
                <form class="form-inline">
                    <div class="form-group mb-2 ml-4">
                        <label>Avez-vous un code promo?</label>
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                        <input type="text" class="form-control" id="input" placeholder="code promo">
                    </div>
                    <button type="submit" class="btn btn-dark mb-2">Ok</button>
                </form>
            </div>
            <div class="row finCom">
                <div class="row col-sm-12">
                    <div class="d1"><strong>Total de la commande</strong></div>
                    <div class="d2"><strong> <?php echo $somme ?>€</strong></div>
                </div>
                <div class="row col-sm-12">
                    <div class="d3">Total de livraison</div>
                    <div class="d4">00,00€</div>
                </div>
                <div class="butFinCommande">
                    <form role="form">
                        <button type="button" class="submitBtnC" onclick="submitCartForm()" id="validationCde">Finaliser
                            ma commande
                        </button>
                    </form>
                </div>
            </div>
            <div class="row paieInfo">
                <div class="row col-sm-12 na">Nous acceptons</div>
                <div class="row col-sm-12 modePaie">
                    <img src="./img/icons/visa.png" alt="visa">
                    <img src="./img/icons/mastercard.png" alt="mastercard">
                    <img src="./img/icons/american-express.png" alt="American Express">
                    <img src="./img/icons/paypal.png" alt="Pay Pal">
                </div>
                <div class="row col-sm-12 inSup">
                    Les prix et les frais de livraison ne sont validés que durant la finalisation de la commande. <br>
                    Délai de rétractation de 30 jours. Lisez à propos des retour et remboursement.
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /*************************** Ajax formPanier ******************************/



    function submitCartForm() {
        $.ajax({
            type: 'POST',
            url: './includes/validationPanier.php',
            data: 'cartFrmSubmit=1',
            beforeSend: function () {
                $('.submitBtnC').attr("disabled", "disabled");
            },
            success: function (msg) {
                $('.statusMsg').html(msg);
                if (msg === 'nonConnecte') {
                    $('.statusMsg').html('<span style="color:red;">non connecté.</p>');
                    $("#modalForm").modal('show');
                } else {
                    if (msg === 'noAdresse') {
                        window.location.replace("http://localhost/Formation_cci/e_commerceV2/index.php?page=18");
                    } else {
                        //paiement
                        window.location.replace("http://localhost/Formation_cci/e_commerceV2/index.php?page=70");
                    }
                }
                $('.submitBtnC').removeAttr("disabled");
            }
        });
    }

</script>
