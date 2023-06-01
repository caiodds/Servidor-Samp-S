new Total_IDs = 1200, Text3D:TextIDFixo[MAX_PLAYERS];

hook OnPlayerCn(playerid)
{
    if(!IsPlayerNPC(playerid))
	{
		if(!DOF2_IsSet("id-fixo.ini", Nome(playerid)))
		{
            Total_IDs++;
			DOF2_SetInt("id-fixo.ini", Nome(playerid), Total_IDs);
            DOF2_SetInt("id-fixo.ini", "ID", Total_IDs);
		}
		pDados[playerid][IDFixo] = DOF2_GetInt("id-fixo.ini", Nome(playerid));
	}
    static str[125];
    format(str, 125, "%d", GetPlayerFixedID(playerid));
    TextIDFixo[playerid] = Create3DTextLabel(str, 0xFFFFFFFF, 30.0, 40.0, 50.0, 40.0, 0);
    Attach3DTextLabelToPlayer(TextIDFixo[playerid], playerid, 0.0, 0.0, 0.3);
    return 1;
}

hook OnPyDn(playerid, reason)
{
    Delete3DTextLabel(TextIDFixo[playerid]);
    return 1;
}

hook OnGMExit()
{
	DOF2_SetInt("id-fixo.ini", "ID", Total_IDs);
    return 1;
}

GetPlayerFixedID(playerid) return pDados[playerid][IDFixo];