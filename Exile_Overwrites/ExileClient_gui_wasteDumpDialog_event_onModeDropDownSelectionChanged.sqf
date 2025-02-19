private["_display","_dropdown","_index","_vehicleObject","_mode","_cargo","_revenue","_revenueControl","_sellButton"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileWasteDumpDialog", displayNull];
_dropdown = _this select 0;
_index = _this select 1;
_vehicleObject = objectFromNetId (_dropdown lbData _index);
if (isNull _vehicleObject) then
{
    closeDialog 0;
}
else
{
    _mode = _dropdown lbValue _index;
    if !(_mode isEqualTo 3)then{


        _cargo = _vehicleObject call ExileClient_util_containerCargo_list;
        _revenue = _cargo call ExileClient_util_gear_calculateTotalSellPrice;

        if (_mode isEqualTo 2) then
        {
            _crateCheck = attachedObjects _vehicleObject;
            _count = count _crateCheck;
            switch _count do{
            case 1:{
                _crate = attachedObjects _vehicleObject select 0;
                _crateCargo = _crate call ExileClient_util_containerCargo_list;
                _cratePrice = _crateCargo call ExileClient_util_gear_calculateTotalSellPrice;
                _revenue = _revenue + _cratePrice;
                };
            case 2:{
                _crate = attachedObjects _vehicleObject select 1;
                _crateCargo = _crate call ExileClient_util_containerCargo_list;
                _cratePrice = _crateCargo call ExileClient_util_gear_calculateTotalSellPrice;
                _revenue = _revenue + _cratePrice;
                };
            };

            _revenue = _revenue + ([(typeOf _vehicleObject)] call ExileClient_util_gear_calculateTotalSellPrice);
        };
    }else{
        _crateCheck = attachedObjects _vehicleObject;
        _count = count _crateCheck;
        switch _count do{
        case 1:{
            _crate = attachedObjects _vehicleObject select 0;
            _crateCargo = _crate call ExileClient_util_containerCargo_list;
            _revenue = _crateCargo call ExileClient_util_gear_calculateTotalSellPrice;
            };
        case 2:{
            _crate = attachedObjects _vehicleObject select 1;
            _crateCargo = _crate call ExileClient_util_containerCargo_list;
            _revenue = _crateCargo call ExileClient_util_gear_calculateTotalSellPrice;
            };
        case 0:{ _revenue = 0; _revenue};
        default { _revenue = 0; _revenue};
        };
    };
    _revenueControl = _display displayCtrl 4001;
    _revenueControl ctrlSetStructuredText (parseText (format ["<t size='1.4'>%1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>", _revenue]));
    _sellButton = _display displayCtrl 4000;
    if(_revenue > 0)then
    {
        _sellButton ctrlEnable true;
    }
    else
    {
        _sellButton ctrlEnable false;
    };
};
true