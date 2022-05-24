<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AppData - Mon compte</title>

    <!-- icone site -->
    <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

    <!-- css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    
    <script src="https://smtpjs.com/v3/smtp.js"></script>

</head>
<body>
	<!-- header -->
	<header class="container-fluid header">
            	<div class="container">
                	<a href="index.html" class="logo">AppData</a>
                	<nav class="menu">
                    	<a href="/Pgl/map">Carte</a>
                    	<a href="Accueil">Se déconnecter</a>
                	</nav>
            	</div>
	</header>
	<!-- fin header -->
	
	<section class="container-fluid inscription-done ">
		<h1 style="text-align:center">Mes informations personnelles</h1>   
	</section>
	<section class="container-fluid" >

		<ul id="recuperation-form">
			<li><span style="font-weight:bold">Nom : </span> ${ sessionScope.User.nom }</li><br>
			<li><span style="font-weight:bold">Prénom : </span> ${ sessionScope.User.prenom } </li><br>
			<li><span style="font-weight:bold">Sexe : </span> ${ sessionScope.User.sexe } </li><br>
			<li><span style="font-weight:bold">Date : </span> ${ sessionScope.User.date } </li><br>
			<li><span style="font-weight:bold">Email : </span> ${ sessionScope.User.email }</li><br>
			<li><span style="font-weight:bold">Password : </span> ${ sessionScope.User.password } </li><br>
			<li><span style="font-weight:bold">Habitudes : </span> ${ sessionScope.User.habitudes } </li><br>
			<li><span style="font-weight:bold">Fréquence : </span> ${ sessionScope.User.frequence } </li><br>				
			<li><span style="font-weight:bold">Statut : </span> ${ sessionScope.User.statut } </li><br>							
		</ul>

		<div class="col-xs-12 col-md-12 form-group">
            <a href="Supprimer"><span style="font-weight:bold">Supprimer mon compte</span></a>           
        </div>
      <div class="col-xs-12 col-md-12 form-group">
				<button id="button_modal_envoiMail" onclick="sendEmail()" type="button" >Recevoir mes info par email</button>	
		</div>
	</section>
	
	<script type="text/javascript">
        function sendEmail(){
        	Email.send({
        		Host : "smtp.gmail.com",
        		Username : "pglequipe2.appdata@gmail.com",
        		Password : "Equipe2Pgl$",
            	To : '${ sessionScope.email }',
            	From : "pglequipe2.appdata@gmail.com",
            	Subject : "Appdata inforamtion personnelles",
            	Body : '<html><h2> Information liée à votre compte :</h2><ul id="recuperation-form"><li><span style="font-weight:bold">Nom : </span> ${ sessionScope.User.nom }</li><br><li><span style="font-weight:bold">Prénom : </span> ${ sessionScope.User.prenom } </li><br><li><span style="font-weight:bold">Sexe : </span> ${ sessionScope.User.sexe } </li><br><li><span style="font-weight:bold">Date : </span> ${ sessionScope.User.date } </li><br><li><span style="font-weight:bold">Email : </span> ${ sessionScope.User.email }</li><br><li><span style="font-weight:bold">Password : </span> ${ sessionScope.User.password } </li><br><li><span style="font-weight:bold">Habitudes : </span> ${ sessionScope.User.habitudes } </li><br><li><span style="font-weight:bold">Fréquence : </span> ${ sessionScope.User.frequence } </li><br><li><span style="font-weight:bold">Statut : </span> ${ sessionScope.User.statut } </li><br></ul></html>'
        	}).then(
          	message => alert("mail envoyé sur votre adresse personnelle")
        	);
        };
        </script>
	

	
	
	<%@ include file="footer.jsp" %>
</body>
</html>