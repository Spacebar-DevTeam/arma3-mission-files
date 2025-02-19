/**
 * ExileClient_construction_beginExistingObject
 *
 * Edited for Exile by _sinworks
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_display","_title","_titleControl","_description","_descriptionBackground"];
disableSerialization;
_display = uiNamespace getVariable "RscExileConstructionMode";
if (!isNull _display) then
{
	_title = "";
	switch (ExileClientConstructionMode) do
	{
		case 1: { _title = "FREE MODE"; };
		case 2: { _title = "GRID MODE"; };
		case 3: { _title = "SNAP MODE"; };
	};
	if (ExileClientConstructionModePhysx) then
	{
		_title = _title + " + PHYSICS";
	};
	if (ExileClientConstructionVectorMode ) then
	{
		_title = _title + " + VECTORS";
	};
	_titleControl = _display displayCtrl 1000;
	_titleControl ctrlSetText _title;
	_description = _display displayCtrl 1001;
	_description ctrlShow ExileClientConstructionShowHint;
	_descriptionBackground = _display displayCtrl 1002;
	_descriptionBackground ctrlShow ExileClientConstructionShowHint;
	if (!ExileClientConstructionVectorMode)then
	{
		_pos = ctrlPosition _descriptionBackground;
		_descriptionBackground ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,370 * pixelH];
		_descriptionBackground ctrlCommit 0;
	    _description ctrlSetStructuredText parseText Format["<t align='left'>Free Mode</t><t align='right' color='#3fd4fc'>1</t><br/><t align='left'>Grid Mode</t><t align='right' color='#3fd4fc'>2</t><br/><t align='left'>Snap Mode</t><t align='right' color='#3fd4fc'>3</t><br/><br/><t align='left'>Toggle Physics</t><t align='right' color='#3fd4fc'>4</t><br/><t align='left'>Toggle Assistant</t><t align='right' color='#3fd4fc'>5</t><br/><t align='left'>Freeze Object</t><t align='right' color='#3fd4fc'>6</t><br/><t align='left'>Toggle Vector Building</t><t align='right' color='#3fd4fc'>7</t><br/><br/><t align='left'>Rotation</t><t align='right' color='#3fd4fc'>Q/E</t><br/><t align='left'>Elevation</t><t align='right' color='#3fd4fc'>PAGE UP/DOWN</t><br/><t align='left'>Distance</t><t align='right' color='#3fd4fc'>HOME/END</t><br/><br/><t align='left'>Larger Steps</t><t align='right' color='#3fd4fc'>SHIFT</t><br/><t align='left'>Smaller Steps</t><t align='right' color='#3fd4fc'>CONTROL</t><br/><br/><t align='left'>Place</t><t align='right' color='#3fd4fc'>SPACE</t><br/><t align='left'>Abort</t><t align='right' color='#3fd4fc'>ESCAPE</t>"];
	}
	else
	{
		_pos = ctrlPosition _descriptionBackground;
		_descriptionBackground ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,400 * pixelH];
		_descriptionBackground ctrlCommit 0;
	    _description ctrlSetStructuredText parseText Format["<t align='left'>Free Mode</t><t align='right' color='#3fd4fc'>1</t><br/><t align='left'>Grid Mode</t><t align='right' color='#3fd4fc'>2</t><br/><t align='left'>Snap Mode</t><t align='right' color='#3fd4fc'>3</t><br/><br/><t align='left'>Toggle Physics</t><t align='right' color='#3fd4fc'>4</t><br/><t align='left'>Toggle Assistant</t><t align='right' color='#3fd4fc'>5</t><br/><t align='left'>Freeze Object</t><t align='right' color='#3fd4fc'>6</t><br/><t align='left'>Toggle Vector Building</t><t align='right' color='#3fd4fc'>7</t><br/><br/><t align='left'>Tilt Left</t><t align='right' color='#3fd4fc'>Q</t><br/><t align='left'>Tilt Right</t><t align='right' color='#3fd4fc'>E</t><br/><t align='left'>Pitch Forwards</t><t align='right' color='#3fd4fc'>PAGE UP</t><br/><t align='left'>Pitch Backwards</t><t align='right' color='#3fd4fc'>PAGE DOWN</t><br/><t align='left'>Distance</t><t align='right' color='#3fd4fc'>HOME/END</t><br/><br/><t align='left'>Larger Steps</t><t align='right' color='#3fd4fc'>SHIFT</t><br/><t align='left'>Smaller Steps</t><t align='right' color='#3fd4fc'>CONTROL</t><br/><br/><t align='left'>Place</t><t align='right' color='#3fd4fc'>SPACE</t><br/><t align='left'>Abort</t><t align='right' color='#3fd4fc'>ESCAPE</t>"];
	};
};
true
