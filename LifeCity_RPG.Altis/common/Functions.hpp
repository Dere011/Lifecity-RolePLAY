class Life_Client_Core
{
	tag = "life";
	
	class Admin
	{
		file = "client\core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminKick {};
		class adminBan {};
		class adminJail{};
		class adminMenu {};
		class adminQuery {};
	};
	
	class Actions
	{
		file = "client\core\actions";
		class buyLicense {};
		class chemlightUse {};
		class heal {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class gatherApples {};
		class gatherCannabis {};
		class gatherHeroin {};
		class gatherOil {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class robBankAction {};
		class sellOil {};
		class suicideBomb {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class searchAction {};
		class searchVehAction {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class pumpRepair {};
		class packupSpikes {};
		class robFederal {};
	};
	
	class Config
	{
		file = "client\core\config";
		class licensePrice {};
		class vehicleWeight {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class copDefault {};
		class civDefault {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_dive {};
	};

	class Player_Menu
	{
		file = "client\core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
	};
	
	class Functions
	{
		file = "client\core\functions";
		class broadcast {};
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class dropItems {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class clearVehicleAmmo {};
		class pulloutVeh {};
	};
	
	class Civilian
	{
		file = "client\core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class robReserve {};
	};
	
	class Vehicle
	{
		file = "client\core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
	};
	
	class Cop
	{
		file = "client\core\cop";
		class copMarkers {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
	};
	
	class Gangs
	{
		file = "client\core\gangs";
		class createGang {};
		class gangBrowser {};
		class gangManagement {};
		class gangMenu {};
		class joinGang {};
		class kickGang {};
		class leaveGang {};
		class setGangLeader {};
		class lockGang {};
		class unlockGang {};
	};
	
	class Shops
	{
		file = "client\core\shops";
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class atmMenuLife {};
		class clothingFilter {};
		class vehicleShop {};
		class vehicleColorList {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
	};
	
	class Items
	{
		file = "client\core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
	};
	
	class Dialog_Controls
	{
		file = "client\dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class unimpound {};
		class sellGarage {};
	};
};