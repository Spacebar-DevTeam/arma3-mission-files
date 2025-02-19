/**
 * ExileClient_gui_selectSpawnLocation_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_display","_spawnButton","_spawnButton2","_tipText","_tipTextList","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex"];
disableSerialization;
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";
eXpochClientPlayerBases = [];
createDialog "xstremeGroundorHaloDialog";
_display = uiNamespace getVariable ["xstremeGroundorHaloDialog",displayNull];
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
_spawnButton = _display displayCtrl 1600;
_spawnButton2 = _display displayCtrl 1601;
_spawnButton ctrlEnable false;
_spawnButton2 ctrlEnable false;
_tipText = _display displayCtrl 1204;
_listBox = _display displayCtrl 1500;
lbClear _listBox;
{
	if (getMarkerType _x == "ExileSpawnZone") then
	{
		_listItemIndex = _listBox lbAdd (markerText _x);
		_listBox lbSetData [_listItemIndex, _x];
	};
}
forEach allMapMarkers;

//eXpoch base spawn
if(eXpochClientPlayerLastBaseSpawn < (diag_tickTime - eXpochBaseRespawnTimeLimit))then
{
	_mapCenter = [worldSize/2,worldSize/2,0];
	_allTerritoryFlags = (nearestObjects [_mapCenter, ["Exile_Construction_Flag_Static"], ceil(worldSize/1.75 + 3000)]);
	{
		_playerUID = getPlayerUID player;
		_buildRights = _x getVariable [eXpochBaseSpawnAllowedType, []];
		if (_playerUID in _buildRights) then
		{
			_territoryLevelConfig =_x getVariable ["ExileTerritoryLevel", 0];
			if(_territoryLevelConfig >= eXpochBaseSpawnLevelRequired)then{
				_baseName = _x getVariable ["ExileTerritoryName", ""];
				eXpochClientPlayerBases pushBack _baseName;
				createMarker [_baseName,getPosATL _x];
				_listItemIndex = _listBox lbAdd _baseName;
				_listBox lbSetData [_listItemIndex, _baseName];
				_listBox lbSetColor [_listItemIndex, [0.72,0.18,0.2,1]];
			};
		};
	}forEach _allTerritoryFlags;
};

_numberOfSpawnPoints = {getMarkerType _x == "ExileSpawnZone"} count allMapMarkers;
if (_numberOfSpawnPoints > 0) then
{
	_randNum = floor(random _numberOfSpawnPoints);
	_randData = lbData [1500,_randNum];
	_randomSpawnIndex = _listBox lbAdd "Random";
	_listBox lbSetData [_randomSpawnIndex, _randData];
	_listBox lbSetColor [_randomSpawnIndex, [0,0.78,0.06,1]];
};

_tipTextList = selectRandom
[

	"This is a game of loss, its a wild world out there, good luck!",
	"Enjoy the server... Please consider donating to help keep us alive",
	"Any vehicle left inside the black safezone circle will be deleted at restart",
	"Do not leave vehicles on exile base parts, at restart they will likely explode"

];
_tipText ctrlSetStructuredText parseText format["<t size ='1.8 / (getResolution select 5)' valign='middle' align='right'>[ %1 ]</t>",_tipTextList];

true