// Initialisation de la carte
const map = L.map('mapid', {center: [47.471277,-0.551979], zoom: 14});

// Définition du fond de carte
L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png').addTo(map);

// Définition des fonds de carte
let baselayers = {
	osm: L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'),
	otm: L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png')
};
// Ajout du fond de carte par défaut
baselayers.osm.addTo(map);



// Ajout d'une échelle
L.control.scale().addTo(map);

// Ajout d'un marqueur place du Ralliement
//let marker = L.marker([47.471277,-0.551979]).addTo(map);


// Ajout de tous les marqueurs stations de tram Angers direction Roseraie
let iconStationTramRoseraie = L.icon ({
	iconUrl: 'img/icone-appdata.png', 
	iconSize: [25,25]
    });

// Ajout de tous les marqueurs stations de tram Angers direction Avrillé
let iconStationTramAvrille = L.icon ({
	iconUrl: 'img/icone-tram-avrille.png', 
	iconSize: [25,25]
    });

let iconTramAvrille = L.icon({
	iconUrl: 'img/tram.png',
	iconSize: [30, 30]
   });

let iconTramRoseraie = L.icon({
	iconUrl: 'img/tram(2).png',
	iconSize: [30, 30]
   });

let iconBus = L.icon({
    iconUrl: 'img/bus.png',
    iconSize: [30, 30]
    });

let iconArretBus = L.icon({
    iconUrl: 'img/arret-bus.png',
    iconSize: [20, 30]
    });


/* definition de la couleur et la forme du marker pour les arret de bus */
/*
var myCustomColour = 'hsl(220,50%,50%)';

const markerHtmlStyles = `
  background-color: #FFFFFF;
  width: 1rem;
  height: 1rem;
  display: block;
  left: -1.5rem;
  top: -1.5rem;
  position: relative;
  border-radius: 3rem 3rem 0;
  transform: rotate(45deg) `;
*/

    /* création des variable pour les  marker tram*/
    let markerTramRoseraie;
    let markerTramAvrille;
    let markerArretTramAvrille;
    let markerArretTramRoseraie;
    let markerBus;
    let markerArretBus
       
	/* variable pour regrouper les marker */
    var markersA = new L.layerGroup();
    var markersR = new L.layerGroup();
    var markersAA = new L.layerGroup();
    var markersRA = new L.layerGroup();
    var markersB = new L.layerGroup();
    var markersAB = new L.layerGroup();

	var markers = L.markerClusterGroup({ chunkedLoading: false });
       
    function loadLayer(){
     var overlayMaps = {
       "Tram Roseraie<->Avrille": markersA,
       "Tram Avrille<->Roseraie": markersR,
       "Arret de tram Roseraie<->Avrille": markersAA,
       "Arret de tram Avrille<->Roseraie": markersRA,
       "bus": markersB,
       "Arret de bus": markers
    };
        
      L.control.layers(baselayers, overlayMaps).addTo(map);
	 
    }

/*declaration des data json pour tram et bus*/

let tramJsonAvrille;
let tramJsonRoseraie;
let busJson;

let dataBus;

function loadStationsRoseraie() {
	const xmlhr = new XMLHttpRequest();
	/* Direction Roseraie */
	//https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=60&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoligne=A&refine.nomligne=ARDENNE+%3C%3E+ROSERAIE&refine.dest=ANGERS+ROSERAIE&exclude.nomarret=RELEVE+CTT+voie+1&exclude.nomarret=ST+SERGE+UNIVER+2&exclude.nomarret=ST+SERGE+UNIVERSITE&exclude.nomarret=FOCH+MAISONBLEUE&exclude.nomarret=CENTRE+DES+CONGRES&exclude.nomarret=HOTEL+DE+VILLE
	//
	xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=180&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoligne=A&refine.nomligne=ARDENNE+%3C%3E+ROSERAIE&refine.dest=ANGERS+ROSERAIE&exclude.nomarret=SORTIE+TRAM+CTT&exclude.nomarret=Retournement+CTT&exclude.nomarret=RENTREE+CTT+TRAM&exclude.nomarret=RELEVE+CTT+Voie+2&exclude.nomarret=RELEVE+CTT+voie+1&exclude.nomarret=ST+SERGE+supprim%C3%A9&exclude.nomarret=PLACE+MOLIERE&exclude.nomarret=RALLIEMENT", true);
	xmlhr.onreadystatechange = function () {
		if (xmlhr.readyState == 4) {
			if (xmlhr.status == 200) {
				try {
					let responseText = xmlhr.responseText;
					let dataStations = JSON.parse(responseText);
					//console.log(dataStations);
					for (var i = 0; i < dataStations.records.length;i++){
						var nomStation = dataStations.records[i].fields.nomarret;
						var ligneStation = dataStations.records[i].fields.nomligne;
						var destinationStation = dataStations.records[i].fields.dest;

						var lat = dataStations.records[i].geometry.coordinates[1];
						var longi = dataStations.records[i].geometry.coordinates[0];
						markerArretTramRoseraie = L.marker([lat,longi], {icon: iconStationTramRoseraie}).bindPopup("<strong>Arret "+ nomStation + "</strong><p>Ligne : " + ligneStation + 
						"<br>Destination : " + destinationStation + "</p>").addTo(markersRA);
					}
				} catch (e) {
					alert('Error chargement des données');
					console.log(e);
				}
			} else {
				alert('Error chargement des données');
				console.log(xmlhr.statusText);
			}
		}
	}
	xmlhr.send();
}


function loadStationsAvrille() {
	const xmlhr = new XMLHttpRequest();
	/* Direction Avrille */
					 //https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=65&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoligne=A&refine.nomligne=ARDENNE+%3C%3E+ROSERAIE&refine.dest=AVRILLE+ARDENNE&exclude.nomarret=RELEVE+CTT+voie+1&exclude.nomarret=ST+SERGE+UNIVER+2&exclude.nomarret=ST+SERGE+UNIVERSITE&exclude.nomarret=CENTRE+DES+CONGRES&exclude.nomarret=HOTEL+DE+VILLE&exclude.nomarret=RELEVE+CTT+Voie+2&exclude.nomarret=ST+SERGE+UNIVERS+2"
	xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=180&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoligne=A&refine.nomligne=ARDENNE+%3C%3E+ROSERAIE&refine.dest=AVRILLE+ARDENNE&exclude.nomarret=SORTIE+TRAM+CTT&exclude.nomarret=Retournement+CTT&exclude.nomarret=RENTREE+CTT+TRAM&exclude.nomarret=RELEVE+CTT+Voie+2&exclude.nomarret=RELEVE+CTT+voie+1&exclude.nomarret=ST+SERGE+supprim%C3%A9&exclude.nomarret=PLACE+MOLIERE&exclude.nomarret=RALLIEMENT", true);
	xmlhr.onreadystatechange = function () {
		if (xmlhr.readyState == 4) {
			if (xmlhr.status == 200) {
				try {
					let responseText = xmlhr.responseText;
					let dataStations = JSON.parse(responseText);
					//console.log(dataStations);
					for (var i = 0; i < dataStations.records.length;i++){
						var nomStation = dataStations.records[i].fields.nomarret;
						var ligneStation = dataStations.records[i].fields.nomligne;
						var destinationStation = dataStations.records[i].fields.dest;

						var lat = dataStations.records[i].geometry.coordinates[1];
						var longi = dataStations.records[i].geometry.coordinates[0];
						markerArretTramAvrille = L.marker([lat,longi], {icon: iconStationTramAvrille}).bindPopup("<strong>Arret "+ nomStation + "</strong><p>Ligne : " + ligneStation + 
						"<br>Destination : " + destinationStation + "</p>").addTo(markersAA);
					}
				} catch (e) {
					alert('Error chargement des données');
					console.log(e);
				}
			} else {
				alert('Error chargement des données');
				console.log(xmlhr.statusText);
			}
		}
	}
	xmlhr.send();
}

       /* fonction pour recupérer les position des marker et la création des popup */

	   function DisplayTramAvrille() {
        
        const xmlhr = new XMLHttpRequest();
        xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&rows=30&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&refine.mnemoligne=A", true);
        
        /* ligne de bus qui remplace les tram quand il y a des travaux */
        //xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&refine.nomligne=A+-+Remplacement+Tram+par+Bus", true);

        xmlhr.onreadystatechange = function () {
            if (xmlhr.readyState == 4) {
                if (xmlhr.status == 200) {
                    try {
                        let dataTram = xmlhr.responseText;
                            
                            // recuperation de data dans anger_stationnement
                            tramJsonAvrille = JSON.parse(dataTram);
                            //console.log(tramJsonAvrille);
							
                            
                                for (var i = 0; i < tramJsonAvrille.records.length; i++){
                                    var TramDest = tramJsonAvrille.records[i].fields.dest;
                                    var latitude = tramJsonAvrille.records[i].geometry.coordinates[1];
                                    var longitude = tramJsonAvrille.records[i].geometry.coordinates[0];
                                    
                                    var numero = tramJsonAvrille.records[i].fields.novh
                                    var nomArretSuivant = tramJsonAvrille.records[i].fields.nomarret;
                                    var heureArrivee = tramJsonAvrille.records[i].fields.harret;
                                    var retard = Math.trunc(tramJsonAvrille.records[i].fields.ecart/60);

                                    
                                    
                                    
                                    if(TramDest == "AVRILLE ARDENNE"){
                                            markerTramAvrille = L.marker([latitude,longitude], {icon: iconTramAvrille}).bindPopup("<p> </br><b>" + numero + "</b> <div> Prochain arret : " +
                                             nomArretSuivant + "</div> <div> Destination : " + TramDest + "</div> <div> Heure d'arrivee : " + heureArrivee + " </div><div> Retard estime : " + 
                                             retard + " min</p>").addTo(markersA);
                                           
                                    }   
                            }
                            
                         } catch (e) {
                        alert('Error chargement des données');
                        console.log(e);
                    }
                } else {
                  alert('Error chargement des données');
                  console.log(xmlhr.statusText);
                 }
            }
        }
        xmlhr.send();
    }
    function DisplayTramRoseraie() {
        
        const xmlhr = new XMLHttpRequest();
        xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&rows=30&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&refine.mnemoligne=A", true);
        
        /* ligne de bus qui remplace les tram quand il y a des travaux */
        //xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&refine.nomligne=A+-+Remplacement+Tram+par+Bus", true);

        xmlhr.onreadystatechange = function () {
            if (xmlhr.readyState == 4) {
                if (xmlhr.status == 200) {
                    try {
                        let dataTram = xmlhr.responseText;
                            
                            // recuperation de data dans anger_stationnement
                            tramJsonRoseraie = JSON.parse(dataTram);
                            //console.log(tramJsonAvrilleRoseraie);
                            
                                for (var i = 0; i < tramJsonRoseraie.records.length; i++){
                                   var TramDest = tramJsonRoseraie.records[i].fields.dest;
                                   var latitude = tramJsonRoseraie.records[i].geometry.coordinates[1];
                                   var longitude = tramJsonRoseraie.records[i].geometry.coordinates[0];

                                   var numero = tramJsonRoseraie.records[i].fields.novh
                                   var nomArretSuivant = tramJsonRoseraie.records[i].fields.nomarret;
                                   var heureArrivee = tramJsonRoseraie.records[i].fields.harret;
                                   var retard = Math.trunc(tramJsonRoseraie.records[i].fields.ecart/60);
                                   
                                   

                                    if(TramDest == "ANGERS ROSERAIE"){
                                            markerTramRoseraie = L.marker([latitude,longitude], {icon: iconTramRoseraie}).bindPopup("<p> </br><b>" + numero + "</b> <div> Prochain arret : " 
                                            + nomArretSuivant + "</div> <div> Destination : " + TramDest + "</div> <div> Heure d'arrivee : " + heureArrivee + " </div><div> Retard estime : " 
                                            + retard + " min</p>").addTo(markersR);
                                    }
                                    
                            }
                         } catch (e) {
                        alert('Error chargement des données');
                        console.log(e);
                    }
                } else {
                  alert('Error chargement des données');
                  console.log(xmlhr.statusText);
                 }
            }
        }
        xmlhr.send();
    }
    function loadStationsBus() {
        const xmlhr = new XMLHttpRequest();
        xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=9000&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&exclude.mnemoligne=A", true);
        xmlhr.onreadystatechange = function () {
            if (xmlhr.readyState == 4) {
                if (xmlhr.status == 200) {
                    try {
                        let responseText = xmlhr.responseText;
                         dataStations = JSON.parse(responseText);
                        //console.log(dataStations);
						
						for (var i = 0; i < dataStations.records.length;i++){
							var nomStation = dataStations.records[i].fields.nomarret;
							var ligneStation = dataStations.records[i].fields.nomligne; 
							var destination = dataStations.records[i].fields.dest;
							var lat = dataStations.records[i].geometry.coordinates[1];
							var longi = dataStations.records[i].geometry.coordinates[0];
							var numeroLigne = dataStations.records[i].fields.mnemoligne;
							

							markerArretBus = L.marker([lat,longi], {icon: iconArretBus}).bindPopup("<strong>Arret "+ nomStation + "</strong><p>Ligne : " 
							+ numeroLigne + "</br>Destination : "+ destination).addTo(markers)
							//markers.addLayer(markerArretBus);
							
						}
						
					
                    } catch (e) {
                        alert('Error chargement des données');
                        console.log(e);
                    }
                } else {
                    alert('Error chargement des données');
                    console.log(xmlhr.statusText);
                }
            }
        }
        xmlhr.send();
    }
    function DisplayBus() {
        
        const xmlhr = new XMLHttpRequest();
        xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&rows=999&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&exclude.mnemoligne=A", true);
        
        /* ligne de bus qui remplace les tram quand il y a des travaux */
        //xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&refine.nomligne=A+-+Remplacement+Tram+par+Bus", true);

        xmlhr.onreadystatechange = function () {
            if (xmlhr.readyState == 4) {
                if (xmlhr.status == 200) {
                    try {
                        dataBus = xmlhr.responseText;
                            
                            // recuperation de data dans anger_stationnement
                            busJson = JSON.parse(dataBus);
                           // console.log(busJson);
                            
                            
                            
                                for (var i = 0; i < busJson.records.length ; i++){

                                  
                                   var busDest = busJson.records[i].fields.dest;
                                   var latitude = busJson.records[i].geometry.coordinates[1];
                                   var longitude = busJson.records[i].geometry.coordinates[0];

                                   var numeroLigne = busJson.records[i].fields.mnemoligne;
                                   var nomArretSuivant = busJson.records[i].fields.nomarret;
                                   var heureArrivee = busJson.records[i].fields.harret;
                                   var retard = Math.trunc(busJson.records[i].fields.ecart/60);
                                   var nomLigneBus = busJson.records[i].fields.nomligne;
                                   var busDest = busJson.records[i].fields.dest;
                                   
                                   
                               markerBus = L.marker([latitude,longitude], {icon: iconBus})
                               .bindTooltip(numeroLigne, {permanent: true, direction: "center", className: "my-labels",offset:[0.5,-4.5]})
                               .bindPopup("<p> </br><b> Ligne : " + numeroLigne + "</b> <div> Prochain arret : " 
                                            + nomArretSuivant + "</div> <div> Destination : " + busDest + "</div> <div> Heure d'arrivee : " + heureArrivee + " </div><div> Retard estime : " 
                                            + retard + " min</p>").addTo(markersB);

                                }
                                
                            
                         } catch (e) {
                        alert('Error chargement des données');
                        console.log(e);
                    }
                } else {
                  alert('Error chargement des données');
                  console.log(xmlhr.statusText);
                 }
            }
        }
        xmlhr.send();
    }








	
	// Fonction permettant de faire apparaître et disparaître le bandeau de notation (à droite)
	var clic = 0;
	var change = document.getElementById('mapid');
 	function changeView(){
		clic ++;
		if (clic%2 == 1){
			change.style.cssText = 'width:100%';
		}else{
			change.style.cssText = 'width:85%';
		}
	} 
	
	/* plus besoin de cette fonction mais obligé de la garder car sinon bug avec l'overlay --> a régler plus tard pour l'instant pas le temps */
	const container = document.querySelector('.rating');
	const items = container.querySelectorAll('.rating-item');
	let note;
	container.onclick = e => {
		const elClass = e.target.classList;
		if(!elClass.contains('active')){
				items.forEach(
					item => item.classList.remove('active')
				);
				//console.log(e.target.getAttribute("data-rate"));
				note = getAttribute("data-rate")
				console.log(note);
				document.getElementByName("note_ligne").value="3";
				elClass.add('active'); 
		}
	};
/*************************************************************************************************************************************************** */	
	//fonction permettant d'afficher le popup du commentaire
	function openPopupCommentaire(){
		document.getElementById("modal_commentaire").style.top="100px";
	};
	function closePopupCommentaire(){
		document.getElementById("modal_commentaire").style.top="-800px";
	};
	
    

	
    
//---------------------------------------------------------------
let TramBusMap = new Map();

loadStationsRoseraie();
loadStationsAvrille(); 
DisplayTramRoseraie();
DisplayTramAvrille();
loadStationsBus();
loadLayer();
DisplayBus();

setInterval(function () {
    markersA.clearLayers();
    DisplayTramAvrille();
    //console.log(markerTramAvrille);
    markersR.clearLayers();
    DisplayTramRoseraie();
    //console.log(markerTramRoseraie);
    markersB.clearLayers();
    DisplayBus();
}, 30000);









//---------------------------------------------------------------