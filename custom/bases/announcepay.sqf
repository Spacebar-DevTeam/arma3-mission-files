/* 
Created by Lunchbox for use with Exile mod for Arma 3.
Copyright 2016, Lunchbox, All rights reserved.
*/
	_playerUID = getPlayerUID player;
        {
            _flag = _x;
            _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
            if (_playerUID in _buildRights) then
            {
			_nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
			_name = _flag getVariable ["ExileTerritoryName", ""];
			_dueDate = format 
			[
				"%2/%3/%1",
				_nextDueDate select 0,
				_nextDueDate select 1,
				_nextDueDate select 2
			];
			 //["ProtectionPayment",["",format["<t color='#E48A36'>%2</t> territory payment due: <t color='#E48A36'>%1</t>",_dueDate,_name]]] call BIS_fnc_showNotification;
			 ["InfoTitleAndText", ["Territory Information", format ["Territory Name: <t color='#E48A36'>%2</t><br/>Payment Due Date: <t color='#E48A36'>%1</t><br/>Pay your Base protection at the Office Trader!",_dueDate,_name]]] call ExileClient_gui_toaster_addTemplateToast;
            };
        }
        forEach (allMissionObjects "Exile_Construction_Flag_Static");