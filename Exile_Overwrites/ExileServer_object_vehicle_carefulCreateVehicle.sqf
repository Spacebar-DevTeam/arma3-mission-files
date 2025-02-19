/**
 * ExileServer_object_vehicle_carefulCreateVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_vehicleClassName", "_position", "_direction", "_usePositionATL", "_temporaryPositionInOuterSpace", "_vehicleObject"];
_vehicleClassName = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_temporaryPositionInOuterSpace =
[
    (_position select 0) - 250 + (random 500),
    (_position select 1) - 250 + (random 500),
    1000 + (random 1000)
];
_vehicleObject = createVehicle [_vehicleClassName, _temporaryPositionInOuterSpace, [], 0, "CAN_COLLIDE"];
_vehicleObject allowDamage false;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject addEventHandler["HandleDamage", {false}];
_vehicleObject setVelocity [0, 0, 0];
if ((typeName _direction) isEqualTo "ARRAY") then
{
    _vehicleObject setVectorDirAndUp _direction;
}
else
{
    _vehicleObject setDir _direction;
};
if (_usePositionATL) then
{
    _vehicleObject setPosATL _position;
}
else
{
    _vehicleObject setPosASL _position;
};
_vehicleObject setVelocity [0, 0, 0];
_vehicleObject allowDamage true;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject setDamage 0;
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;
if (_vehicleClassName isKindOf "I_UGV_01_F") then
{
    createVehicleCrew _vehicleObject;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "nightVision") isEqualTo 0) then
{
    _vehicleObject disableNVGEquipment true;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "thermalVision") isEqualTo 0) then
{
    _vehicleObject disableTIEquipment true;
};
//////////////////////////////
// BTR-K KAMYSH
//////////////////////////////
if(_vehicleClassName == "O_APC_Tracked_02_cannon_F") then
{
    _vehicleObject removeWeaponTurret  ["autocannon_30mm_CTWS",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_titan",[0]];

    _vehicleObject addWeaponTurret     ["LMG_M200",[0]];
    _vehicleObject addWeaponTurret     ["SmokeLauncher",[-1]];

    _vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[0]];

    _vehicleObject addMagazineTurret   ["1000Rnd_65x39_Belt_Green",[0]];
    _vehicleObject addMagazineTurret   ["1000Rnd_65x39_Belt_Green",[0]];

    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// T-100 VARSUK
//////////////////////////////
if(_vehicleClassName == "O_MBT_02_cannon_F") then
{
    _vehicleObject removeWeaponTurret  ["cannon_125mm",[0]];
    _vehicleObject removeWeaponTurret  ["HMG_NSVT",[0]];

    _vehicleObject addWeaponTurret     ["LMG_coax",[0]];
    _vehicleObject addWeaponTurret     ["SmokeLauncher",[-1]];

    _vehicleObject removeMagazinesTurret   ["24Rnd_125mm_APFSDS_T_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["12Rnd_125mm_HE_T_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["12Rnd_125mm_HEAT_T_Green",[0]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_Green",[0]];
    _vehicleObject addMagazineTurret   ["450Rnd_127x108_Ball",[0]];

    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// 2S9 SOCHOR
//////////////////////////////
if(_vehicleClassName == "O_MBT_02_arty_F") then
{
    _vehicleObject removeWeaponTurret       ["mortar_155mm_AMOS",[0]];

    _vehicleObject addWeaponTurret          ["HMG_127_APC",[0]];
    _vehicleObject addWeaponTurret          ["GMG_40mm",[0]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[-1]];

    _vehicleObject removeMagazinesTurret    ["32Rnd_155mm_Mo_shells",[0]];
    _vehicleObject removeMagazinesTurret    ["2Rnd_155mm_Mo_guided",[0]];
    _vehicleObject removeMagazinesTurret    ["6Rnd_155mm_Mo_mine",[0]];
    _vehicleObject removeMagazinesTurret    ["2Rnd_155mm_Mo_Cluster",[0]];
    _vehicleObject removeMagazinesTurret    ["6Rnd_155mm_Mo_smoke",[0]];
    _vehicleObject removeMagazinesTurret    ["2Rnd_155mm_Mo_LG",[0]];
    _vehicleObject removeMagazinesTurret    ["6Rnd_155mm_Mo_AT_mine",[0]];

    _vehicleObject addMagazineTurret        ["96Rnd_40mm_G_belt",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_127x99_mag_Tracer_Green",[0]];

    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// FV-720 MORA
//////////////////////////////
if(_vehicleClassName == "I_APC_tracked_03_cannon_F") then
{
    _vehicleObject removeWeaponTurret       ["autocannon_30mm",[0]];

    _vehicleObject addWeaponTurret          ["LMG_coax",[0]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[-1]];

    _vehicleObject removeMagazinesTurret    ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0]];
    _vehicleObject removeMagazinesTurret    ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0]];

    _vehicleObject addMagazineTurret        ["1000Rnd_762x51_Belt_Yellow",[0]];

    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// MBT-52 KUMA
//////////////////////////////
if(_vehicleClassName == "I_MBT_03_cannon_F") then
{
    _vehicleObject removeWeaponTurret       ["cannon_120mm_long",[0]];

    _vehicleObject addWeaponTurret          ["LMG_coax",[0]];
    _vehicleObject addWeaponTurret          ["HMG_127_APC",[0]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[-1]];

    _vehicleObject removeMagazinesTurret    ["28Rnd_120mm_APFSDS_shells_Tracer_Yellow",[0]];
    _vehicleObject removeMagazinesTurret    ["14Rnd_120mm_HE_shells_Tracer_Yellow",[0]];

    _vehicleObject addMagazineTurret        ["2000Rnd_762x51_Belt_Yellow",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_127x99_mag_Tracer_Yellow",[0]];

    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// IFV-6c PANTHER
//////////////////////////////
if(_vehicleClassName == "B_APC_Tracked_01_rcws_F") then
{
    _vehicleObject addWeaponTurret     ["HMG_127_APC",[0]];
    _vehicleObject addWeaponTurret     ["GMG_40mm",[0]];
    _vehicleObject addWeaponTurret     ["SmokeLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["96Rnd_40mm_G_belt",[0]];
    _vehicleObject addMagazineTurret   ["96Rnd_40mm_G_belt",[0]];
    _vehicleObject addMagazineTurret   ["96Rnd_40mm_G_belt",[0]];

    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];

    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// IFV-6c CHEETAH
//////////////////////////////
if(_vehicleClassName == "B_APC_Tracked_01_AA_F") then
{
    _vehicleObject addWeaponTurret          ["autocannon_35mm",[0]];
    _vehicleObject removeWeaponTurret       ["missiles_titan",[0]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[-1]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[0]];

    _vehicleObject removeMagazinesTurret    ["4Rnd_Titan_long_missiles",[0]];

    _vehicleObject addMagazineTurret        ["680Rnd_35mm_AA_shells_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret        ["680Rnd_35mm_AA_shells_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret        ["680Rnd_35mm_AA_shells_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret        ["680Rnd_35mm_AA_shells_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret        ["680Rnd_35mm_AA_shells_Tracer_Red",[0]];

    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
};
//////////////////////////////
// M2A1 SLAMMER TANK
//////////////////////////////
if(_vehicleClassName == "B_MBT_01_cannon_F") then
{
    _vehicleObject addWeaponTurret          ["LMG_M200_body",[0]];
    _vehicleObject removeWeaponTurret       ["cannon_120mm",[0]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[-1]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[0]];

    _vehicleObject removeMagazinesTurret    ["16Rnd_120mm_HE_shells_Tracer_Red",[0]];
    _vehicleObject removeMagazinesTurret    ["32Rnd_120mm_APFSDS_shells_Tracer_Red",[0]];

    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt_Tracer_Red_Splash",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt_Tracer_Red_Splash",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt_Tracer_Red_Splash",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt_Tracer_Red_Splash",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt_Tracer_Red_Splash",[0]];

    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_65x39_Belt",[0]];

    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
};
//////////////////////////////
// M2A4 SLAMMER UP
//////////////////////////////
if(_vehicleClassName == "B_MBT_01_TUSK_F") then
{
    _vehicleObject addWeaponTurret          ["LMG_M200_body",[0]];
    _vehicleObject addWeaponTurret          ["HMG_127_MBT",[0]];
    _vehicleObject removeWeaponTurret       ["cannon_105mm",[0]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[-1]];
    _vehicleObject addWeaponTurret          ["SmokeLauncher",[0]];

    _vehicleObject removeMagazinesTurret    ["40Rnd_105mm_APFSDS_T_Red",[0]];
    _vehicleObject removeMagazinesTurret    ["20Rnd_105mm_HEAT_MP_T_Red",[0]];

    _vehicleObject addMagazineTurret        ["2000Rnd_65x39_belt",[0]];
    _vehicleObject addMagazineTurret        ["2000Rnd_65x39_belt",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret        ["500Rnd_127x99_mag_Tracer_Red",[0]];

    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret        ["SmokeLauncherMag",[0]];
};
//////////////////////////////
// CRV-6e BOBCAT
//////////////////////////////
if(_vehicleClassName == "B_APC_Tracked_01_CRV_F") then
{
    _vehicleObject addWeaponTurret     ["LMG_RCWS",[0]];
    _vehicleObject addWeaponTurret     ["SmokeLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_belt",[0]];

    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
};
//////////////////////////////
// AMV-7 MARSHALL
//////////////////////////////
if(_vehicleClassName == "B_APC_Wheeled_01_cannon_F") then
{
    _vehicleObject addWeaponTurret     ["LMG_M200_body",[0]];
    _vehicleObject addWeaponTurret     ["SmokeLauncher",[-1]];
    _vehicleObject addWeaponTurret     ["SmokeLauncher",[0]];
    _vehicleObject removeWeaponTurret  ["autocannon_40mm_CTWS",[0]];

    _vehicleObject removeMagazinesTurret   ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];

    _vehicleObject addMagazineTurret   ["200Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["200Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["1000Rnd_65x39_Belt_Tracer_Green",[0]];
    _vehicleObject addMagazineTurret   ["200Rnd_65x39_Belt_Tracer_Green",[0]];
    _vehicleObject addMagazineTurret   ["200Rnd_65x39_Belt_Tracer_Green",[0]];

    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[-1]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[0]];
    _vehicleObject addMagazineTurret   ["SmokeLauncherMag",[0]];
};
//////////////////////////////
// MQ-12 FALCON
//////////////////////////////
if(_vehicleClassName == "B_T_UAV_03_F") then
{
    _vehicleObject removeWeaponTurret       ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret       ["issiles_DAR",[0]];

    _vehicleObject removeMagazinesTurret    ["6Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret    ["24Rnd_missiles",[0]];
};
//////////////////////////////
// A-164 WIPEOUT
//////////////////////////////
if(_vehicleClassName == "B_Plane_CAS_01_F") then
{
    _vehicleObject removeWeaponTurret  ["Gatling_30mm_Plane_CAS_01_F",[0]];
    _vehicleObject removeWeaponTurret  ["Missile_AA_04_Plane_CAS_01_F",[0]];
    _vehicleObject removeWeaponTurret  ["Missile_AGM_02_Plane_CAS_01_F",[0]];
    _vehicleObject removeWeaponTurret  ["Rocket_04_HE_Plane_CAS_01_F",[0]];
    _vehicleObject removeWeaponTurret  ["Rocket_04_AP_Plane_CAS_01_F",[0]];
    _vehicleObject removeWeaponTurret  ["Bomb_04_Plane_CAS_01_F",[0]];
    _vehicleObject removeWeaponTurret  ["Missile_AGM_02_Plane_CAS_01_F",[0]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[0]];
    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_vehicleClassName == "B_Plane_CAS_01_dynamicLoadout_F") then
{
    _vehicleObject removeWeaponTurret  ["Gatling_30mm_Plane_CAS_01_F",[0]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[0]];
    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
//////////////////////////////
// To-199 NEOPHRON
//////////////////////////////
if(_vehicleClassName == "O_Plane_CAS_02_F") then
{
    _vehicleObject removeWeaponTurret  ["Cannon_30mm_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret  ["Missile_AA_03_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret  ["Missile_AGM_01_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret  ["Rocket_03_HE_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret  ["Rocket_03_AP_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret  ["Bomb_03_Plane_CAS_02_F",[-1]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_vehicleClassName == "O_Plane_CAS_02_dynamicLoadout_F") then
{
    _vehicleObject removeWeaponTurret  ["Cannon_30mm_Plane_CAS_02_F",[-1]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
//////////////////////////////
// A-143 BUZZARD
//////////////////////////////
if(_vehicleClassName == "I_Plane_Fighter_03_CAS_F") then
{
    _vehicleObject removeWeaponTurret  ["Twin_Cannon_20mm",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_ASRAAM",[-1]];
    _vehicleObject removeWeaponTurret  ["GBU12BombLauncher_Plane_Fighter_03_F",[-1]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_vehicleClassName == "I_Plane_Fighter_03_CAS_F") then
{
    _vehicleObject removeWeaponTurret  ["Twin_Cannon_20mm",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_Zephyr",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_ASRAAM",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_ASRAAM",[-1]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_vehicleClassName == "I_Plane_Fighter_03_dynamicLoadout_F") then
{
    _vehicleObject removeWeaponTurret  ["Twin_Cannon_20mm",[-1]];
    _vehicleObject removeWeaponTurret  ["Bomb_04_Plane_CAS_01_F",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_ASRAAM",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_SCALPEL",[-1]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret   ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
//////////////////////////////
// AH-99
//////////////////////////////
if(_vehicleClassName == "B_Heli_Attack_01_F") then
{
    _vehicleObject removeWeaponTurret  ["gatling_20mm",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_ASRAAM",[0]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};
//////////////////////////////
// UH-80 GHOST HAWK
//////////////////////////////
if(_vehicleClassName == "B_Heli_Transport_01_F") then
{
    _vehicleObject removeWeaponTurret      ["missiles_DAR",[-1]];
    _vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];

    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport",[0]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport",[-1]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport",[0]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport",[-1]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport2",[1]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport2",[0]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport2",[1]];
    _vehicleObject addWeaponTurret         ["LMG_Minigun_Transport2",[0]];

    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[-1]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[-1]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[-1]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[-1]];
    _vehicleObject addMagazineTurret       ["1000Rnd_65x39_Belt_Tracer_Red",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret       ["300Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret       ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
};
//////////////////////////////
// AH-9 PAWNEE
//////////////////////////////
if(_vehicleClassName == "B_Heli_Light_01_armed_F") then
{
    _vehicleObject removeWeaponTurret      ["missiles_DAR",[-1]];
    _vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret       ["120Rnd_CMFlareMagazine",[0]];
    _vehicleObject addMagazineTurret       ["120Rnd_CMFlareMagazine",[-1]];
};
//////////////////////////////
// V-44 X BLACKFISH
//////////////////////////////
if(_vehicleClassName == "B_T_VTOL_01_armed_F") then
{
    _vehicleObject removeWeaponTurret      ["cannon_105mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_20mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["autocannon_40mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["cannon_105mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["gatling_20mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["autocannon_40mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["100Rnd_105mm_HEAT_MP",[0]];
    _vehicleObject removeMagazinesTurret   ["4000Rnd_20mm_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["240Rnd_40mm_GPR_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["100Rnd_105mm_HEAT_MP",[-1]];
    _vehicleObject removeMagazinesTurret   ["4000Rnd_20mm_Tracer_Red_shells",[-1]];
    _vehicleObject removeMagazinesTurret   ["240Rnd_40mm_GPR_Tracer_Red_shells",[-1]];
    _vehicleObject removeMagazinesTurret   ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher_Triples",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher_Triples",[-1]];

    _vehicleObject addMagazineTurret       ["240Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret       ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_vehicleClassName == "B_T_VTOL_01_armed_blue_F") then
{
    _vehicleObject removeWeaponTurret      ["cannon_105mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_20mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["autocannon_40mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["cannon_105mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["gatling_20mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["autocannon_40mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["100Rnd_105mm_HEAT_MP",[0]];
    _vehicleObject removeMagazinesTurret   ["4000Rnd_20mm_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["240Rnd_40mm_GPR_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["100Rnd_105mm_HEAT_MP",[-1]];
    _vehicleObject removeMagazinesTurret   ["4000Rnd_20mm_Tracer_Red_shells",[-1]];
    _vehicleObject removeMagazinesTurret   ["240Rnd_40mm_GPR_Tracer_Red_shells",[-1]];
    _vehicleObject removeMagazinesTurret   ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher_Triples",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher_Triples",[-1]];

    _vehicleObject addMagazineTurret       ["240Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret       ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_vehicleClassName == "B_T_VTOL_01_armed_olive_F") then
{
    _vehicleObject removeWeaponTurret      ["cannon_105mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_20mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["autocannon_40mm_VTOL_01",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["cannon_105mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["gatling_20mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["autocannon_40mm_VTOL_01",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["100Rnd_105mm_HEAT_MP",[0]];
    _vehicleObject removeMagazinesTurret   ["4000Rnd_20mm_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["240Rnd_40mm_GPR_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
    _vehicleObject removeMagazinesTurret   ["100Rnd_105mm_HEAT_MP",[-1]];
    _vehicleObject removeMagazinesTurret   ["4000Rnd_20mm_Tracer_Red_shells",[-1]];
    _vehicleObject removeMagazinesTurret   ["240Rnd_40mm_GPR_Tracer_Red_shells",[-1]];
    _vehicleObject removeMagazinesTurret   ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher_Triples",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher_Triples",[-1]];

    _vehicleObject addMagazineTurret       ["240Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret       ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
};
//////////////////////////////
// Y-32 Xi'AN
//////////////////////////////
if(_vehicleClassName == "O_T_VTOL_02_vehicle_F") then
{
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret       ["168Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret       ["168Rnd_CMFlare_Chaff_Magazine",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_vehicle_hex_F") then
{
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[0]];
    _vehicleObject addWeaponTurret         ["CMFlareLauncher",[-1]];

    _vehicleObject addMagazineTurret       ["168Rnd_CMFlare_Chaff_Magazine",[0]];
    _vehicleObject addMagazineTurret       ["168Rnd_CMFlare_Chaff_Magazine",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_infantry_dynamicLoadout_F") then
{
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_vehicle_ghex_F") then
{
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_vehicle_grey_F") then
{
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_infantry_F") then
{
     _vehicleObject removeWeaponTurret     ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_infantry_grey_F") then
{
     _vehicleObject removeWeaponTurret     ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
};
if(_vehicleClassName == "O_T_VTOL_02_infantry_hex_F") then
{
     _vehicleObject removeWeaponTurret     ["gatling_30mm_VTOL_02",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
    _vehicleObject removeWeaponTurret      ["gatling_30mm_VTOL_02",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret      ["rockets_Skyfire",[-1]];
    _vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[-1]];

    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
    _vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[-1]];
    _vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
};
//////////////////////////////
// WY-55 HELICAT
//////////////////////////////
if(_vehicleClassName == "I_Heli_light_03_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_DAR",[0]];
    _vehicleObject removeWeaponTurret  ["gatling_30mm",[0]];

    _vehicleObject addWeaponTurret     ["M134_minigun",[0]];

    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret   ["5000Rnd_762x51_Yellow_Belt",[0]];

    _vehicleObject addWeaponTurret     ["CMFlareLauncher",[0]];

    _vehicleObject addMagazineTurret   ["168Rnd_CMFlare_Chaff_Magazine",[0]];
};
//////////////////////////////
// Mi-48 KAJMAN
//////////////////////////////
if(_vehicleClassName == "O_Heli_Attack_02_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret  ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret  ["gatling_30mm",[0]];

    _vehicleObject addWeaponTurret     ["LMG_coax",[0]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
};
if(_vehicleClassName == "O_Heli_Attack_02_black_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret  ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret  ["gatling_30mm",[0]];

    _vehicleObject addWeaponTurret     ["LMG_coax",[0]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
};
if(_vehicleClassName == "O_Heli_Attack_02_dynamicLoadout_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret  ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret  ["gatling_30mm",[0]];

    _vehicleObject addWeaponTurret     ["LMG_coax",[0]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
};
if(_vehicleClassName == "O_Heli_Attack_02_dynamicLoadout_black_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_SCALPEL",[0]];
    _vehicleObject removeWeaponTurret  ["rockets_Skyfire",[0]];
    _vehicleObject removeWeaponTurret  ["gatling_30mm",[0]];

    _vehicleObject addWeaponTurret     ["LMG_coax",[0]];

    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Green",[0]];
};
//////////////////////////////
// AFV-4 GORGON
//////////////////////////////
if(_vehicleClassName == "I_APC_Wheeled_03_cannon_F") then
{
    _vehicleObject removeWeaponTurret      ["autocannon_30mm_CTWS",[-1]];
    _vehicleObject removeWeaponTurret      ["autocannon_30mm_CTWS",[0]];
    _vehicleObject removeWeaponTurret      ["autocannon_30mm_CTWS",[1]];

    _vehicleObject removeWeaponTurret      ["missiles_titan",[-1]];
    _vehicleObject removeWeaponTurret      ["missiles_titan",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_titan",[1]];

    _vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[-1]];
    _vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[0]];
    _vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[1]];

    _vehicleObject addWeaponTurret         ["missiles_ASRAAM",[0]];
    _vehicleObject addMagazineTurret       ["2Rnd_AAA_missiles",[0]];
    _vehicleObject addMagazineTurret       ["2Rnd_AAA_missiles",[0]];
    _vehicleObject addMagazineTurret       ["2Rnd_AAA_missiles",[0]];
    _vehicleObject addMagazineTurret       ["2Rnd_AAA_missiles",[0]];

    _vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Yellow",[-1]];
    _vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[-1]];
    _vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0]];
    _vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0]];
    _vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Yellow",[1]];
    _vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[1]];
};
//////////////////////////////
// PO-30 ORCA
//////////////////////////////
if(_vehicleClassName == "O_Heli_Light_02_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[1]];

    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
};
if(_vehicleClassName == "O_Heli_Light_02_v2_F") then
{
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[-1]];
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
};
if(_vehicleClassName == "I_Plane_Fighter_04_F") then
{
    _vehicleObject removeWeaponTurret  ["weapon_Fighter_Gun20mm_AA",[-1]];
    _vehicleObject removeWeaponTurret  ["Laserdesignator_pilotCamera",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_BIM9xLauncher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_AGM_65Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_AMRAAMLauncher",[-1]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "B_Plane_Fighter_01_Stealth_F") then
{
    _vehicleObject removeWeaponTurret  ["weapon_Fighter_Gun20mm_AA",[-1]];
    _vehicleObject removeWeaponTurret  ["Laserdesignator_pilotCamera",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_BIM9xLauncher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_GBU12Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_AMRAAMLauncher",[-1]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "B_Plane_Fighter_01_F") then
{
    _vehicleObject removeWeaponTurret  ["weapon_Fighter_Gun20mm_AA",[-1]];
    _vehicleObject removeWeaponTurret  ["Laserdesignator_pilotCamera",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_BIM9xLauncher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_GBU12Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_AMRAAMLauncher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_AGM_65Launcher",[-1]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "O_Plane_Fighter_02_F") then
{
    _vehicleObject removeWeaponTurret  ["weapon_Fighter_Gun_30mm",[-1]];
    _vehicleObject removeWeaponTurret  ["Laserdesignator_pilotCamera",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_R73Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_R77Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_KAB250Launcher",[-1]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "O_Plane_Fighter_02_Stealth_F") then
{
    _vehicleObject removeWeaponTurret  ["weapon_Fighter_Gun_30mm",[-1]];
    _vehicleObject removeWeaponTurret  ["Laserdesignator_pilotCamera",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_R73Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_R77Launcher",[-1]];
    _vehicleObject removeWeaponTurret  ["weapon_KAB250Launcher",[-1]];
    _vehicleObject addWeaponTurret     ["M134_minigun",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};
if(_vehicleClassName == "CUP_B_AH1Z_NoWeapons") then
{
    _vehicleObject removeWeaponTurret  ["CUP_Vacannon_M197_veh",[0]];
    _vehicleObject addWeaponTurret     ["HMG_127",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
};
if(_vehicleClassName == "CUP_B_AH64D_NO_USA") then
{
    _vehicleObject removeWeaponTurret  ["CUP_Vacannon_M230_veh",[0]];
    _vehicleObject addWeaponTurret     ["HMG_127",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
};
if(_vehicleClassName == "CUP_B_AW159_Unarmed_RN_Blackcat") then
{
    _vehicleObject addWeaponTurret     ["HMG_127",[-1]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]];
    _vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]];
};
if(_vehicleClassName == "I_Heli_light_03_dynamicLoadout_F") then
{
    _vehicleObject removeWeaponTurret      ["missiles_DAR",[0]];
    _vehicleObject removeWeaponTurret      ["missiles_DAR",[-1]];
    _vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[0]];
    _vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];

    _vehicleObject addWeaponTurret         ["M134_minigun",[0]];
    _vehicleObject addWeaponTurret         ["M134_minigun",[-1]];

    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[0]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
    _vehicleObject addMagazineTurret       ["5000Rnd_762x51_Yellow_Belt",[-1]];
};
_vehicleObject