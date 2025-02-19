private["_nearVehicles","_localVehicles","_display","_revenue","_sellButton","_dropdown","_vehicleObject","_vehicleName","_index","_crateTypes"];
disableSerialization;
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
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"] + _crateTypes, 150];
_localVehicles = [];
{
    if (local _x) then
    {
        if (alive _x) then
        {
            if (isNull attachedTo _x) then
            {
                _localVehicles pushBack _x;
            };
        };
    } else {
        if (typeOf _x in _crateTypes) then
        {
            if (alive _x) then
            {
                if (isNull attachedTo _x) then
                {
                    _localVehicles pushBack _x;
                };
            };
        };
    };
}
forEach _nearVehicles;
if (_localVehicles isEqualTo []) exitWith
{
    ["ErrorTitleAndText", ["Whoops!", "Park within 50m and get in as driver first."]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientCurrentTrader = _this;
createDialog "RscExileWasteDumpDialog";
waitUntil { !isNull findDisplay 24011 };
_display = uiNameSpace getVariable ["RscExileWasteDumpDialog", displayNull];
_revenue = _display displayCtrl 4001;
_revenue ctrlSetStructuredText (parseText "<t size='1.4'>0<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>");
_sellButton = _display displayCtrl 4000;
_sellButton ctrlEnable false;
_dropdown = _display displayCtrl 4002;
lbClear _dropdown;
{
    _vehicleObject = _x;
    _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicleObject) >> "displayName");
    _index = _dropdown lbAdd (format ["Cargo: %1", _vehicleName]);
    _dropdown lbSetData [_index, netId _vehicleObject];
    _dropdown lbSetValue [_index, 1];
    _index = _dropdown lbAdd (format ["Vehicle + Cargo: %1", _vehicleName]);
    _dropdown lbSetData [_index, netId _vehicleObject];
    _dropdown lbSetValue [_index, 2];
}
forEach _localVehicles;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
true