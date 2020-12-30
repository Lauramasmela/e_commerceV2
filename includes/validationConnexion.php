<?php
include '../bdd/bd.php';
//echo 'hi';
/*if (isset($_POST['login'])) {
    if (isset($_POST['email'], $_POST['motdepasse'])) {
        if (!empty($_POST['email']) and
            !empty($_POST['motdepasse'])) {

            $email = $_POST['email'];
            $mdp = $_POST['motdepasse'];

            $req = $bd->prepare('SELECT prenom, email, motDePasse FROM utilisateurs WHERE email = :email');
            $req->bindValue(':email', $email, PDO::PARAM_STR);
            $req->execute();

            $reqVerifUtilisateur = $req->fetch();

            if ($reqVerifUtilisateur) {

                if (password_verify($mdp, $reqVerifUtilisateur['motDePasse'])) {
                   $prenom = $reqVerifUtilisateur['prenom'];
                   // $_SESSION['loginUser'] = $prenom;
                    $status = 'ok';
                    header('Location: http://localhost/Formation_cci/e_commerceV2/index.php?page=0');
                }else{

                   $msg='mdp incorrect';
                    $_SESSION['errormdp'] = $msg;
                   header('Location: http://localhost/Formation_cci/e_commerceV2/index.php?page=15');


                        echo '<div class="alert alert-danger" role="alert">
                                Votre mot de passe  ou email est incorrect;
                            </div>';
                    }
            }else {


                echo '<div class="alert alert-danger" role="alert">
                                Votre email ou mot de passe est incorrect;
                            </div>';
            }
        } else {
            echo '<div class="alert alert-danger" role="alert">
                    Merci de remplir tous les champs.
                  </div>';
        }

    }

}*/

if(isset($_POST['contactFrmSubmit']) && !empty($_POST['email'])  && (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) === false)
    && !empty($_POST['motdepasse'])){

    $email = $_POST['email'];
    $mdp = $_POST['motdepasse'];

    $req = $bd->prepare('SELECT id_utilisateur, prenom, email, motDePasse FROM utilisateurs WHERE email = :email');
    $req->bindValue(':email', $email, PDO::PARAM_STR);
    $req->execute();

    $reqVerifUtilisateur = $req->fetch();

    if ($reqVerifUtilisateur) {

        if (password_verify($mdp, $reqVerifUtilisateur['motDePasse'])) {
            $prenom = $reqVerifUtilisateur['prenom'];
            $id = $reqVerifUtilisateur['id_utilisateur'];
            $_SESSION['loginUserId'] = $id;
            $_SESSION['loginUser'] = $prenom;
            $status = 'ok';
        } else {
            $status = 'err';
        }
    }
    else {
        $status = 'inconnu';
        }
        // Output status
        echo $status;
        die;
}

?>