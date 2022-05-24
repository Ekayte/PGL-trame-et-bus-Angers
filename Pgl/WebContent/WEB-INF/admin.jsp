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
    </head>
    <body>
    <!-- header -->
		<header class="container-fluid header">
	            	<div class="container">
	                	<a href="index.html" class="logo">AppData</a>
	                	<nav class="menu">
	                    	<a href="/Pgl/compteAdmin">Mon compte</a>
	                    	<a href="Accueil">Se déconnecter</a>
	                	</nav>
	            	</div>
		</header>
	<!-- fin-header -->
		
		<div class="btn-navigation" onclick="changeView()">
			<div class="note">Admin</div>
		</div>      
       	       	
       	<form method="post" action="map">
		<div class="navigation ">
		
			<div class="statut-connexion">
				<c:if test="${ !empty sessionScope.email }">
	        		<p id="statut-admin"><span style="font-style:italic; font-size:18px; font-weight:bold;">Bonjour<span style="font-size:16px; color: #007bff;"> ${sessionScope.User.prenom}</span> !</span></p>
	        	</c:if>
	        </div>
			
			<!-- obligé de le laisser sinon l'overlay disparait -->
			<div id="rate-pos">
				<ul class="rating" >
					<li ></li>
					<li ></li>
					<li ></li>
					<li ></li>
					<li ></li>
				</ul>
			</div>
			<div class="button_container_envoiMail">
				<input id="button_modal_alerte" type="button" value="Gestionnaire" onclick="window.location='Gestion';" />
				<input id="button_modal_commentaire" type="button" value="Ajouter utilisateur" onclick="window.location='Ajouter';" />
				<input id="button_modal_commentaire" type="button" value="Supprimer utilisateur" onclick="window.location='SupprimerAdmin';" />
				<input id="button_modal_commentaire" type="button" value="Modifier les droits" onclick="window.location='ModifierDroits';" />
			</div>
			
			
		</div>
		
		<div id="modal_alerte">
		
			<h3> Alerte </h3>
			<input type="text"/>
			</br>
			<input type="submit"></input>
			
		</div>
		
        <div id="mapid"></div>
        
        
     </form>   
       
       	<script src="js/app.js" type="text/javascript" charset="utf-8">
       
       	
       	</script>

        <footer class="container-fluid footer map-foot">
            <div class="container">
                <p id="copy">© AppData 2020 by Nora BENBRIK, Alexis Fredouillard & Dan Puscuta</p>
            </div>
        </footer>
    </body>
</html>

