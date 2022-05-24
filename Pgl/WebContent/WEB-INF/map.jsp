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
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
	
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
	                    	<a href="/Pgl/Compte">Mon compte</a>
	                    	<a href="Accueil">Se déconnecter</a>
	                	</nav>
	            	</div>
		</header>
	<!-- fin-header -->
		
		<div class="btn-navigation" onclick="changeView()">
			<div class="note">Note</div>
		</div>
	<form method="post" action="map">
		<div class="navigation ">
		
			<div class="statut-connexion">
				<c:if test="${ !empty sessionScope.email }">
	        		<p><span style="font-style:italic; font-size:18px; font-weight:bold;">Bonjour<span style="font-size:16px; color: #007bff;"> ${sessionScope.User.prenom}</span> !</span></p>
	        	</c:if>
			</div>
			
			<div id="ligne-bus">
				<label for="ligne">Choisissez la ligne</br>que vous souhaitez noter</label>
					
					<select id="ligne" name="num_ligne">
						<option value="1">Ligne 1</option>
						<option value="2">Ligne 2</option>
						<option value="3">Ligne 3</option>
						<option value="4">Ligne 4</option>
						<option value="5">Ligne 5</option>
						<option value="6">Ligne 6</option>
						<option value="7">Ligne 7</option>
						<option value="8">Ligne 8</option>
						<option value="9">Ligne 9</option>
						<option value="10">Ligne 10</option>
						<option value="11">Ligne 11</option>
						<option value="12">Ligne 12</option>
						<option value="13">Ligne 13</option>
						<option value="14">Ligne 14</option>
						<option value="15">Ligne 15</option>
						<option value="30">Ligne 30</option>
						<option value="31">Ligne 31</option>
						<option value="32">Ligne 32</option>
						<option value="33">Ligne 33</option>
						<option value="34">Ligne 34</option>
						<option value="35">Ligne 35</option>
						<option value="36">Ligne 36</option>
						<option value="37">Ligne 37</option>
						<option value="38">Ligne 38</option>
						<option value="39">Ligne 39</option>
						<option value="40">Ligne 40</option>
						<option value="41">Ligne 41</option>
						<option value="42">Ligne 42</option>
						<option value="43">Ligne 43</option>
						<option value="1s">Ligne 1s</option>
						<option value="2s">Ligne 2s</option>
						<option value="3s">Ligne 3s</option>
						<option value="4s">Ligne 4s</option>
						<option value="1d">Ligne 1d</option>
						<option value="3d">Ligne 3d</option>
						<option value="4d">Ligne 4d</option>
						<option value="12d">Ligne 12d</option>
						<option value="A">Ligne A</option>
					</select></br>
			</div>
			
		<label>Votre note :</label>
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
		<div class="stars">
    		<input class="star star-5" id="star-5" type="radio" name="note_ligne" value="5"/>
    		<label class="star star-5" for="star-5"></label>
    		<input class="star star-4" id="star-4" type="radio" name="note_ligne" value="4"/>
    		<label class="star star-4" for="star-4"></label>
    		<input class="star star-3" id="star-3" type="radio" name="note_ligne" value="3"/>
    		<label class="star star-3" for="star-3"></label>
    		<input class="star star-2" id="star-2" type="radio" name="note_ligne" value="2"/>
    		<label class="star star-2" for="star-2"></label>
    		<input class="star star-1" id="star-1" type="radio" name="note_ligne" value="1"/>
    		<label class="star star-1" for="star-1"></label>
  		</div>
			<div class="button_container_commentaire">
				<input id="button_modal_commentaire" onclick="openPopupCommentaire()" type="button" value="Laisser un commentaire"></input>	
			</div>
			
			</br>
			
			<div class="button_container_alerte">
				<select id="button_modal_alerte" name="alerte">	
						<option value="null">Alerte</option>
						<option value="degradation">Dégradation</option>
						<option value="danger">Danger</option>
				</select>
			</div>
		</div>
		
		
		
		<div id="modal_commentaire">
		
			<h3> Commentaire </h3>
			<textarea name="commentaire_ligne" id="commentaire_Ligne"class="commentaire_Ligne"></textarea>
			</br>
			<c:if test="${ !empty sessionScope.email }">
	        		<button id="button_envoi_com"type="submit" name="id" value="${sessionScope.User.id}"> Envoyer </button>
	        </c:if>
			</br>
			<hr>
			<hr>
			<div class="scrollerCommentaire">
				
				<c:forEach var="ligne" items="${ lignes }">
				
					<li style="padding-left: 10px;"><span><c:out value="" /> Commentaire sur la ligne n° </span>
					<span ><c:out value="${ ligne.numLigne}" /></span>
					</br>
            		<span style="padding-left: 50px;"><c:out value="${ ligne.commentaire }" /></span></li>
            		</br>
            	
            		<hr>
            		
        		</c:forEach>
			
			</div>
				<input id="button_modal_close" onclick="closePopupCommentaire()" type="button" value="fermer"></input>	
		</div>
		
		
        <div id="mapid"></div>
     </form>   
       
       	<script src="js/app.js" type="text/javascript" charset="utf-8"></script>

        <footer class="container-fluid footer map-foot">
            <div class="container">
                <p id="copy">© AppData 2020 by Nora BENBRIK, Alexis FREDOUILLARD & Dan PUSCUTA</p>
            </div>
        </footer>
    </body>
</html>

