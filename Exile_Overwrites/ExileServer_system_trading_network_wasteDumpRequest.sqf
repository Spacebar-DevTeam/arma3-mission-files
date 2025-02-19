private["_sessionID","_parameters","_vehicleNetID","_mode","_vehicleObject","_vehicleDBID","_playerObject","_cargo","_revenue","_playerMoney","_respectGain","_playerRespect","_logging","_traderLog","_responseCode","_crateTypes"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleNetID = _parameters select 0;
_mode = _parameters select 1;
_crateTypes = [
        "CargoNet_01_box_F",
        "Exile_Container_SupplyBox",
        "I_CargoNet_01_ammo_F",
        "O_CargoNet_01_ammo_F",
        "B_CargoNet_01_ammo_F",
        "I_supplyCrate_F",
        "O_supplyCrate_F",
        "B_supplyCrate_F",
        "C_supplyCrate_F",
        "IG_supplyCrate_F",
        "Box_NATO_AmmoVeh_F",
        "Box_East_AmmoVeh_F",
        "Box_IND_AmmoVeh_F",
        "I_CargoNET_01_F",
        "O_CargoNET_01_F",
        "B_CargoNET_01_F",
        "Land_CargoBox_V1_F",
        "ASC_B_box",
        "Box_NATO_Wps_F",
        "Box_East_Wps_F",
        "Box_IND_Wps_F",
        "Box_East_WpsLaunch_F",
        "Box_NATO_WpsLaunch_F",
        "Box_IND_WpsLaunch_F",
        "Box_IND_WpsSpecial_F",
        "Box_East_WpsSpecial_F",
        "Box_NATO_WpsSpecial_F",
        "Box_NATO_Wps_F",
        "Box_East_Wps_F",
        "Box_IND_Wps_F",
        "Box_East_WpsLaunch_F",
        "Box_NATO_WpsLaunch_F",
        "Box_IND_WpsLaunch_F",
        "Box_IND_WpsSpecial_F",
        "Box_East_WpsSpecial_F",
        "Box_NATO_WpsSpecial_F",
        "Box_NATO_AmmoOrd_F",
        "Box_East_AmmoOrd_F",
        "Box_IND_AmmoOrd_F",
        "Box_NATO_Grenades_F",
        "Box_East_Grenades_F",
        "Box_IND_Grenades_F",
        "Box_NATO_Ammo_F",
        "Box_East_Ammo_F",
        "Box_IND_Ammo_F",
        "Box_IND_Support_F",
        "Box_East_Support_F",
        "Box_NATO_Support_F"
    ];
try
{
    _vehicleObject = objectFromNetId _vehicleNetID;
    _vehicleDBID = _vehicleObject getVariable "ExileDatabaseID";
    if (isNull _vehicleObject) then
    {
        throw 6;
    };
    if (_vehicleObject getVariable ["ExileMutex", false]) then
    {
        throw 12;
    };
    _vehicleObject setVariable ["ExileMutex", true];
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw 1;
    };
    if !(alive _playerObject) then
    {
        throw 2;
    };
    if !((owner _vehicleObject) isEqualTo (owner _playerObject)) then
    {
        if (typeOf _vehicleObject in _crateTypes) then
        {
            _vehicleObject setOwner (owner _playerObject);
        } else {
            throw 6;
        };
    };
    _cargo = _vehicleObject call ExileClient_util_containerCargo_list;
    _revenue = _cargo call ExileClient_util_gear_calculateTotalSellPrice;
    clearBackpackCargoGlobal _vehicleObject;
    clearItemCargoGlobal _vehicleObject;
    clearMagazineCargoGlobal _vehicleObject;
    clearWeaponCargoGlobal _vehicleObject;
    if (_mode isEqualTo 2) then
    {
        _revenue = _revenue + ([(typeOf _vehicleObject)] call ExileClient_util_gear_calculateTotalSellPrice);
        _vehicleObject call ExileServer_object_vehicle_remove;
        deleteVehicle _vehicleObject;
    }
    else
    {
        _vehicleObject call ExileServer_object_vehicle_database_update;
    };
    _playerMoney = _playerObject getVariable ["ExileMoney", 0];
    _playerMoney = _playerMoney + _revenue;
    _playerObject setVariable ["ExileMoney", _playerMoney, true];
    format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
    _respectGain = _revenue * getNumber (configFile >> "CfgSettings" >> "Respect" >> "tradingRespectFactor");
    _playerRespect = _playerObject getVariable ["ExileScore", 0];
    _playerRespect = floor (_playerRespect + _respectGain);
    _playerObject setVariable ["ExileScore", _playerRespect];
    format["setAccountScore:%1:%2", _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
    [_sessionID, "wasteDumpResponse", [0, _revenue, str _playerRespect]] call ExileServer_system_network_send_to;
    _logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
    if (_logging isEqualTo 1) then
    {
        _traderLog = format ["PLAYER: ( %1 ) %2 SOLD ITEM: %3 (ID# %4) with Cargo %5 FOR %6 POPTABS AND %7 RESPECT | PLAYER TOTAL MONEY: %8",getPlayerUID _playerObject,_playerObject,typeOf _vehicleObject,_vehicleDBID,_cargo,_revenue,_respectGain,_playerMoney];
        "extDB2" callExtension format["1:TRADING:%1",_traderLog];
    };
}
catch
{
    _responseCode = _exception;
    [_sessionID, "wasteDumpResponse", [_responseCode, 0, ""]] call ExileServer_system_network_send_to;
};
if (!isNull _vehicleObject) then
{
    _vehicleObject setVariable ["ExileMutex", false];
};
true