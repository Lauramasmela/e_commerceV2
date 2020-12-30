<?php
include '../../bdd/bd.php';
$req_clients=$bd->prepare('SELECT * FROM utilisateurs');
$req_clients->execute();

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
                    <h2>Liste des clients</h2>
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
                                        <th>Nom</th>
                                        <th>Prénom</th>
                                        <th>E-mail</th>
                                        <th>Date de Naissance</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <?php
                                        while($donnees_clients= $req_clients->fetch()){
                                            echo '<td>'.$donnees_clients['nom'].'</td>';
                                            echo '<td>'.$donnees_clients['prenom'].'</td>';
                                            echo '<td>'.$donnees_clients['email'].'</td>';
                                            echo '<td>'.$donnees_clients['dateNaissance'].'</td>';
                                            echo '</tr>';
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
