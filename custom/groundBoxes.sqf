/*
    File: groundBoxes.sqf
    Author: =CF=Dragunov, adapted from original spawnboxes from NedFox [TZW]
    Description: Custom Crates, randomly at placed ground, inside a marker which is visible (or not).
*/

if (!isServer) exitWith {};

uiSleep 1100;

_numberofcrates = 4; // this is the number of crates that you want to spawn //not used
_world = (toLower worldName);
_middle = worldSize/2;
_spawnCenter    = [_middle,_middle,0];
_max        = _middle - 100;

switch (toLower worldName) do
{
    case "tanoa":
    {
        _spawnCenter = [7680,7680,0];
        _max = 7580;
    };
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
diag_log format['[groundBoxes] worldname: %1 Centre: %2 radius: %3',_world,_spawnCenter,_max];

_min                = 0; // minimum distance from the center position (Number) in meters
_mindist            = 5; // minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..
_water              = 0; // water mode (Number) 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode          = 0; // 0: does not have to be at a shore , 1: must be at a shore
_marker             = true; // Draw a yellow circle in which the crate will be spawned randomly
_markersize         = 100; // Radius of the marker in meters

private['_position'];

diag_log format['[groundBoxes] Starting @ %1',time];


////////////////////////////////////////////////////////////////////////////////////////////////////
//Crate 1
////////////////////////////////////////////////////////////////////////////////////////////////////

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,20000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another crate
        // Get nearest CargoNet_01_box_F
        _nearOtherCrate = (nearestObjects [_position,["CargoNet_01_box_F"],750]) select 0;
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
        _event_marker5 = createMarker [ format ["loot_marker_%1", 5], _position];
        _event_marker5 setMarkerColor "ColorYellow";
        _event_marker5 setMarkerAlpha 0.65;
        _event_marker5 setMarkerText "Crate1";
        _event_marker5 setMarkerType "loc_Tree";
        _event_marker5 setMarkerBrush "Vertical";
        _event_marker5 setMarkerSize [(2), (2)];
    };

    diag_log format['Spawncrate %1 : Location %2',5,_position];

    //Infantry spawns using the DMS
    _AICount = 5 + (round (random 2));
    _spawnPosition = [_position select 0, _position select 1, 0];
    _group5 = [_spawnPosition, _AICount, "random", "random", "bandit"] call DMS_fnc_SpawnAIGroup;
    _group5 setVariable ["DMS_LockLocality",nil];
    _group5 setVariable ["DMS_SpawnedGroup",true];
    _group5 setVariable ["DMS_Group_Side", "bandit"];

    [_group5, _spawnPosition, 100] call bis_fnc_taskPatrol;
    _group5 setBehaviour "STEALTH";
    _group5 setCombatMode "RED";

    diag_log text format ["[groundBoxes]: Creating crate drop zone %1 with %2 guards",_spawnPosition,_AICount];

    _box = "CargoNet_01_box_F" createvehicle _position;

    clearMagazineCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
    _box setVariable ["permaLoot",true]; //stay until reset
    _box allowDamage false; // Prevent boxes to explode when spawning
    // Building Crate

    _box addItemCargoGlobal ["Exile_Item_DuctTape", (random 2)];
    _box addItemCargoGlobal ["Exile_Item_JunkMetal", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_MetalPole", (random 7)];
    _box addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_WoodFloorKit", (random 20)];
    _box addItemCargoGlobal ["Exile_Item_WoodPlank", (random 80)];
    _box addItemCargoGlobal ["Exile_Item_WoodWallKit", (random 14)];
    _box addItemCargoGlobal ["Exile_Item_InstaDoc", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_FortificationUpgrade", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_Energydrink", (random 4)];
    _box addWeaponCargoGlobal ["srifle_LRR_camo_F", (random 1)];
    _box addWeaponCargoGlobal ["rhs_weap_M107", (random 2)];
    _box addWeaponCargoGlobal ["arifle_SDAR_F", (random 1)];
    _box addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", (random 8)];
    _box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 6)];
    _box addItemCargoGlobal ["Exile_Item_Bandage", (random 5)];
    _box addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 4)];
    _box addMagazineCargoGlobal ["130Rnd_338_Mag", (random 4)];
 	_box setVariable ["ExileMoney",10000,true]; // rod

Hint "Intel: Ground Loot Marked on map";
uiSleep 30;
Hint "";

////////////////////////////////////////////////////////////////////////////////////////////////////
//Crate 2
////////////////////////////////////////////////////////////////////////////////////////////////////

uiSleep 3000;

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,20000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another crate
        // Get nearest CargoNet_01_box_F
        _nearOtherCrate = (nearestObjects [_position,["CargoNet_01_box_F"],750]) select 0;
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
        _event_marker6 = createMarker [ format ["loot_marker_%1", 6], _position];
        _event_marker6 setMarkerColor "ColorYellow";
        _event_marker6 setMarkerAlpha 0.65;
        _event_marker6 setMarkerText "Crate2";
        _event_marker6 setMarkerType "loc_Tree";
        _event_marker6 setMarkerBrush "Vertical";
        _event_marker6 setMarkerSize [(2), (2)];
    };

    diag_log format['Spawncrate %1 : Location %2',6,_position];

    //Infantry spawns using the DMS
    _AICount = 5 + (round (random 2));
    _spawnPosition = [_position select 0, _position select 1, 0];
    _group6 = [_spawnPosition, _AICount, "random", "random", "bandit"] call DMS_fnc_SpawnAIGroup;
    _group6 setVariable ["DMS_LockLocality",nil];
    _group6 setVariable ["DMS_SpawnedGroup",true];
    _group6 setVariable ["DMS_Group_Side", "bandit"];

    [_group6, _spawnPosition, 100] call bis_fnc_taskPatrol;
    _group6 setBehaviour "STEALTH";
    _group6 setCombatMode "RED";

    diag_log text format ["[groundBoxes]: Creating crate drop zone %1 with %2 guards",_spawnPosition,_AICount];

    _box = "CargoNet_01_box_F" createvehicle _position;

    clearMagazineCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
    _box setVariable ["permaLoot",true]; //stay until reset
    _box allowDamage false; // Prevent boxes to explode when spawning
    // Explosive Crate

    _box addItemCargoGlobal ["Exile_Item_DuctTape", (random 2)];
    _box addItemCargoGlobal ["Exile_Item_JunkMetal", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_MetalPole", (random 7)];
    _box addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_WoodFloorKit", (random 20)];
    _box addItemCargoGlobal ["Exile_Item_WoodPlank", (random 80)];
    _box addItemCargoGlobal ["Exile_Item_WoodWallKit", (random 14)];
    _box addItemCargoGlobal ["Exile_Item_InstaDoc", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_FortificationUpgrade", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_Energydrink", (random 4)];
    _box addWeaponCargoGlobal ["srifle_LRR_camo_F", (random 1)];
    _box addWeaponCargoGlobal ["rhs_weap_M107", (random 2)];
    _box addWeaponCargoGlobal ["arifle_SDAR_F", (random 1)];
    _box addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", (random 8)];
    _box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 6)];
    _box addItemCargoGlobal ["Exile_Item_Bandage", (random 5)];
    _box addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 4)];
    _box addMagazineCargoGlobal ["130Rnd_338_Mag", (random 4)];
 	_box setVariable ["ExileMoney",10000,true]; // rod

Hint "Intel: Ground Loot Marked on map";
uiSleep 30;
Hint "";

////////////////////////////////////////////////////////////////////////////////////////////////////
//Crate 3
////////////////////////////////////////////////////////////////////////////////////////////////////

uiSleep 3000;

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,20000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another crate
        // Get nearest CargoNet_01_box_F
        _nearOtherCrate = (nearestObjects [_position,["CargoNet_01_box_F"],750]) select 0;
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
        _event_marker7 = createMarker [ format ["loot_marker_%1", 7], _position];
        _event_marker7 setMarkerColor "ColorYellow";
        _event_marker7 setMarkerAlpha 0.65;
        _event_marker7 setMarkerText "Crate3";
        _event_marker7 setMarkerType "loc_Tree";
        _event_marker7 setMarkerBrush "Vertical";
        _event_marker7 setMarkerSize [(2), (2)];
    };

    diag_log format['Spawncrate %1 : Location %2',7,_position];

    //Infantry spawns using the DMS
    _AICount = 5 + (round (random 2));
    _spawnPosition = [_position select 0, _position select 1, 0];
    _group7 = [_spawnPosition, _AICount, "random", "random", "bandit"] call DMS_fnc_SpawnAIGroup;
    _group7 setVariable ["DMS_LockLocality",nil];
    _group7 setVariable ["DMS_SpawnedGroup",true];
    _group7 setVariable ["DMS_Group_Side", "bandit"];

    [_group7, _spawnPosition, 100] call bis_fnc_taskPatrol;
    _group7 setBehaviour "STEALTH";
    _group7 setCombatMode "RED";

    diag_log text format ["[groundBoxes]: Creating crate drop zone %1 with %2 guards",_spawnPosition,_AICount];

    _box = "CargoNet_01_box_F" createvehicle _position;

    clearMagazineCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
    _box setVariable ["permaLoot",true]; //stay until reset
    _box allowDamage false; // Prevent boxes to explode when spawning
    //

    _box addItemCargoGlobal ["Exile_Item_DuctTape", (random 2)];
    _box addItemCargoGlobal ["Exile_Item_JunkMetal", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_MetalPole", (random 7)];
    _box addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_WoodFloorKit", (random 20)];
    _box addItemCargoGlobal ["Exile_Item_WoodPlank", (random 80)];
    _box addItemCargoGlobal ["Exile_Item_WoodWallKit", (random 14)];
    _box addItemCargoGlobal ["Exile_Item_InstaDoc", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_FortificationUpgrade", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_Energydrink", (random 4)];
    _box addWeaponCargoGlobal ["srifle_LRR_camo_F", (random 1)];
    _box addWeaponCargoGlobal ["rhs_weap_M107", (random 2)];
    _box addWeaponCargoGlobal ["arifle_SDAR_F", (random 1)];
    _box addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", (random 8)];
    _box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 6)];
    _box addItemCargoGlobal ["Exile_Item_Bandage", (random 5)];
    _box addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 4)];
    _box addMagazineCargoGlobal ["130Rnd_338_Mag", (random 4)];
 	_box setVariable ["ExileMoney",10000,true]; // rod

Hint "Intel: Ground Loot Marked on map";
uiSleep 30;
Hint "";

////////////////////////////////////////////////////////////////////////////////////////////////////
//Crate 4
////////////////////////////////////////////////////////////////////////////////////////////////////

uiSleep 3000;

    _validspot  = false;
    while{!_validspot} do
    {
        sleep 1;
        _position = [_spawnCenter,_min,_max,_mindist,_water,2000,_shoremode] call BIS_fnc_findSafePos;
        _validspot  = true;


        //Check if near another crate
        // Get nearest CargoNet_01_box_F
        _nearOtherCrate = (nearestObjects [_position,["CargoNet_01_box_F"],750]) select 0;
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

    if (_marker) then 			//testing the name without box number
    {
        _event_marker8 = createMarker [ format ["loot_marker_%1", 8], _position];
        _event_marker8 setMarkerColor "ColorYellow";
        _event_marker8 setMarkerAlpha 0.65;
        _event_marker8 setMarkerText "Crate4";
        _event_marker8 setMarkerType "loc_Tree";
        _event_marker8 setMarkerBrush "Vertical";
        _event_marker8 setMarkerSize [(2), (2)];
    };

    diag_log format['Spawncrate %1 : Location %2',8,_position];

    //Infantry spawns using the DMS
    _AICount = 5 + (round (random 2));
    _spawnPosition = [_position select 0, _position select 1, 0];
    _group8 = [_spawnPosition, _AICount, "random", "random", "bandit"] call DMS_fnc_SpawnAIGroup;
    _group8 setVariable ["DMS_LockLocality",nil];
    _group8 setVariable ["DMS_SpawnedGroup",true];
    _group8 setVariable ["DMS_Group_Side", "bandit"];

    [_group8, _spawnPosition, 100] call bis_fnc_taskPatrol;
    _group8 setBehaviour "STEALTH";
    _group8 setCombatMode "RED";

    diag_log text format ["[groundBoxes]: Creating crate drop zone %1 with %2 guards",_spawnPosition,_AICount];

    _box = "CargoNet_01_box_F" createvehicle _position;

    clearMagazineCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
    _box setVariable ["permaLoot",true]; //stay until reset
    _box allowDamage false; // Prevent boxes to explode when spawning

    _box addItemCargoGlobal ["Exile_Item_DuctTape", (random 2)];
    _box addItemCargoGlobal ["Exile_Item_JunkMetal", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_MetalPole", (random 7)];
    _box addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_WoodFloorKit", (random 20)];
    _box addItemCargoGlobal ["Exile_Item_WoodPlank", (random 80)];
    _box addItemCargoGlobal ["Exile_Item_WoodWallKit", (random 14)];
    _box addItemCargoGlobal ["Exile_Item_InstaDoc", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_FortificationUpgrade", (random 8)];
    _box addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", (random 4)];
    _box addItemCargoGlobal ["Exile_Item_Energydrink", (random 4)];
    _box addWeaponCargoGlobal ["srifle_LRR_camo_F", (random 1)];
    _box addWeaponCargoGlobal ["rhs_weap_M107", (random 2)];
    _box addWeaponCargoGlobal ["arifle_SDAR_F", (random 1)];
    _box addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", (random 8)];
    _box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", (random 6)];
    _box addItemCargoGlobal ["Exile_Item_Bandage", (random 5)];
    _box addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 4)];
    _box addMagazineCargoGlobal ["130Rnd_338_Mag", (random 4)];
 	_box setVariable ["ExileMoney",10000,true]; // rod

Hint "Intel: Ground Loot Marked on map";
uiSleep 30;
Hint "";