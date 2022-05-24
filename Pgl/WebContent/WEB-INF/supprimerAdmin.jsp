<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
		<meta charset="utf-8">
		<title>AppData - Supprimer un utilisateur</title>
        <!-- icone site -->
        <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

        <!-- font -->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
</head>
<body>
        <header class="container-fluid header">
            <div class="container">
                <a href="index.html" class="logo">AppData</a>
                <nav class="menu">
                    <a href="javascript:history.go(-1)">Retour</a>
                </nav>
            </div>
        </header>
 
 		<section class="container-fluid inscription-done ">
			<h1 style="text-align:center">Supprimer un utilisateur</h1>   
		</section>
		<section class="container-fluid connexion">
		   <form action="/Pgl/supprimerAdmin" id="contact" method="post" class="form" role="form">
			    <div class="row">
				    <div class="col-xs-6 col-md-6 form-group form-supp">
				         <label for="email">Email</label>
				         <input class="form-control css-supp" id="email" name="email" placeholder="Email" type="email" autofocus/>	 
				    	 <span style="color:red">${error}</span>
				    </div>
				    <div class="col-xs-6 col-md-6 form-group btn-supprimer">
				         <input class="btn btn-primary pull-right" type="submit" value="Envoyer"/>	 
				    </div>
				</div>
			</form>
		</section>

        <footer class="container-fluid footer">
            <section class="main-footer">
                <div class="container">
                    <div class="row ">
                        <div class="col-sm-4">
                        <h3 id="contacter">Nous contacter</h3>
                            <address>
                                <a href="mailto:contact@appdata.com" id="lien" ><img src="img/mail-footer-menu.png" height="25px" alt="email"/><br><br>
                                <strong>Email</strong><br>contact@appdata.com</a><br><br>
                                <a href="tel:+33241123456" id="lien" ><img src="img/tel-footer-menu.png" height="25px" alt="email"/><br><br>
                                <strong>Téléphone</strong><br>02 41 12 34 56</a><br><br>
                            </address>
                        </div>
                        <div class="col-sm-4">
                            <h3 id="adresse">Nous trouver</h3>
                            <address>
                                10 Boulevard Jean Jeanneteau<br>49000 Angers
                            </address>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10783.353886935289!2d-0.5513441!3d47.49306!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x18c2994402ec2868!2sESEO%20Angers%20-%20Grande%20Ecole%20d&#39;Ing%C3%A9nieurs%20G%C3%A9n%C3%A9ralistes!5e0!3m2!1sfr!2sfr!4v1604170525716!5m2!1sfr!2sfr" 
                            width="300" height="150" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                        </div>
                        <div class="col-sm-4">
                            <h3 id="menu">Rubriques</h3>
                            <nav class="menu2">
                                <a href="/Pgl/">Accueil</a><br><br>
                                <a href="index.html#a-propos">À propos</a><br><br>
                                <a href="/Pgl/contact">Contact</a><br><br>
                                <a href="/Pgl/connexion">Se connecter / S'inscrire</a>
                            </nav>
                        </div>             
                    </div>
                </div>
            </section>
            <section class="copyright">
                <div class="container">
                    <p id="copy">© AppData 2020 by Nora BENBRIK, Alexis FREDOUILLARD & Dan PUSCUTA</p>
                </div>
            </section>
        </footer>   

</body>
</html>