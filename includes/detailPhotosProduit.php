<?php
$idImgsProd = $_GET['prd'];
$idImgAct = $_GET['act'];

$reqImgs = $bd->prepare("SELECT * FROM imgs WHERE produit_id = :produit_id ");
$reqImgs->bindValue(':produit_id', $idImgsProd, PDO::PARAM_STR);
$reqImgs->execute();
?>
<div class="detailChF">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner pl-4">

            <?php
            while ($donneesImgs = $reqImgs->fetch()) {

                if ($donneesImgs['id_imgs'] == $idImgAct) {
                    echo '<div class="carousel-item active">';
                } else {
                    echo '<div class="carousel-item">';
                }

                echo '<img src="' . $donneesImgs['fichier_prod_img'] . '" alt="chemise bleue" class="d-block w-100" alt="...">
            </div>';
            }
            ?>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="arrow" aria-hidden="true"><img src="./img/icons/left-arrow-line-symbol.png"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="arrow" aria-hidden="true"><img src="./img/icons/right-arrow-angle.png"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>


