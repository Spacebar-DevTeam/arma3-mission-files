/**
 * ExileClient_util_gear_calculateSellPrice
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_className","_amount"];
_className = _this;
_amount = 0;
if (isNumber (missionConfigFile >> "CfgExileArsenal" >> _className >> "sellPrice")) then 
{
	_amount = getNumber (missionConfigFile >> "CfgExileArsenal" >> _className >> "sellPrice");
}
else 
{
	if (isNumber (missionConfigFile >> "CfgExileArsenal" >> _className >> "price")) then 
	{
		_amount = getNumber (missionConfigFile >> "CfgExileArsenal" >> _className >> "price");
		
		_sellType = 0;
		_sellTypeConfig = "sellPriceFactor";
		if(_className isKindOf ["LandVehicle", configFile >> "CfgVehicles"]) then {
			_sellTypeConfig = "LandVehicleSellPriceFactor";
		};
		if(_className isKindOf ["Air", configFile >> "CfgVehicles"]) then {
			_sellTypeConfig = "AirSellPriceFactor";
		};
		if(_className isKindOf ["Ship", configFile >> "CfgVehicles"]) then {
			_sellTypeConfig = "ShipSellPriceFactor";
		};
		if(_className isKindOf ["Default", configFile >> "CfgWeapons"]) then {
			_sellTypeConfig = "WeaponsSellPriceFactor";
		};
		if(_className isKindOf ["Default", configFile >> "CfgMagazines"]) then {
			_sellTypeConfig = "MagazinesSellPriceFactor";
		};

		_amount = _amount * (getNumber (missionConfigFile >> "CfgTrading" >> _sellTypeConfig));

		_amount = (floor _amount) max 1;
	};
};
_amount