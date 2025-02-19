/*
    File: randomDrop.sqf
    Author: =CF=Dragunov, adapted from original spawnboxes from NedFox [TZW] and paraDrop from KK
    Description: Custom paraDrops, randomly dropped, with adjustable intervals.
*/

if (!isServer) exitWith {};

uiSleep 1800;

_world = (toLower worldName);
_middle = worldSize/2;
_spawnCenter    = [_middle,_middle,0];
_max        = _middle - 100;

switch (toLower worldName) do
{
    case "altis":
    {
        _spawnCenter = [15234.2,14987.8,0];
        _max = 15000;
    };
    case "chernarus":
    {
        _spawnCenter = [7652.9634, 7870.8076,0];
        _max = 7500;
    };
    case "taviana":
    {
        _spawnCenter = [12800, 12800,0];
        _max = 12800;
    };
};
diag_log format['[paraDrop] worldname: %1 Centre: %2 radius: %3',_world,_spawnCenter,_max];

_min                = 0; // minimum distance from the center position (Number) in meters
_mindist            = 5; // minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..
_water              = 0; // water mode (Number) 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode          = 0; // 0: does not have to be at a shore , 1: must be at a shore
_marker             = true; // Draw a yellow circle in which the crate will be spawned randomly
_markersize         = 100; // Radius of the marker in meters

private['_position'];

diag_log format['[paraDrop] Starting @ %1',time];

////////////////////////////////////////////////////////////////////////////////////////////////////
//Drop 1 is a Kuma
////////////////////////////////////////////////////////////////////////////////////////////////////

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,2000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another drop
        // Get nearest I_MBT_03_cannon_F
        _nearOtherCrate = (nearestObjects [_position,["rhssaf_army_pts"],750]) select 0;
        if (!isNil "_nearOtherCrate") then
        {
            _nearestCrate = _position distance _nearOtherCrate;
            if (_nearestCrate < 750) then
            {
                _validspot = false;
            };
        };

        //Check if near player base
        // Get nearest Exile_Construction_Flag_Static
        _nearBase = (nearestObjects [_position,["Exile_Construction_Flag_Static"],750]) select 0;
        if (!isNil "_nearBase") then
        {
            _nearestBase = _position distance _nearBase;
            if (_nearestBase < 750) then
            {
                _validspot = false;
            };
        };

    };

    if (_marker) then
    {
        _event_marker11 = createMarker [ format ["loot_marker_%1", 11], _position];
        _event_marker11 setMarkerColor "ColorBlue";
        _event_marker11 setMarkerAlpha 0.85;
        _event_marker11 setMarkerText "Drop1";
        _event_marker11 setMarkerType "loc_Tree";
        _event_marker11 setMarkerBrush "Vertical";
        _event_marker11 setMarkerSize [(2), (2)];
    };

    diag_log format['paraDrop %1 : Location %2',11,_position];

    diag_log text format ["[paraDrop]: Creating drop zone %1",_position];

//Call function
//_spawnPosition = [_position select 0, _position select 1, 300];
_tank = "rhssaf_army_pts" createVehicle [0,0,0];
_tank setDir random 360;
_tank setPos [_position select 0, _position select 1, 300];
_tank call KK_fnc_paraDrop;

	diag_log format['[paraDrop] Dropped tank 1: ',_Position];

    clearMagazineCargoGlobal _tank;
    clearWeaponCargoGlobal _tank;
    clearItemCargoGlobal _tank;
    _tank setVariable ["permaLoot",true]; //stay until reset
    _tank allowDamage false; // Prevent boxes to explode when spawning

    _tank addItemCargoGlobal ["Exile_Item_DuctTape", 2 + (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_JunkMetal",  (random 8)];
    _tank addItemCargoGlobal ["Exile_Item_MetalPole",  (random 7)];
    _tank addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_WoodFloorKit", 2 + (random 10)];
    _tank addItemCargoGlobal ["Exile_Item_WoodPlank", 2 + (random 10)];
    _tank addItemCargoGlobal ["Exile_Item_WoodWallKit",  (random 7)];
    _tank addItemCargoGlobal ["Exile_Item_InstaDoc", 1 + (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_FortificationUpgrade",  (random 4)];
    _tank addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", 1 + (random 4)];
    _tank addItemCargoGlobal ["Exile_Item_Energydrink", 1 + (random 3)];
    _tank addWeaponCargoGlobal ["srifle_LRR_camo_F",  (random 1)];
    _tank addWeaponCargoGlobal ["rhs_weap_M107", (random 1)];
    _tank addWeaponCargoGlobal ["arifle_SDAR_F", 1 + (random 1)];
    _tank addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3 + (random 5)];
    _tank addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 1)];
    _tank addItemCargoGlobal ["Exile_Item_Bandage", 1 + (random 5)];
    _tank addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 2)];
    _tank addMagazineCargoGlobal ["130Rnd_338_Mag", (random 2)];
 	_tank setVariable ["ExileMoney",10001,true]; // rod

playsound "Drop";
Hint "Intel: Air Support has paradropped a Tank";
uiSleep 30;
Hint "";

////////////////////////////////////////////////////////////////////////////////////////////////////
//Drop 2 is a rhsgref_un_m1117
////////////////////////////////////////////////////////////////////////////////////////////////////

uiSleep 2800;

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,2000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another drop
        // Get nearest rhsgref_un_m1117
        _nearOtherCrate = (nearestObjects [_position,["rhsgref_un_m1117"],750]) select 0;
        if (!isNil "_nearOtherCrate") then
        {
            _nearestCrate = _position distance _nearOtherCrate;
            if (_nearestCrate < 750) then
            {
                _validspot = false;
            };
        };

        //Check if near player base
        // Get nearest Exile_Construction_Flag_Static
        _nearBase = (nearestObjects [_position,["Exile_Construction_Flag_Static"],750]) select 0;
        if (!isNil "_nearBase") then
        {
            _nearestBase = _position distance _nearBase;
            if (_nearestBase < 750) then
            {
                _validspot = false;
            };
        };

    };

    if (_marker) then
    {
        _event_marker12 = createMarker [ format ["loot_marker_%1", 12], _position];
        _event_marker12 setMarkerColor "ColorBlue";
        _event_marker12 setMarkerAlpha 0.85;
        _event_marker12 setMarkerText "Drop2";
        _event_marker12 setMarkerType "loc_Tree";
        _event_marker12 setMarkerBrush "Vertical";
        _event_marker12 setMarkerSize [(2), (2)];
    };

    diag_log format['paraDrop %1 : Location %2',12,_position];

    diag_log text format ["[paraDrop]: Creating drop zone %1",_position];

//Call function
//_spawnPosition = [_position select 0, _position select 1, 300];
_tank = "rhsgref_un_m1117" createVehicle [0,0,0];
_tank setDir random 360;
_tank setPos [_position select 0, _position select 1, 300];
_tank call KK_fnc_paraDrop;

	diag_log format['[paraDrop] Dropped tank 2: ',_Position];

    clearMagazineCargoGlobal _tank;
    clearWeaponCargoGlobal _tank;
    clearItemCargoGlobal _tank;
    _tank setVariable ["permaLoot",true]; //stay until reset
    _tank allowDamage false; // Prevent boxes to explode when spawning

    _tank addItemCargoGlobal ["Exile_Item_DuctTape", 2 + (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_JunkMetal",  (random 8)];
    _tank addItemCargoGlobal ["Exile_Item_MetalPole",  (random 7)];
    _tank addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_WoodFloorKit", 2 + (random 10)];
    _tank addItemCargoGlobal ["Exile_Item_WoodPlank", 2 + (random 10)];
    _tank addItemCargoGlobal ["Exile_Item_WoodWallKit",  (random 7)];
    _tank addItemCargoGlobal ["Exile_Item_InstaDoc", 1 + (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_FortificationUpgrade",  (random 4)];
    _tank addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", 1 + (random 4)];
    _tank addItemCargoGlobal ["Exile_Item_Energydrink", 1 + (random 3)];
    _tank addWeaponCargoGlobal ["srifle_LRR_camo_F",  (random 1)];
    _tank addWeaponCargoGlobal ["rhs_weap_M107", (random 1)];
    _tank addWeaponCargoGlobal ["arifle_SDAR_F", 1 + (random 1)];
    _tank addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3 + (random 5)];
    _tank addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 1)];
    _tank addItemCargoGlobal ["Exile_Item_Bandage", 1 + (random 5)];
    _tank addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 2)];
    _tank addMagazineCargoGlobal ["130Rnd_338_Mag", (random 2)];
 	_tank setVariable ["ExileMoney",10002,true]; // rod

playsound "drop";
Hint "Intel: Air Support has paradropped a Heli";
uiSleep 30;
Hint "";

////////////////////////////////////////////////////////////////////////////////////////////////////
//Drop 3 is a t90 - rhs_t90a_tv
////////////////////////////////////////////////////////////////////////////////////////////////////

uiSleep 1600;

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,2000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another drop
        // Get nearest rhs_t90a_tv
        _nearOtherCrate = (nearestObjects [_position,["rhsgref_cdf_reg_uaz_dshkm"],750]) select 0;
        if (!isNil "_nearOtherCrate") then
        {
            _nearestCrate = _position distance _nearOtherCrate;
            if (_nearestCrate < 750) then
            {
                _validspot = false;
            };
        };

        //Check if near player base
        // Get nearest Exile_Construction_Flag_Static
        _nearBase = (nearestObjects [_position,["Exile_Construction_Flag_Static"],750]) select 0;
        if (!isNil "_nearBase") then
        {
            _nearestBase = _position distance _nearBase;
            if (_nearestBase < 750) then
            {
                _validspot = false;
            };
        };

    };

    if (_marker) then
    {
        _event_marker13 = createMarker [ format ["loot_marker_%1", 13], _position];
        _event_marker13 setMarkerColor "ColorBlue";
        _event_marker13 setMarkerAlpha 0.85;
        _event_marker13 setMarkerText "Drop3";
        _event_marker13 setMarkerType "loc_Tree";
        _event_marker13 setMarkerBrush "Vertical";
        _event_marker13 setMarkerSize [(2), (2)];
    };

    diag_log format['paraDrop %1 : Location %2',13,_position];

    diag_log text format ["[paraDrop]: Creating drop zone %1",_position];

//Call function
//_spawnPosition = [_position select 0, _position select 1, 300];
_tank = "rhsgref_cdf_reg_uaz_dshkm" createVehicle [0,0,0];
_tank setDir random 360;
_tank setPos [_position select 0, _position select 1, 300];
_tank call KK_fnc_paraDrop;

	diag_log format['[paraDrop] Dropped tank 3: ',_Position];

    clearMagazineCargoGlobal _tank;
    clearWeaponCargoGlobal _tank;
    clearItemCargoGlobal _tank;
    _tank setVariable ["permaLoot",true]; //stay until reset
    _tank allowDamage false; // Prevent boxes to explode when spawning

    _tank addItemCargoGlobal ["Exile_Item_DuctTape", 2 + (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_JunkMetal",  (random 8)];
    _tank addItemCargoGlobal ["Exile_Item_MetalPole",  (random 7)];
    _tank addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_WoodFloorKit", 2 + (random 10)];
    _tank addItemCargoGlobal ["Exile_Item_WoodPlank", 1 + (random 10)];
    _tank addItemCargoGlobal ["Exile_Item_WoodWallKit",  (random 7)];
    _tank addItemCargoGlobal ["Exile_Item_InstaDoc", 1 + (random 2)];
    _tank addItemCargoGlobal ["Exile_Item_FortificationUpgrade",  (random 4)];
    _tank addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", 1 + (random 4)];
    _tank addItemCargoGlobal ["Exile_Item_Energydrink", 1 + (random 3)];
    _tank addWeaponCargoGlobal ["srifle_LRR_camo_F",  (random 1)];
    _tank addWeaponCargoGlobal ["rhs_weap_M107", (random 1)];
    _tank addWeaponCargoGlobal ["arifle_SDAR_F", 1 + (random 1)];
    _tank addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3 + (random 5)];
    _tank addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 1)];
    _tank addItemCargoGlobal ["Exile_Item_Bandage", 1 + (random 5)];
    _tank addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 2)];
    _tank addMagazineCargoGlobal ["130Rnd_338_Mag", (random 2)];
 	_tank setVariable ["ExileMoney",10003,true]; // rod

playsound "drop";
Hint "Intel: Air Support has paradropped a Tank";
uiSleep 30;
Hint "";