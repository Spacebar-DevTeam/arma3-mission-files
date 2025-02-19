params["_delay","_function","_params","_persistant"];

private _handle = _this spawn
{
	params["_delay","_function","_params","_persistant"];
	uiSleep _delay;

	if !(time > 0) then
	{
		waitUntil {(time > 0)};
	};
	if !(PublicServerIsLoaded) then
	{
		waitUntil {PublicServerIsLoaded};
	};
	if (isNil "ExileClientLoadedIn") then
	{
		waitUntil {!isNil "ExileClientLoadedIn"};
	};

	if (_persistant) then
	{
		while {true} do
		{
			// To stop variables from being changed...
			call
			{
				private["_delay","_function","_params","_persistant"];
				disableSerialization;
				(_this select 0) call (_this select 1);
			};
			uiSleep _delay;
		};
	}
	else
	{
		_params call _function;
	};
};

private _threadID = ExileSystemThreadID + 0;
ExileSystemSpawnThread pushBack [_threadID, _handle];
ExileSystemThreadID = ExileSystemThreadID + 1;
format ["Job with handle %1 added.", _threadID] call ExileClient_util_log;

_threadID