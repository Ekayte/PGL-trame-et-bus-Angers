<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>AppData - Nous contacter</title>

        <!-- icone site -->
        <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

        <!-- font -->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">

    </head>


     <!-- contenu du site -->
     <body>
        <!-- header -->
       <%@ include file="menu.jsp" %>
        <!-- fin header -->

        <!-- bannière -->
        <section class="container-fluid banner2">
            <div class="ban-contact">
                <img src="img/contact-us-removebg-preview.png" alt="Nous contacter"  height="300px" />
            </div>
            <div class="inner-banner">
                <h1> Contact </h1>
            </div>
        </section>
        <!-- fin bannière -->

        <!-- formulaire -->
        <section class="container-fluid formulaire2 form2">
            <div class="container">
                <h3 id="question">Une question? Contactez-nous!</h3>
                <hr class="separateur">
            </div>
        </section>
        <section class="container-fluid">
            <div class="container">
                <p id="sous-contact">N'hésitez pas à nous questionner ou nous faire part de vos idées.</p>
                <div class="row">
                    <div class="col-sm-4">
                        <address>
                            <a href="mailto:contact@appdata.com" ><img src="img/mail-icon.png" height="40px" id="img-contact"/><br><br>
                            <span id="text-icon">Email</span><br>contact@appdata.com</a><br><br>
                            <a href="tel:+33241123456" ><img src="img/tel-icon.png" height="40px" id="img-contact"/><br><br>
                            <span id="text-icon">Téléphone</span><br>02 41 12 34 56</a><br><br>
                            <img src="img/local-icon.png" height="40px" id="img-contact"/><br><br>
                            <strong>Adresse</strong><br> 10 Boulevard Jean Jeanneteau<br>49000 Angers
                        </address>
                    </div>
                            
                    <div class="col-sm-8 contact-form">
                        <form id="contact" method="post" class="form" role="form">
                            <div class="row">
                                <div class="col-xs-6 col-md-6 form-group">
                                    <input class="form-control" id="name" name="name" placeholder="Nom" type="text" required autofocus />
                                </div>
                                <div class="col-xs-6 col-md-6 form-group">
                                    <input class="form-control" id="email" name="email" placeholder="Email" type="email" required />
                                </div>
                                <div class="col-xs-12 col-md-12 form-group">
                                    <textarea class="form-control" id="message" name="message" placeholder="Message" rows="5"></textarea>
                                </div>
                                <div class="col-xs-12 col-md-12 form-group">
                                    <a class="btn btn-primary pull-right" type="submit">Envoyer</a>
                                </div>
                            </div>  
                        </form>
                    </div>
                </div>
            </div>          
        </section>

        <!-- footer -->
        <%@ include file="footer.jsp" %>
    </body>
</html>