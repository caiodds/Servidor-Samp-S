#if defined _identity_included
	#endinput
#endif

#define _identity_included

new Total_IDs = 55474, Fixed_ID[MAX_PLAYERS];

// ------------------ ( FUNCTION ) ------------------ //

stock GetPlayerFixedID(playerid) return Fixed_ID[playerid];

stock get_name(playerid)
{
	new str[24];
	GetPlayerName(playerid, str, sizeof(str));
	return str;
}

// ------------------ ( HOOKS ) ------------------ //

public OnGameModeInit()
{
	if(!fexist("id-fixo.ini"))
	{
		DOF2_CreateFile("id-fixo.ini");
		DOF2_SetInt("id-fixo.ini", "ID", 1);
	}
	Total_IDs = DOF2_GetInt("id-fixo.ini", "ID");
	#if defined ID_OnGameModeInit
		return ID_OnGameModeInit();
	#else
		return 1;
	#endif
}

public OnGameModeExit()
{
	DOF2_Exit();	
	DOF2_SetInt("id-fixo.ini", "ID", Total_IDs);
	#if defined ID_OnGameModeExit
		return ID_OnGameModeExit();
	#else
		return 1;
	#endif
}

public OnPlayerConnect(playerid)
{
	if(!IsPlayerNPC(playerid))
	{
		if(!DOF2_IsSet("id-fixo.ini", get_name(playerid)))
		{
			DOF2_SetInt("id-fixo.ini", get_name(playerid), Total_IDs);
			Total_IDs++;
		}
		Fixed_ID[playerid] = DOF2_GetInt("id-fixo.ini", get_name(playerid));
	}
	#if defined ID_OnPlayerConnect
		return ID_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDisconnect(playerid, reason)
{
	Fixed_ID[playerid] = 0;
	#if defined ID_OnPlayerDisconnect
		return ID_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnGameModeInit ID_OnGameModeInit
#define OnGameModeExit ID_OnGameModeExit
#define OnPlayerConnect ID_OnPlayerConnect
#define OnPlayerDisconnect ID_OnPlayerDisconnect

#if defined ID_OnGameModeInit
	forward ID_OnGameModeInit();
#endif

#if defined ID_OnGameModeExit
	forward ID_OnGameModeExit();
#endif

#if defined ID_OnPlayerConnect
	forward ID_OnPlayerConnect(playerid);
#endif

#if defined ID_OnPlayerDisconnect
	forward ID_OnPlayerDisconnect(playerid, reason);
#endif