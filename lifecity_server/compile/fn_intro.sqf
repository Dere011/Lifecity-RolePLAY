private ["_intro"];

sleep 1;

_intro = [format["Salut %1! Bienvenue sur LifeCity :)\n\nPour information le serveur est redémarré à 6h - 12h - 18h - 1h !\n\nNotre serveur Teamspeak est disponible sur cette adresse : IP: 178.32.223.97 PORT: 12467 PASSWORD: RATM\n\nCe serveur est actuellement sous la version ALPHA de LifeCity.\nCette version est en cours de developpement et sujette aux bugs!\nMerci de votre comprehension.", name player]];
"Bienvenue sur LifeCity" hintC _intro;