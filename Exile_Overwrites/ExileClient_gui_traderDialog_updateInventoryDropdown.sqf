private["_dialog","_inventoryDropdown","_index","_nearVehicles","_crateTypes"];
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
_dialog = uiNameSpace getVariable ["RscExileTraderDialog", displayNull];
_inventoryDropdown = _dialog displayCtrl 4004;
lbClear _inventoryDropdown;
_index = _inventoryDropdown lbAdd "Equipment";
_inventoryDropdown lbSetValue [_index, 1];
_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\face_ca.paa"];
_inventoryDropdown lbSetCurSel 0;
if !((uniform player) isEqualTo "") then
{
    _index = _inventoryDropdown lbAdd "Uniform";
    _inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa"];
    _inventoryDropdown lbSetValue [_index, 2];
};
if !((vest player) isEqualTo "") then
{
    _index = _inventoryDropdown lbAdd "Vest";
    _inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa"];
    _inventoryDropdown lbSetValue [_index, 3];
};
if !((backpack player) isEqualTo "") then
{
    _index = _inventoryDropdown lbAdd "Backpack";
    _inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"];
    _inventoryDropdown lbSetValue [_index, 4];
};
_nearVehicles = nearestObjects [player, ["LandVehicle","Air","Ship"] + _crateTypes, 80];
{
    if (local _x) then
    {
        if (alive _x) then
        {
            if (isNull attachedTo _x) then
            {
                _index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
                _inventoryDropdown lbSetData [_index, netId _x];
                _inventoryDropdown lbSetValue [_index, 5];
            };
        };
    } else {
        if (typeOf _x in _crateTypes) then
        {
            if (alive _x) then
            {
                if (isNull attachedTo _x) then
                {
                    _index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
                    _inventoryDropdown lbSetData [_index, netId _x];
                    _inventoryDropdown lbSetValue [_index, 5];
                };
            };
        };
    };
}
forEach _nearVehicles;
true