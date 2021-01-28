<?php
include '../../bdd/bd.php';
if (isset($_POST['validationSubmit'])) {
    if (isset($_POST['email'], $_POST['motdepasse']) and
        !empty($_POST['email']) and
        !empty($_POST['motdepasse'])) {

        $email = $_POST['email'];
        $mdp = $_POST['motdepasse'];

        if (isset($bd)) {
            $reqUser = $bd->prepare('SELECT * FROM admin WHERE email = :email');
            $reqUser->bindValue(':email', $email, PDO::PARAM_STR);
            $reqUser->execute();
        }


        $donneesUserAdmin = $reqUser->fetch();

        if ($donneesUserAdmin) {
            if (password_verify($mdp, $donneesUserAdmin['motDePasse'])) {
                echo 'ok';

                $user_username = $donneesUserAdmin['username'];
                $user_id= $donneesUserAdmin['id_admin'];
                $user_nom = $donneesUserAdmin['nom'];
                $user_prenom = $donneesUserAdmin['prenom'];
                $user_photo = $donneesUserAdmin['photo'];
                $user_role= $donneesUserAdmin['role'];

                $_SESSION['user_username'] =  $user_username;
                $_SESSION['user_id'] = $user_id;
                $_SESSION['user_nom']= $user_nom;
                $_SESSION['user_prenom']= $user_prenom;
                $_SESSION['user_photo']=$user_photo;
                $_SESSION['user_role']= $user_role;

//                header('Location: http://localhost/Formation_cci/e_commerceV2/gentelella/administration/index.php');
                header('Location: index.php?');

            } else {
                $msgErrDonnees = '<div class="alert alert-danger" role="alert">
                    Votre adresse mail ou votre mot de passe est incorrect
                 </div>';
                $_SESSION['msgErrDonnees'] = $msgErrDonnees;
//                header('Location: http://localhost/Formation_cci/e_commerceV2/gentelella/administration/index.php');
                header('Location: index.php?');

            }
        } else {
            $msgErrDonnees = '<div class="alert alert-danger" role="alert">
                    Votre adresse mail ou votre mot de passe est incorrect
                 </div>';
            $_SESSION['msgErrDonnees'] = $msgErrDonnees;
//            header('Location: http://localhost/Formation_cci/e_commerceV2/gentelella/administration/index.php');
            header('Location: index.php?');

        }
    } else {

        $msg = '<div class="alert alert-danger" role="alert">
                    Merci de remplir tous les champs
                 </div>';

        $_SESSION['msgErrChampVide'] = $msg;
//        header('Location: http://localhost/Formation_cci/e_commerceV2/gentelella/administration/connexion.php');
        header('Location: connexion.php');


    }
}