<?php
include '../bdd/bd.php';

if (isset($_POST['contactFrmSubmit']) && !empty($_POST['email']) && (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) === false)
    && !empty($_POST['motdepasse'])) {

    $email = $_POST['email'];
    $mdp = $_POST['motdepasse'];

    if (!empty($bd)) {
        $req = $bd->prepare('SELECT id_utilisateur, prenom, email, motDePasse FROM utilisateurs WHERE email = :email');
        $req->bindValue(':email', $email);
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
        } else {
            $status = 'inconnu';
        }
        echo $status;
        die;
    }
}