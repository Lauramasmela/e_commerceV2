<?php
include '../../bdd/bd.php';
$req_commandes=$bd->prepare('SELECT distinct (commande_id_commande),commande_utilisateur_id, commande_prix_total  FROM commandes');
$req_commandes->execute();

?>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="x_content">
                <a href="index.php?page=1">
                    <button type="button" class="btn btn-secondary">Retour à l'accueil</button>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Liste des commandes</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <table id="datatable-buttons" class="table table-striped table-bordered"
                                       style="width:100%">
                                    <thead>
                                    <tr>

                                        <th>Prénom Nom</th>
                                        <th>No. de commande</th>
                                        <th>Montant total</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <?php
                                        while ($donnees_cmd=$req_commandes->fetch()){
                                            $req_client = $bd->prepare('SELECT nom, prenom FROM utilisateurs WHERE id_utilisateur = :idu');
                                            $req_client->bindValue(':idu', $donnees_cmd['commande_utilisateur_id'], PDO::PARAM_INT );
                                            $req_client->execute();

                                            $donnees_client =  $req_client->fetch();

                                            echo '<td>'.$donnees_client['prenom'].' '.$donnees_client['nom'].'</td>';
                                            echo '<td>'.$donnees_cmd['commande_id_commande'].'</td>';
                                            echo '<td>'.$donnees_cmd['commande_prix_total'].'</td>';
                                            echo ' </tr>';
                                        }
                                        ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
