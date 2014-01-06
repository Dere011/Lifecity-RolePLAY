waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["teamhrf","TEAM ~H.R.F~"];
player createDiarySubject ["serverrules","Règles Serveur"];
player createDiarySubject ["policerules","Règles de la Police"];
player createDiarySubject ["rebelrules","Règles des Rebelles"];
player createDiarySubject ["controls","Contrôles"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
		player createDiaryRecord ["serverrules",
		[
			"Règles d'une nouvelle vie", 
				"
				1. Si vous êtes tués par un policier ou un rebel/membre de gang vous serez retiré de la liste des recherchés.<br/>
				2. Si vous êtes tués par tout autre personne vous resterez dans la liste de recherches..<br/>
				3. Si vous mourez, vous ne pourrez pas faire vengeance vous même.<br/>
				4. Si vous êtes tués par un acte d'RDM, ce n'est pas une nouvelle vie.<br/>
				5. Si vous cliquez sur réapparition et ce, peu importe la raison, ce n'est pas une nouvelle vie.<br/>
				6. Si vous êtes poursuivis par des personnes qui veulent vous nuire et que vous mourez dans un accident, ceci est considéré comme une nouvelle vie.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (Kill sans raison)", 
				"
				Préambule : Les points ci-dessous peuvent vous faire kick/ban, suivant la décision d'un admin.<br/><br/>
				1. Tuer quelqu’un sans raison RP.<br/>
				2. Déclarer une rébellion n'est pas une raison pour tuer tout le monde.<br/>
				3. Une fusillade sans raison relative au rp, démarrée par des Policiers ou civils/rebelles sera considérée comme du RDM.<br/><br/>
				
				Si vous ne faites pas partie d'une scène de crime et ne voulez pas mourir, COUREZ. Si vous mourez, vous ne serez pas considéré comme du RDMing.<br/>
				Tuer quelqu'un pour se protéger soi même ou quelqu'un d'autre n'est pas du RDMing.<br/>
				Commettre un crime parce qu'une personne ne veut pas vous donner 10$ ou ou pour toute autre raison du même genre, peut être considéré comme du RDMing. Une exception existe si votre vie est en danger.<br/>
				"
		]
	];
	
	
	player createDiaryRecord ["serverrules",
		[
			"Véhicules", 
				"
				Préambule : Les points ci-dessous peuvent vous faire kick/ban, suivant la décision d'un admin.<br/><br/>
				1. Écraser des gens sans raison valable. Des accidents peuvent néanmoins arriver, la police sera là pour vérifier.<br/>
				2. Se mettre volontairement devant des véhicules pour se faire tuer.<br/>
				3. Percuter d'autre véhicules pour les endommager et les exploser (sans raisons valables).<br/>
				4. Entrer dans un véhicule qui ne vous appartient pas dans le but de géner son propriétaire<br/><br/>
				5. Voler un véhicule pour le détruire ou le mettre à l'eau.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				Préambule : Les points ci-dessous peuvent vous faire kick/ban, suivant la décision d'un admin.<br/><br/>
				1. Crasher un hélicoptère dans quoi que ce soit (buildings, autres véhicules,etc).<br/>
				2. Voler au dessus des villes à moins 300m est illégal.<br/>
				3. Voler au dessus de Kavala est illégale, demander une autorisation si besoin pour se poser (seulement sur l'Hôpital)<br/>
				4. Voler un hélico de manière non RP ou si l'hélico est déverrouillé depuis moins de 60 sec.<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Bateaux", 
				"
				Préambule : Les points ci-dessous peuvent vous faire kick/ban, suivant la décision d'un admin.<br/><br/>
				1. Utiliser l'action pousser le bateau dans l'eau sans en être le propriétaire.<br/>
				2. Écraser des nageurs.<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Interaction avec la police", 
				"
				Préambule : Les points ci-dessous peuvent vous faire kick/ban, suivant la décision d'un admin.<br/><br/>
				1. Les civils peuvent être arrêtés par le simple fait de fouiller dans les sacs ou les véhicules des policiers. Un abus de ce point peut amener un kick/ban.<br/>
				2. Les civils peuvent être arrêtés pour suivre un policier de manière intentionnelle. Un abus de ce point peut amener un kick.<br/>
				3. Les civils ou les rebelles qui prennent des armes pour tuer des policiers, ou les civils en ville ou en dehors et se de manière non RP seront considérés comme du RDMing (Random Death Match). voir RDMing section.<br/>
				4. Suivre ou harceler les policiers pour une longue période est considéré comme du troll. Le trolling de manière répétée peux engendrer un kick voir un ban.<br/>
				5. Bloquez un policiers dans l’exercice de ces fonctions de manière intentionnelle peux engendrer un kick.<br/>
				6. Les civils/rebelles ne peuvent se déconnecter lors d'une altercation (sauf si involontaire [avertir la police]) sous peine de ban temporaire.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Condition d'un ban", 
				"
				Il n'y a pas d'avertissement ou de kick, juste un ban simple et direct dans le cas des conditions suivantes : Hacking, Cheating, Exploit bug, Avertissement de l'Admin répété.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Zones sécurisées", 
				"
				Par zones sécurisées, on entend : des zones sans crimes ou sans kill intentionnel hors du contexte RP. Un crime dans la zone sécurisée vous fera kick ou ban.<br/><br/>
				Liste des zones sécurisées :<br/>
				- Magasin d'arme<br/>
				- Magasin de voiture et camion<br/>
				- Postes rebelles : Cela signifie qu'aucun crime ne peut être commis hors du contexte RP. La police ne pouvant faire de raid sur un poste rebelle sans avoir au minimum un groupe de quatre policiers.<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
				Préambule : Les abus d'exploits entrainent un ban et non un kick. Et ce, sans avertissements préalables.<br/><br/>
				1. Se suicider pour sortir du contexte rp, être tazé, être arrêté, guidera vers un ban.<br/>
				2. Dupliquer des items ou de l'argent ou si quelqu'un envoie un montant anormal d'argent, doit être signalé à un admin sans attendre.<br/>
				3. Utiliser des objets ne faisant pas partie de la mission amènera un ban. Si un hacker spawn des objets ou véhicules ne faisant pas partie de la mission, ne les utilisez pas ou vous serez ban.<br/>
				4. Abuser de bug ou des mécaniques du jeu pourra faire appel à un ban.<br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Définitions", 
				"
				1. Les règles s'appliquent partout, autant dans que hors des villes. <br/>
				Toute la carte doit être régie par ces règles suivant un contexte rp.<br/>
				2. Les bâtiments importants sont les suivant : Banque, Marché, Magasin de licence, Magasin général, etc..<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Ne faites pas le débile", 
				"
				1. Si un admin vous dit que vous êtes débile, c'est que vous faites des choses débiles.<br/>
				2. Ne cassez pas tout.<br/>
				3. Ne perturbez pas le RolePlay<br/>
				4. La liste continue.<br/>
				5. Du coup, ne soyez pas débile !<br/>
				6. C'est à l'admin de décider si vous êtes débile ou pas.<br/><br/>
				"
		]
	];
	
	
	
// Seal Team Sloth Section

	player createDiaryRecord ["teamhrf",
		[
			"Teamspeak",
				"
				Le TeamSpeak de la team ~H.R.F~:<br/><br/>
				adresse : 85.236.100.85:10197 Password : RATM <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["teamhrf",
		[
			"Site/Forum",
				"
				http://www.communaute-hrf.fr/<br/>
				 vous trouverez ici.<br/><br/>
				-bugs reports<br/>
				-Suggestions / Idées<br/>
				-Pleintes / reclamtions<br/>
			     "
		]
	];
	
	/*player createDiaryRecord ["teamhrf",
		[
			"Donations",
				"
				Donations keep the server running, anything and everything helps.<br/>                //Je te laisse ça juste au cas où tu veux l'utiliser
				Donate securely with PayPal<br/><br/>
				donate@sealteamsloth.com<br/><br/>
				"
		]
	];*/
		
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Teamspeak",
				"
				1. Tous les policiers doivent se trouver dans le channel qui leur est dédié. Faute de quoi, ils seront kickés.<br/>
				2. Rejoindre le teamspeak avant de se connecter en policier est vivement recomandé.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation de la force létale", 
				"
				1. La force létale n'est permise que pour la protection de votre vie, de celles des autres policiers et des civils, et uniquement si la force non létale n'est pas assez efficace.<br/>
				2. Tirer avec une arme quand vous n'êtes pas en danger et que vous n'êtes pas en entrainement est strictement prohibé. Tout officier découvert à tirer avec une arme dans les cas cités ci-dessus sera supprimé du serveur et suspendu du département de la police.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Raid/Camping", 
				"
				Préambule : Un raid est défini par un squad de 4 policiers ou plus, dans le seul but de rentrer dans une zone illégale. Cette démarche a pour intention d'interpeller des suspects pratiquant une activité illégale.<br/><br/>
				
				1. Tout civil dans la zone peut être fouiller et arrêter.<br/>
				2. Si il n'y a aucun fait illégal de trouver pendant le raid, l'officier doit laisser partir les civils.<br/>
				3. La force létale est autorisée uniquement si la situation ne permet plus aucun autre recours, et afin de mobiliser un véhicule sur zone avant qu'il ne s'enfuit !<br/>
				4. Après la fin d'un raid, tous les officiers doivent quitter la zone dans les 10 minutes qui suivent.<br/>
				5. Après qu'une zone ait subit un raid, que ce soit une réussite ou non, la zone ne peut plus subir d'autre raid avant 60 minutes à compter de la fin du raid.<br/>
				6. Des renforts peuvent être appelés. Cependant, il est possible que ce soit des officiers tombés durant le raid (voir les règles de nouvelle vie).<br/><br/>
				
				Le camping est le fait de rester de façon prolongée dans une zone.<br/><br/>
				
				1. Les dispositifs de contrôle ne sont pas considérés comme du camping.<br/>
				2. Faire du camping dans les zones illégales, c'est rester plus que nécessaire après un raid, ou regarder ET prendre des mesures contre les civils qui entrent dans cette zone.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation de la force non létale", 
				"
				Préambule : Pour le moment le tazer est la seule forme de force non létale.<br/><br/>
				1. Le tazer ne peut être utilisé que pour immobiliser une personne refusant de coopérer.<br/>
				2. L'utilisation du tazer n'est permise que sur la base de la loi.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Armes illégales avec ou sans port d'armes", 
				"
				Préambule : Un policiers ne peux jamais donner son arme à un civil.<br/><br/>
				
				Armes légales avec un port d'arme :<br/><br/>
				
				- Rook<br/>
				- PDW 9mm<br/><br/>
				
				Toute autre arme sera considérée comme illégale.<br/><br/>
				
				1. Les civils n'ont pas la permission de porter une arme dans l'enceinte des villes, ils doivent l'avoir dans leurs sac.<br/>
				2. Les civils peuvent porter une arme en main en dehors des villes, cependant l'arme doit être baissée (double CTRL).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arrestations et amendes", 
				"
				Préambule : Les arrestations doivent être faites pour des criminels qui se mettent ou mettent en danger la vie d'autrui.<br/>
				1. Vous devez dire à la personne que vous l'arrêtez et les raisons de cette arrestation.<br/>
				2. Si un civil est recherché pour diverses raisons, vous devez l'arrêter et n'utiliser la force létale que si votre vie est en danger.<br/>
				3. Le fait de refuser une amende est un motif d'arrestation.<br/><br/>
				Mettre une amende à un civil est considéré comme un avertissement, s'il récidive une arrestation peut être de mise.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Véhicules",
				"
				1. Les véhicules qui semble abandonnés, cassés ou sans conducteur, peuvent être mis à la fourrière.<br/>
				2. La mise à la fourrière est une part importante de la police. Elle permet de nettoyer les rues et de garder le serveur moins laggy.<br/><br/>
				
				Les véhicules rebelles sont strictement interdits dans les villes. Tout officier de police qui croise ou voit un véhicule rebelle dans ou en dehors des villes doit tenter de l’arrêter.<br/>
				
				Véhicules rebelles : <br/>
				
				- Quad	(camo rebelle)<br/>
				- Ifrit <br/>
				- Ifrit armé <br/>
				- Tout terrain (camo rebelle) <br/>
				- Tout terrain armé <br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Dispositif de contrôle", 
				"
				Préambule : La police est vivement encouragée à placer ces dispositifs dans des endroits stratégiques afin de combattre les activités illégales et rendre les routes sécuritaires.<br/><br/>
				1. Ce dispositif doit être fait de 3 policers ou plus et d'utiliser deux véhicules ou plus.<br/>
				2. Ce dispositif ne peut être placé à moins de 300m d'une zone illégales.<br/>
				3. Ce dispositif ne peut se placer que sur une route.<br/>
				4. Ce dispositif ne doivent pas être marqués sur la carte.<br/>
				5. Ce dispositif ne peut se placer que sur une route.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouilles",
				"
				1. Un policier seul ne peut que patrouiller. Il doit être accompagné de son binôme pour une quelconque opération.<br/>
				2. Les policiers patrouillant sur les routes de Altis cherchent des véhicules abandonnés, des activités criminelles ou des conduites dangereuses.<br/>
				3. Les patrouilles peuvent être effectuées à pied dans les villes et en véhicule en dehors.<br/>
				4. Les patrouilles ne peuvent pas entrer dans les zones illégales.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Les zones illégales",
				"
				1. Ne pas entrer dans les zones illégales hors raid (voir raid/camping).<br/>
				2. Si vous poursuivez quelqu'un dans une zone illégale, appelez des renforts.<br/>
				3. Les policiers ne peuvent en aucun cas camper sur une zone illégale.<br/><br/>
			
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Les hélicoptères",
				"
				1. Aucun hélicoptère ne doit atterrir dans les villes. Sauf, s'il en a reçu l'autorisation par l'un de ses supérieurs.<br/>
				2. L'héliport sur les quais est l'endroit légal où les hélicoptères doivent atterrir.<br/>
				3. L'héliport peut être fermé sur une courte période de temps à cause d'une opération en cours, mais il ne peut jamais être fermé sur une longue période.<br/>
				4. Les hélicoptères ne peuvent pas voler en dessous de 300m au dessus des villes.<br/>
				5. Les hélicoptères, civils ou policiers, ne peuvent en aucun cas faire du vol stationnaire au dessus des villes, hors des opération de police dans les cas des hélicoptères policiers.<br/>
				6. Les hélicoptères ne doivent pas atterrir sur les routes.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"La Banque fédérale",
				"
				1. Si la banque est braquée, tous les policiers disponibles doivent intervenir sur le lieu du braquage.<br/>
				2. Les petites infractions/arrestations doivent être laissées au second plan.<br/>
				3. La force létale doit être utilisée en toute dernière alternative. Toutes les autres options doivent être prises en considération.<br/>
				4. La police doit évacuer les civils hors de la banque avant toute intervention sur la banque.<br/>
				5. Tous civils bloquant intentionnellement la police qui pénétre dans l'enceinte de la banque sera arrêté, tazé, ou bien tué.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Les rebelles",
				"
				1. Toute personne commettant des actes rebelles sera considérée comme telle.<br/>
				2. Toute personne portant une tenue rebelle pourra être considérée comme telle.<br/>
				3. La force létale pourra être utilisé contre les personnes rebelles si elles émettent une menace quelconque.<br/>
				4. Le RDming (Random Deathmatch) s'applique aux personnes rebelles et aux policiers.<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["rebelrules",
		[
			"Règles globale",
				"
				Préambule : Un rebelle est quelqu'un qui se soulève, en utilisant les armes, contre un gouvernement/police. Cependant, en raison du petit effectif de police comparé au nombre possible de rebelles, tous les rebelles doivent attaquer avec une raison spécifique. Etre civil et faire preuve de bon sens rendra l’expérience de jeu plus agréable pour tous.<br/><br/>
				1. La rébellion n'excuse pas le RDM ( kill random )<br/>
				2. La rébellion doit être RP, et doit avoir d'autres activités que voler la banque.<br/>
				3. La rébellion n'inclut pas de faire la guerre à la police sans revendications préalables.<br/>
				4. L'utilisation d'explosifs est tolérée, tant que ça n'inclut pas de d'importants bâtiments.<br/>
				"
		]
	];
	player createDiaryRecord ["rebelrules",
		[
			"Véhicules illégaux",
				"
				Préambule : La force létale peut être utilisée uniquement pour endommager le véhicule et le rendre inutilisable.<br/><br/>
				
				Les véhicules suivants sont illégaux :<br/><br/>
				
				1. Ifrit<br/>
				2. Ifrit armé<br/>
				3. Tout terrain (camo rebelle)<br/>
				4. Tout terrain armé<br/>
				5. Quad (camo rebelle)<br/>
				"
		]
	];
	player createDiaryRecord ["rebelrules",
		[
			"Armes illégales",
				"
				La possession des armes suivantes par un civil est illégale, même avec un port d'arme :<br/><br/>

				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. EBR<br/>
				5. Silenced P07 (Taser)<br/>
				6. Tout types d'explosifs<br/><br/>
				"
		]
	];
	player createDiaryRecord ["rebelrules",
		[
			"Objets illégaux",
				"
				Les objets suivant sont considérés comme illégaux :<br/><br/>

				1. Cocaïne<br/>
				2. Heroin<br/>
				3. Canabis<br/><br/>
				"
		]
	];


	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: Ouvrir le menu du joueur<br/>
				U: Verrouiller/Déverouiller un véhicule<br/>
				F: Activer la sirène (pour policier)<br/>
				T: Ouvrir le coffre du véhicule<br/>
				"
		]
	];