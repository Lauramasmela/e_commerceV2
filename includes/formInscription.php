<?php
include '../bdd/bd.php';

if (isset($_POST['inscriptionValide'])) {
    if (isset($_POST['prenom'], $_POST['nom'], $_POST['email'], $_POST['motdepasse'], $_POST['dateNaissance'])) {
        if (!empty($_POST['prenom']) and
            !empty($_POST['nom']) and
            !empty($_POST['email']) and
            !empty($_POST['motdepasse']) and
            !empty($_POST['dateNaissance'])) {
            $prenom = $_POST['prenom'];
            $nom = $_POST['nom'];
            $email = $_POST['email'];
            $mdpHash = password_hash($_POST['motdepasse'], PASSWORD_BCRYPT);
            date_default_timezone_set('Europe/Paris');
            $dateN = date('Y-m-d', strtotime($_POST['dateNaissance']));

            $req = $bd->prepare("SELECT email FROM utilisateurs WHERE email = :email");
            $req->bindValue(':email', $email, PDO::PARAM_STR);
            $req->execute();

            $donneesEmails = $req->fetch();

            if($donneesEmails){
                echo '<div class="alert alert-info" role="alert">
                    Vous avez déjà un compte chez nous!
                  </div>';

            }else{
                $reqInscription=$bd->prepare('INSERT INTO utilisateurs (prenom, nom, email ,motDePasse, dateNaissance)
VALUES(:prenom, :nom, :email, :motdepasse, :dateNaissance)');
                $reqInscription->bindValue(':prenom',  $prenom, PDO::PARAM_STR);
                $reqInscription->bindValue(':nom',  $nom, PDO::PARAM_STR);
                $reqInscription->bindValue(':email',  $email, PDO::PARAM_STR);
                $reqInscription->bindValue(':motdepasse',  $mdpHash, PDO::PARAM_STR);
                $reqInscription->bindValue(':dateNaissance',  $dateN, PDO::PARAM_STR);
                $reqInscription->execute();

                echo '<div class="alert alert-success" role="alert">
                    Votre inscription a été effectuée avec succès !
                  </div>';

            }
        }else{
            echo '<div class="alert alert-danger" role="alert">
                    Merci de remplir tous les champs.
                  </div>';
        }
    }
}

?>

<div class="container">
    <div id="formInscription">
        <form action="#" method="POST">
            <h3>S'Inscrire</h3>
            <p>Inscrivez-vous pour ne plus passer à côté des promotions, des offres, des remises et des bons de
                réduction.</p>
            <div class="row">
                <div class="col">
                    <label for="exampleInput">Prénom</label>
                    <input type="text" name="prenom" class="form-control" id="exampleInput">
                </div>
                <div class="col">
                    <label for="exampleInput">Nom</label>
                    <input type="text" name="nom" class="form-control" id="exampleInput">
                </div>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Email</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                       aria-describedby="emailHelp">
            </div>
            <div class="form-group">
                <label for="exampleInput">Créer mot de passe</label>
                <input type="text" name="motdepasse" class="form-control" id="exampleInput">
            </div>
            <div class="form-group">
                <label for="exampleInput">Date de Naissance</label>
                <input type="date" name="dateNaissance" class="form-control" id="exampleInput">
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Oui, envoyez-moi par e-mail des offres,
                    des mises à jour de style et des invitations spéciales à des ventes et à des événements.
                </label><br><br>
                <p>Souhaitez-vous que votre boîte de réception soit plus élégante?
                    Pas de problème, abonnez-vous à notre newsletter.
                    Découvrez ce qui se passe dans le monde de la mode,
                    de la beauté et de la décoration intérieure.
                    De plus, vous recevrez des bons d'achat, des offres d'anniversaire et des
                    invitations spéciales à des ventes et à des événements - directement
                    dans votre boîte de réception !
                </p>

            </div>

            <div class="b1">
                <button type="submit" class="btn btn-dark" name="inscriptionValide">M'inscrire</button>
            </div>
        </form>
    </div>

</div>



