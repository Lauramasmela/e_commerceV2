<?php
include '../bdd/bd.php';
$vSession = $_SESSION['id_session'];
$idUtilisateur = $_SESSION['loginUserId'];

$reqUser = $bd->prepare('SELECT * FROM utilisateurs WHERE id_utilisateur = :id_utilisateur');
$reqUser->bindValue(':id_utilisateur', $idUtilisateur, PDO::PARAM_INT);
$reqUser->execute();
$donnesUser = $reqUser->fetch();
$prenom = $donnesUser['prenom'];
$nom = $donnesUser['nom'];
$email = $donnesUser['email'];
$adresse = $donnesUser['adresse'];
$ville = $donnesUser['ville'];
$cp = $donnesUser['codepostal'];
$pays = $donnesUser['pays'];

$reqPanierCourant = $bd->prepare('SELECT * FROM panier WHERE panier_id_commande = :panier_id_commande');
$reqPanierCourant->bindValue(':panier_id_commande', $vSession, PDO::PARAM_STR);
$reqPanierCourant->execute();

?>

<div class="container" id="lePani">
    <h3>Mes Informations</h3>
    <div class="row">
        <div class="col-sm-6 infoUser">
            <p><strong>Prenom : </strong> <?php echo $prenom ?></p>
            <p><strong>Nom : </strong><?php echo $nom ?></p>
            <p><strong>Email : </strong><?php echo $email ?></p>

                <div class="form-group">
                    <label for="inputAddress">Adresse</label>
                    <input type="text" name="adresse" class="form-control" id="inputAddress"
                           placeholder="<?php echo $adresse ?>"
                           value="<?php echo $adresse ?>">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputCity">Ville</label>
                        <input type="text" name="ville" class="form-control" id="inputCity"
                               placeholder="<?php echo $ville ?>"
                               value="<?php echo $ville ?>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputZip">Code Postal</label>
                        <input type="text" name="codepostal" class="form-control" id="inputZip"
                               placeholder="<?php echo $cp ?>"
                               value="<?php echo $cp ?>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="inputCountry">Pays</label>
                        <input type="text" name="pays" class="form-control" id="inputCountry"
                               placeholder="<?php echo $pays ?>"
                               value="<?php echo $pays ?>">
                    </div>
                </div>
                <div class="form-group text-center">
                    <a>
                        <button type="button" name="modifierInfoUser" class="btn btn-outline-dark">Modifier Adresse
                        </button>
                    </a>
                </div>

            <div class="form-group text-center">
                <?php include ('./includes/paiement.php'); ?>
            </div>
        </div>

        <div class="col-sm-6 formuValider">
            <?php
            while ($donneesPanierCourant = $reqPanierCourant->fetch()) {
                $refPrd= $donneesPanierCourant['panier_ref_produit'];
                $prixLigne = ($donneesPanierCourant['panier_qtite_produit']) * ($donneesPanierCourant['panier_prix_produit']);

                                $reqPrixLigne = $bd->prepare('UPDATE panier SET panier_prix_ligne = :prixLigne WHERE panier_ref_produit = :refPrd');
                                $reqPrixLigne->bindValue(':refPrd', $refPrd, PDO::PARAM_STR);
                                $reqPrixLigne->bindValue(':prixLigne', $prixLigne, PDO::PARAM_STR);

                                $reqPrixLigne->execute();

                ?>
                <div class="row col-sm-12" style="border-bottom: 1px solid gray">
                    <div class="d-inline-flex">
                        <div class="mb-2 mt-2">
                            <img style="width: 60px;"
                                 src="<?php echo $donneesPanierCourant['panier_photo_produit'] ?>" alt="">
                        </div>
                        <div class="ml-3">
                            <h5><?php echo $donneesPanierCourant['panier_nom_produit'] ?></h5>
                            <p class="mb-0"><?php echo $donneesPanierCourant['panier_ref_produit'] ?></p>
                            <p class="mb-0">Quantité :
                                <?php echo $donneesPanierCourant['panier_qtite_produit'] ?></p>
                        </div>
                        <div class="ml-5"><?php echo $prixLigne . '€' ?></div>
                    </div>

                </div>
                <?php
                $somme += $prixLigne;
            }

            ?>

            <div class="row finCom">
                <div class="row col-sm-12">
                    <div class="d1"><strong>Soustotal de la commande</strong></div>
                    <div class="d2">
                        <strong>
                            <?php
                            echo $somme . '€';
                            $_SESSION['total'] = $somme;
                            ?>
                        </strong></div>
                </div>
                <div class="row col-sm-12" style="border-bottom: thick double gray">
                    <div class="d3">Frais de livraison</div>
                    <?php
                    if ($somme > 50) {
                        $fraisdeLivraison = 10;
                        $fraisdeLivraisonReduction = 0;
                        echo '<div class="d4"><strike>' . $fraisdeLivraison . '€</strike><br><span>' . $fraisdeLivraisonReduction . '€</span></div>';

                    } else {
                        $fraisdeLivraison = 10;
                        echo '<div class="d4"><span>' . $fraisdeLivraison . '€</span></div>';
                    }
                    ?>

                </div>
            </div>
            <div class="row">
                <div>TOTAL :</div>
                <div class="ml-5">
                    <?php
                    if ($somme > 50) {
                        $fraisdeLivraisonReduction = 0;
                        $_SESSION['total'] = $somme;
                    } else {
                        $fraisdeLivraison = 10;
                        $_SESSION['total'] = $somme + $fraisdeLivraison;
                    }
                    echo $_SESSION['total'] . '€';

                    $reqUpdTotalPanier= $bd->prepare('UPDATE panier SET panier_prix_total = :total WHERE panier_id_commande = :vSession');
                    $reqUpdTotalPanier->bindValue(':vSession', $vSession, PDO::PARAM_STR);
                    $reqUpdTotalPanier->bindValue(':total', $_SESSION['total'], PDO::PARAM_STR);
                    $reqUpdTotalPanier->execute();

                    ?>
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
                    Les prix et les frais de livraison ne sont validés que durant la finalisation de la
                    commande. <br>
                    Délai de rétractation de 30 jours. Lisez à propos des retour et remboursement.
                </div>
            </div>
        </div>
    </div>
</div>


