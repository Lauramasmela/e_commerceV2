<div class="modal fade" id="modalForm" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Contact Form</h4>
            </div>
            <div class="modal-body">
                <p class="statusMsg"></p>
                <form role="form">
                    <p>Inscrivez-vous pour ne plus passer à côté des promotions, des offres, des remises et des bons de
                        réduction.</p>
                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" id="inputEmail" placeholder="Enter your name"">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Mot de passe</label>
                        <input type="text" class="form-control" id="inputPassword" placeholder="Enter your password">
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Se souvenir de moi.</label>
                    </div>
                    <div>
                        <a href="">Mot de passe oublié?</a>
                    </div>

                </form>
            </div>
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-dark submitBtn" onclick="submitContactForm()">Connexion</button>
            </div>
            <div class="b2">
                <a href="index.php?page=14">
                    <button type="button" class="btn btn-outline-dark" id="butInscription">Je veux m'inscrire</button>
                </a>
            </div>
        </div>
    </div>
</div>



<script>
    /*************************** Ajax formConnexion ******************************/

    function submitContactForm(){

        var email = $('#inputEmail').val();
        var motdepasse = $('#inputPassword').val();

        if(email.trim() === '' ){
            alert('Merci de saisir votre email.');
            $('#inputEmail').focus();
            return false;

        }else if(motdepasse.trim() === '' ){
            alert('Merci de saisir votre mot de passe.');
            $('#inputPassword').focus();
            return false;

        }else{
            $.ajax({
                type:'POST',
                url:'./includes/validationConnexion.php',
                data:'contactFrmSubmit=1&email='+email+'&motdepasse='+motdepasse,
                beforeSend: function () {
                    $('.submitBtn').attr("disabled","disabled");
                    $('.modal-body').css('opacity', '.5');
                },
                success:function(msg){
                    $('.statusMsg').html(msg);
                    if(msg === 'ok'){

                        $('#inputEmail').val('');
                        $('#inputPassword').val('');
                        //$('.statusMsg').html('<span style="color:green;">connexion avec succès.</p>');

                        window.location.replace(<?php URL?>"/index.php?page=0");
                    }
                    else if(msg === 'inconnu'){

                        $('.statusMsg').html('<span style="color:#ff0000;">utilisateur inconnu.</p>');
                    }
                    else{
                        $('.statusMsg').html('<span style="color:#ff0000;">merci de verifier votre utilisateur ou mot de passe.</span>');
                    }
                    $('.submitBtn').removeAttr("disabled");
                    $('.modal-body').css('opacity', '');
                }
            });
        }
    }
</script>


