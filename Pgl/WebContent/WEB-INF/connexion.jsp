<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>AppData - Se connecter</title>

        <!-- icone site -->
        <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

        <!-- font -->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">

        <!-- redirection après connexion -->
        <script src="/Pgl/redirection.js"></script>

    </head>


     <!-- contenu du site -->
     <body>
     
     	<!-- header -->
        <%@ include file="menu.jsp" %>
        <!-- fin header -->

        <!-- bannière -->
        <section class="container-fluid banner2">
            <div class="ban-contact">
                <img src="img/connexion.png" alt="Se connnecter"  height="300px" />
            </div>
            <div class="inner-banner">
                <h1> Se connecter </h1>
            </div>
        </section>
        <!-- fin bannière -->

        <!-- connexion -->
        <section class="container-fluid formulaire2 form2">
            <div class="container">
                <h3 id="question">Ravi de vous revoir!</h3>
                <hr class="separateur">
            </div>
        </section>
        <section class="container-fluid connexion">
            <div class="container">
                <p id="sous-contact">Connectez-vous dès maintenant et suivez le déplacement de vos transports
                    favoris en temps réel.</p>
                <form action="Connexion" id="contact" method="post" class="form" role="form">
                    <div class="row">
                        <div class="col-xs-6 col-md-6 form-group">
                            <label for="email">Email</label>
                            <input class="form-control" id="email" name="email" placeholder="Email" type="email" required autofocus/>
                        </div>
                        <div class="col-xs-6 col-md-6 form-group">
                            <label for="password">Mot de passe</label>
                            <input class="form-control" id="password" name="password" placeholder="Mot de passe" type="password" required />
                        </div>
                        <span style="color:red">${error}</span>
                        <div class="col-xs-12 col-md-12 form-group">
                            <input class="btn btn-primary pull-right" type="submit" value="Connexion"></input>
                        </div>
                    </div>  
                </form>
            </div>          
        </section>

        <!-- redirection vers inscription -->
        <section class="container-fluid redirection">
            <div class="container">
                <p id="sous-contact">Vous n'avez pas encore de compte? Inscrivez-vous!</p>
                <hr>
                <a class="btn btn-primary redirect" href="/Pgl/inscription">S'inscrire</a>
            </div>
        </section>

        <!-- footer -->
        <%@ include file="footer.jsp" %>
    </body>
</html>