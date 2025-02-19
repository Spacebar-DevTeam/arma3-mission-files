params["_threadID"];

scopeName "main";
{
	_x params["_id","_handle"];
	if (_id == _threadID) then
	{
		terminate _handle;
		true breakOut "main" // we removed the thread, so no need to continue looping...
	};
} forEach ExileSystemSpawnThread;

true