private ["_output", "_popTabsString", "_split", "_display"];
_output = [];
_popTabsString = _this call ExileClient_util_string_exponentToString;


_split = _popTabsString splitString "";
reverse _split;

{
	if((_forEachIndex%3==0) && (_forEachIndex!=0)) then {
		_output pushBack ",";
	};
	_output pushBack _x;
} forEach _split;

reverse _output;
_display = _output joinString "";
_display