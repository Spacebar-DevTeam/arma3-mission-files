
private ["_servername","_serverclantag","_website","_teamspeakip","_donatelink","_generaltitlecolor","_generaltextcolor","_generaltoastcolor","_importanttitlecolor","_importanttextcolor","_importanttoastcolor"];

//	Modify the below variables to what you want to be displayed as messages to players.

_servername = "Spacebar Gaming Exile Tanoa Ultra AI";
_serverclantag = "[SBG]";
_website = "spacebar.enjin.com";
_teamspeakip = "ts27.gameservers.com:9211";
_donatelink = "http://spacebar.enjin.com/donate";

//	The colors can be edited below and there is a great tool I recommend you use to get the color codes designed by |GITS|Root here: https://arma3rgb.com

//General toast colors for normal messages

_generaltitlecolor = "#f47cff";
_generaltextcolor = "#fffa00";
_generaltoastcolor = [0,1,0.58,1];

//Important colors below (used for rules info etc. to stand out)

_importanttitlecolor = "#ff0000";
_importanttextcolor = "#6aff2b";
_importanttoastcolor = [1,0.39,0.17,1];

waitUntil{!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};

if ( alive player ) then {

  	uiSleep 20;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Hello, %2!</t><br />
	<t size='22' font='PuristaMedium' color='%3'>And Welcome to %4 %5!</t>",_generaltitlecolor, name player, _generaltextcolor, _servername, worldName], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Join Our TeamSpeak!</t><br />
	<t size='21' font='PuristaMedium' color='%2'>%3</t>", _generaltitlecolor, _generaltextcolor, _teamspeakip], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Visit Our Forums!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>%3<br />See events and make suggestions.</t>", _generaltitlecolor, _generaltextcolor, _website], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>If you need help.</t><br />
	<t size='20' font='PuristaMedium' color='%2'>%3<br />Contact an admin in our TS or forums</t>", _generaltitlecolor, _generaltextcolor, _donatelink], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server Rules!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Read the damn rules so we don't have to hear the bitchin</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server changes and updates</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Spacebar.enjin.com</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Get back to your body faster</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Score your free Mrzr or Mozzie in the XM8</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Virtual Garage!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Access the Virtual Garage XM8 app to store your vehicles, remember they can still be hacked if you get raided</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 300;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Sell Crates</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Loot crates can be dropped at the Waste Dealer, then take money from the crate! BANK!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 300;

};