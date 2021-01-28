<?php
//Sinclude '../bdd/bd.php';
function random($nbChar)
{
    $string = "";
    $chaine = "0123456789";
    srand((double)microtime() * 1000000);
    for ($i = 0; $i < $nbChar; $i++) {
        $string .= $chaine[rand() % strlen($chaine)];
    }
    return $string;
}

$total = $_SESSION['total'];
$idUser = $_SESSION['loginUserId'];
$nb = random(6);

$reqPanierIdUser=$bd->prepare('UPDATE panier SET panier_utilisateur_id = :panier_utilisateur_id, panier_transaction = :nbtrans WHERE panier_id_commande = :panier_id_commande');
$reqPanierIdUser->bindValue(':panier_id_commande', $vSession, PDO::PARAM_STR);
$reqPanierIdUser->bindValue(':panier_utilisateur_id', $_SESSION['loginUserId'], PDO::PARAM_STR);
$reqPanierIdUser->bindValue(':nbtrans', $nb , PDO::PARAM_STR);

$reqPanierIdUser->execute();



?>

<form method="POST" action="./includes/banque.php">
    <input type="hidden" name="user_id" value="<?php echo $idUtilisateur ?>">
    <input type="hidden" name="nom" value="<?php echo $nom ?>">
    <input type="hidden" name="prenom" value="<?php echo $prenom ?>">
    <input type="hidden" name="transaction" value="<?php echo $nb ?>">
    <input type="hidden" name="commande" value="<?php echo $vSession ?>">
    <input type="hidden" id="totalRecup" name="totalRecup" value="<?php echo $total ?>">

    <button id="log-submit" type="submit" class="btn btn-dark">Paiement</button>
</form>
