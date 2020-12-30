<?php
include '../bdd/bd.php';


/*if (isset($_POST['finCommande'])) {

    if (isset($_SESSION['loginUserId'],$_SESSION['loginUser'])) {
        $status = 'connecte';
        $id=$_SESSION['loginUserId'];


        $reqInfoUser = $bd->prepare('SELECT * FROM utilisateurs WHERE id = :id');
        $reqInfoUser->bindValue(':id', $id, PDO::PARAM_STR);
        $reqInfoUser->execute();

        $infoUser = $reqInfoUser->fetch();

        if ($infoUser) {
            $id = $infoUser['id'];
            $prenom = $infoUser['prenom'];

            echo $id;
            echo $prenom;

            if ($infoUser['adresse'] === null) {
                $status = 'noAdresse';
                 //header('Location: http://localhost/Formation_cci/e_commerceV2/index.php?page=18');
            }else{
                $status = 'adresseOk';
            }
        }
    } else {

        $status = 'nonConnecte';
        // echo '<script>popModal();</script>';
    }
}*/

if (isset($_POST['cartFrmSubmit'])) {

    if (isset($_SESSION['loginUserId'], $_SESSION['loginUser'])) {
        $id = $_SESSION['loginUserId'];

        $reqInfoUser = $bd->prepare('SELECT * FROM utilisateurs WHERE id_utilisateur = :id_utilisateur');
        $reqInfoUser->bindValue(':id_utilisateur', $_SESSION['loginUserId'], PDO::PARAM_STR);
        $reqInfoUser->execute();

        $infoUser = $reqInfoUser->fetch();

        if ($infoUser) {
            $id = $infoUser['id_utilisateur'];

            if ($infoUser['adresse'] === NULL) {
                $status = 'noAdresse';

            } else {
                $status = 'adresseOk';
            }
        }

    } else {

        $status = 'nonConnecte';

    }
    // Output status
    echo $status;
    die;
}
