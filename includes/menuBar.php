<div id="barreMenu">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=""
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" onclick="openBurg()" >
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="index.php?page=0"><img src="./img/logo/Azucar.png" alt="logo.png"></a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto categ">
                <?php
                $reqCat=$bd->prepare("SELECT * FROM categorie_personne WHERE statut_cat_personne = '1'");
                $reqCat->execute();

                while ($donnesNomCat= $reqCat->fetch()){
                    $reqCatProd=$bd->prepare('SELECT cat_personne_id, id_cat_produit ,nom_cat_produit FROM categorie_produit WHERE cat_personne_id = :cat_personne_id ');
                    $reqCatProd->bindValue(':cat_personne_id', $donnesNomCat['id_cat_personne'], PDO::PARAM_INT);
                    $reqCatProd->execute();
                    $donnesNomProd= $reqCatProd->fetch();

                        echo '<li class="nav-item"><a class="dropdown-item mdl" href="index.php?page=20&c='.$donnesNomCat['id_cat_personne'].'" id="">'.$donnesNomCat['nom_cat_personne']. '</a></li>';
                }
                ?>
            </ul>
        </div>
        <div class="lesIcons">
            <ul id="icons">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><img src="./img/icons/barreRecherche.png" alt="search">
                        <span class="sr-only">(current)</span>
                    </a>
                </li>

                <li class="nav-item openbtn" onclick="openNav()">

                    <a class="nav-link" href="#"><div id="badge"></div><img src="./img/icons/shopping-bag.png" alt="panier"></a>
                </li>
                <?php
                if(isset($_SESSION['loginUserId'],$_SESSION['loginUser'])){
                    $user=$_SESSION['loginUser'];


                    echo "<li><p>Bonjour ".$user."!</p></li>";

                    echo '<li class="nav-item">
                            <a class="nav-link" href="index.php?page=0&deconnexion=oui">Déconnexion</a>
                          </li>';
                }else{
                    /*echo '<li class="nav-item" id="compteLog">
                    <a class="nav-link" href="#"><img src="./img/icons/compte.png" alt="logoCompte"></a>
                </li>';*/
                    echo '<!-- Button to trigger modal -->
                    <li><a href="" class="nav-link" data-toggle="modal" data-target="#modalForm">
                        <img src="./img/icons/compte.png" alt="logoCompte">
                        </a>
                    </li>';
                }
                ?>
            </ul>
        </div>
    </nav>
    <?php
    include 'menuHoverBar.php';
    ?>
    <div id="slideBurguer" class="menuBurg">
        <a href="javascript:void(0)" class="closebtn" onclick="fermeMenu()"><img src="./img/icons/delete1.png" alt="fermer onclet"></a>
        <?php
        $reqCatPersonneBurg= $bd->prepare("SELECT * FROM categorie_personne WHERE statut_cat_personne = '1'");
        $reqCatPersonneBurg->execute();
        while ($donneesReqCatPersBurg= $reqCatPersonneBurg->fetch()){

            $reqCatProdB=$bd->prepare('SELECT cat_personne_id, id_cat_produit ,nom_cat_produit FROM categorie_produit WHERE cat_personne_id = :cat_personne_id ');
            $reqCatProdB->bindValue(':cat_personne_id', $donneesReqCatPersBurg['id_cat_personne'], PDO::PARAM_STR);
            $reqCatProdB->execute();
            $donnesNomProdB= $reqCatProdB->fetch();

            echo '<a class="dropdown-item mdl" href="index.php?page=20&c='.$donnesNomProdB['cat_personne_id'].'" id="">'.$donneesReqCatPersBurg['nom_cat_personne'].'</a>';
        }
        ?>
    </div>
</div>
<?php
include 'formConnexion.php';
include 'slidePanier.php';
include 'scriptJs.php';
?>


