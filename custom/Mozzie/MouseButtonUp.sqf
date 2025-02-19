private["_keyCode"];
_keyCode = _this select 1;
_vehicleP = vehicle player;
if(_keyCode isEqualTo 0 and typeOf _vehicleP isEqualTo "C_Mozzie" and "HandGrenade" in (magazines player) and ((getPosATL _vehicleP) select 2) > 1) then 
{
	_Grenade = createVehicle (["GrenadeHand", [(getPosATL (_vehicleP)) select 0, (getPosATL (_vehicleP)) select 1, ((getPosATL (_vehicleP)) select 2) - 1.5], [], 0, "NONE"]);
	_Grenade setVectorDirAndUp [[0,0,-1],[0,0.8,0]];
	player removeMagazine "HandGrenade";
};