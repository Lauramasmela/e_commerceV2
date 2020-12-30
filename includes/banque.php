<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Azucar</title>
    <link rel="stylesheet" href="../boot/bootstrap.css">
    <link rel="stylesheet" href="../style/style.css">
</head>
<body>
<?php

// faire page banque_retour.php

$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$nbTransaction = $_POST['transaction'];
$idSession = $_POST['commande'];
$prix = $_POST['totalRecup'];
?>

<div>
    <div>
        <img id="logoBanque" src="../img/logo/Caisse_d'épargne_Logo.svg.png" alt="logo credit agricole">
    </div>
    <form class="banqueForm" method="POST" action="banque_retour.php">
        <div>
            <span>Bonjour <?php echo $nom ?></span><br>
            <span><?php echo $prix ?> à payer pour votre commande No. <?php echo $idSession ?></span><br>
            <span>No. de transaction <?php echo $nbTransaction ?></span><br>
            <div><span>No. de carte</span></div>
            <input type="text" id="carteno" name="carteno" value="1234 4567 7891 1234" required>
            <div><span>Expriration</span></div>
            <div class="container">
                <select id="month" name="month">
                    <option value="janvier" selected="selected">01</option>
                    <option value="fevrier">02</option>
                    <option value="mars">03</option>
                    <option value="avril">04</option>
                    <option value="mai">05</option>
                    <option value="juin">06</option>
                    <option value="juillet">07</option>
                    <option value="aout">08</option>
                    <option value="septembre">09</option>
                    <option value="octobre">10</option>
                    <option value="novembre">11</option>
                    <option value="decembre">12</option>

                </select>
                <select id="year" name="year">
                    <option value="2021" selected="selected">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>

                </select>
            </div>
            <div><span>CCV</span></div>
            <input type="text" id="ccv" name="ccv" value="123">
        </div>
        <input type="hidden" name="transaction" value="<?php echo $nbTransaction ?>">
        <input type="hidden" name="commande" value="<?php echo $idSession ?>">
        <div>
            <button type="submit" class="btn btn-danger text-center">Valider</button>
        </div>


    </form>

</div>
</body>