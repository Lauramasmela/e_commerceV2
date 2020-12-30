<script>

    let f = document.querySelector('#f');
    let mDeroul = document.querySelector('#mDeroul');
    f.addEventListener("mouseover", (event) => {
        mDeroul.style.display = '';

        mDeroul1.style.display = 'none';
        mDeroul2.style.display = 'none';
        mDeroul3.style.display = 'none';
    })

    mDeroul.addEventListener("mouseover", (event) => {
        mDeroul.style.display = '';
    })
    mDeroul.addEventListener("mouseleave", (event) => {
        mDeroul.style.display = 'none';
    })

    let h = document.querySelector('#h');
    let mDeroul1 = document.querySelector('#mDeroul1');

    h.addEventListener("mouseover", (event) => {
        mDeroul1.style.display = '';

        mDeroul.style.display = 'none';
        mDeroul2.style.display = 'none';
        mDeroul3.style.display = 'none';
    })
    mDeroul1.addEventListener("mouseover", (event) => {
        mDeroul1.style.display = '';
    })
    mDeroul1.addEventListener("mouseleave", (event) => {
        mDeroul1.style.display = 'none';
    })

    let e = document.querySelector('#e');
    let mDeroul2 = document.querySelector('#mDeroul2');
    e.addEventListener("mouseover", (event) => {
        mDeroul2.style.display = '';

        mDeroul3.style.display = 'none';
        mDeroul1.style.display = 'none';
        mDeroul.style.display = 'none';
    })

    mDeroul2.addEventListener("mouseover", (event) => {
        mDeroul2.style.display = '';
    })
    mDeroul2.addEventListener("mouseleave", (event) => {
        mDeroul2.style.display = 'none';
    })

    let n = document.querySelector('#n');
    let mDeroul3 = document.querySelector('#mDeroul3');
    n.addEventListener("mouseover", (event) => {
        mDeroul3.style.display = '';

        mDeroul2.style.display = 'none';
        mDeroul1.style.display = 'none';
        mDeroul.style.display = 'none';
    })
    mDeroul3.addEventListener("mouseover", (event) => {
        mDeroul3.style.display = '';
    })
    mDeroul3.addEventListener("mouseleave", (event) => {
        mDeroul3.style.display = 'none';
    })
    let s = document.querySelector('#s');
    s.addEventListener("mouseover", (event) => {
        mDeroul3.style.display = '';

        mDeroul2.style.display = 'none';
        mDeroul1.style.display = 'none';
        mDeroul.style.display = 'none';
    })

    /******* affichage de connexion ********/

    /*function afficheConnexion() {

        let formConnexion = document.querySelector('#formConnexion');
        let backModal = document.getElementById("bckModal");
        if (formConnexion.style.display === "none" || <?php echo 'isset($_SESSION["errormdp"])'; ?>) {
            formConnexion.style.display = 'block';
            backModal.style.display = 'block';
        } else {
            formConnexion.style.display = 'none';
            backModal.style.display = 'none';
        }
    }

    compteLog.addEventListener("click", (event) => {
        afficheConnexion();
    });*/

    /******* affichage d'inscription ********/



    /******* affichage panier ********/

    function openNav() {
        if(window.matchMedia("(max-width: 576px)").matches){
            document.getElementById("monPanier").style.width = "350px";
            //document.getElementById("main").style.marginLeft = "250px";
        }else{
            document.getElementById("monPanier").style.width = "500px";
            //document.getElementById("main").style.marginLeft = "250px";
        }
    }

    /* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
    function closeNav() {
        document.getElementById("monPanier").style.width = "0";
        // document.getElementById("main").style.marginLeft = "0";
    }

    /******* affichage menu burguer ********/
    function openBurg() {
        if(window.matchMedia("(max-width: 576px)").matches){
            document.querySelector("#slideBurguer").style.width = "250px";//menu Burguer
        }else {
            document.querySelector("#slideBurguer").style.width = "450px";//menu Burguer
        }
    }
    function fermeMenu() {
        document.querySelector("#slideBurguer").style.width = "0";
        // document.getElementById("main").style.marginLeft = "0";
    }


    /*************************** Ajax formConnexion ******************************/




</script>