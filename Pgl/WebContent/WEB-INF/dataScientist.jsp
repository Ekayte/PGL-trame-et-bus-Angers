<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
    <html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>AppData - Map</title>

        <!-- icone site -->
        <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">        

        <!-- font -->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
	
        <!-- marker cluster -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" integrity="sha512-07I2e+7D8p6he1SIM+1twR5TIrhUQn9+I6yjqD53JQjFiMf8EtC93ty0/5vJTZGF8aAocvHYNEDJajGdNx1IsQ==" crossorigin="" />
		<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet-src.js" integrity="sha512-WXoSHqw/t26DszhdMhOXOkI7qCiv5QWXhH9R7CgvgZMHz1ImlkVQ3uNsiQKu5wwbbxtPzFXd1hK4tzno2VqhpA==" crossorigin=""></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
		<link rel="stylesheet" href="css/MarkerCluster.css" />
		<link rel="stylesheet" href="css/MarkerCluster.Default.css" />
		<script src="js/leaflet.markercluster-src.js"></script>
	
	
		<!-- mail -->
		<script src="https://smtpjs.com/v3/smtp.js"></script>
	
	
	
    </head>
    <body>
    <!-- header -->
		<header class="container-fluid header">
	            	<div class="container">
	                	<a href="index.html" class="logo">AppData</a>
	                	<nav class="menu">
	                    	<a href="/Pgl/compteData">Mon compte</a>
	                    	<a href="Accueil">Se déconnecter</a>
	                	</nav>
	            	</div>
		</header>
	<!-- fin-header -->
	
		
		
		<div class="btn-navigation" onclick="changeView()">
			<div class="note">Data</div>
		</div>
	<form method="post" action="map">
		<div class="navigation ">
		
			<div class="statut-connexion">
				<c:if test="${ !empty sessionScope.email }">
	        		<p><span style="font-style:italic; font-size:18px; font-weight:bold;">Bonjour<span style="font-size:16px; color: #007bff;"> ${sessionScope.User.prenom}</span> !</span></p>
	        	</c:if>
			</div>
			
			<!-- obligé d'avoir ça sinon l'overlay disparait -->
			<div id="rate-pos">
				<ul class="rating" >
					<li ></li>
					<li ></li>
					<li ></li>
					<li ></li>
					<li ></li>
				</ul>
			</div>

			<label> En tant que DataScientist vous pouvez faire :</label>
			<div class="col-xs-12 col-md-12 form-group">
				<button id="button_modal_envoiMail" onclick="sendEmail()" type="button" >Recevoir mes info par email</button>	
			</div>
		
		</div>
		
        <div id="mapid"></div>
        
        
     </form>   
       
       	<script src="js/app.js" type="text/javascript" charset="utf-8"></script>

        <footer class="container-fluid footer map-foot">
            <div class="container">
                <p id="copy">© AppData 2020 by Nora BENBRIK, Alexis FREDOUILLARD & Dan PUSCUTA</p>
            </div>
        </footer>
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
        
    </body>
</html>

