<?php
if (isset($_SESSION['loginUserId'], $_SESSION['loginUser'])) {
    $id = $_SESSION['loginUserId'];
    $prenom = $_SESSION['loginUser'];

    $reqInfoUser = $bd->prepare('SELECT id_utilisateur, prenom, nom, email FROM utilisateurs WHERE id_utilisateur = :id_utilisateur');
    $reqInfoUser->bindValue(':id_utilisateur', $id, PDO::PARAM_STR);
    $reqInfoUser->execute();

    $donnesUser = $reqInfoUser->fetch();
    if ($donnesUser) {
        $id = $donnesUser['id'];
        $nom = $donnesUser['nom'];
        $email = $donnesUser['email'];
        ?>


        <div class="container" id="lePani">
            <h3>Mes Informations</h3>
            <div class="row">
                <div class="col-sm-8 infoUser">
                    <p><strong>Prenom : </strong> <?php echo $prenom ?></p>
                    <p><strong>Nom : </strong><?php echo $nom ?></p>
                    <p><strong>Email : </strong><?php echo $email ?></p>
                    <form action="#" method="POST">
                        <div class="form-group">
                            <label for="inputAddress">Adresse</label>
                            <input type="text" name="adresse" class="form-control" id="inputAddress" placeholder="">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputCity">Ville</label>
                                <input type="text" name="ville" class="form-control" id="inputCity">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputZip">Code Postal</label>
                                <input type="text" name="codepostal" class="form-control" id="inputZip">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="inputCountry">Pays</label>
                                <input type="text" name="pays" class="form-control" id="inputCountry">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="validerInfoAdresse" class="btn btn-dark">Valider Information
                            </button>
                        </div>

                    </form>
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
                            <div class="d2"><strong> 29,99€</strong></div>
                        </div>
                        <div class="row col-sm-12">
                            <div class="d3">Total de livraison</div>
                            <div class="d4">00,00€</div>
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

        <?php
        if (isset($_POST['validerInfoAdresse'])) {
            if (isset($_POST['adresse'], $_POST['ville'], $_POST['codepostal'], $_POST['pays'])) {
                if (!empty($_POST['adresse']) && !empty($_POST['ville']) && !empty($_POST['codepostal']) && !empty($_POST['pays'])) {

                    $adresse=$_POST['adresse'];
                    $ville=$_POST['ville'];
                    $cp=$_POST['codepostal'];
                    $pays=$_POST['pays'];

                    $reqInfoSup = $bd->prepare('UPDATE utilisateurs SET adresse = :adresse, ville = :ville, codepostal = :codepostal, pays = :pays, statut_utilisateur = 1 WHERE id_utilisateur = :id_utilisateur');
                    $reqInfoSup->bindValue(':id_utilisateur', $_SESSION['loginUserId'], PDO::PARAM_INT);
                    $reqInfoSup->bindValue(':adresse', $adresse, PDO::PARAM_STR);
                    $reqInfoSup->bindValue(':ville', $ville, PDO::PARAM_STR);
                    $reqInfoSup->bindValue(':codepostal', $cp, PDO::PARAM_STR);
                    $reqInfoSup->bindValue(':pays', $pays, PDO::PARAM_STR);
                    $reqInfoSup->execute();

                    echo '<script> window.location.replace("http://localhost/Formation_cci/e_commerceV2/index.php?page=70");</script>';

                       


                } else {
                    echo '<div class="alert alert-danger" role="alert">
                            Merci de remplir tous les champs !
                        </div>';
                }

            }


        }

    }
}
?>