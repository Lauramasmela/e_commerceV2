<?php


if (isset($_POST['inscriptionValide'])) {
    if (isset($_POST['prenom'], $_POST['nom'], $_POST['email'], $_POST['motdepasse'], $_POST[''])) {
        if (!empty($_POST['prenom']) and
            !empty($_POST['nom']) and
            !empty($_POST['email']) and
            !empty($_POST['motdepasse']) and
            !empty($_POST['age'])) {
            $prenom = $_POST['prenom'];
            $nom = $_POST['nom'];
            $email = $_POST['email'];
            $mdpHash = password_hash($_POST['motdepasse'], PASSWORD_BCRYPT);
            $age = $_POST['age'];

            $req = $bd->prepare("SELECT email FROM utilisateurs WHERE email = :email");
            $req->bindValue(':email', $email, PDO::PARAM_STR);
            $req->execute();

            $donneesEmails = $req->fetch();

            if($donneesEmails){
                echo '<div class="alert alert-info" role="alert">
                    Vous avez déjà un compte chez nous!
                  </div>';

            }else{
                $reqInscription=$bd->prepare('INSERT INTO utilisateurs (prenom, nom, email ,motDePasse)
VALUES(:prenom, :nom, :email, :motdepasse, :age)');
                $reqInscription->bindValue(':prenom',  $prenom, PDO::PARAM_STR);
                $reqInscription->bindValue(':nom',  $nom, PDO::PARAM_STR);
                $reqInscription->bindValue(':email',  $email, PDO::PARAM_STR);
                $reqInscription->bindValue(':motdepasse',  $mdpHash, PDO::PARAM_STR);
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