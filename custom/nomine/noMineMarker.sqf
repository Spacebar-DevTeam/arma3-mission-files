/////////////////////////////////////////
//// Read Me LALALALALALALALA
//// credit: austin_medic - Master Sergeant
/////////////////////////////////////////

/*
=============================================
To intiate the script inside your mission, place the noMineMarker.sqf file inside your mission root folder.
In the init file, copy and paste or type out:
=============================================
nul = [] execVM "noMineMarker.sqf";
=============================================
*/

while{true} do
{
{
	_prefix = [_x,0,16] call BIS_fnc_trimString;
	if(_prefix == "bis_fnc_drawminef") then
	{
		deleteMarker _x;
	};
	//hint format ["marker prefix:%1",_prefix];
} foreach allMapMarkers;
sleep 1;
};