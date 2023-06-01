hook OnPyConnect(playerid)
{
    if(DOF2_FileExists(File(playerid)))
    {
        pDados[playerid][Fome] = DOF2_GetInt(File(playerid), "Fome");
        pDados[playerid][Sede] = DOF2_GetInt(File(playerid), "Sede");
    } else {
        pDados[playerid][Fome] = 100;
        pDados[playerid][Sede] = 100;
    }
    SetTimerEx("TimerFome", 240000, true, "d", playerid);
    SetTimerEx("TimerSede", 180000, true, "d", playerid);
    return 1;
}

forward TimerFome(playerid);
public TimerFome(playerid)
{
    pDados[playerid][Fome]--;
    DOF2_SetInt(File(playerid), "Fome", pDados[playerid][Fome]);
    if(pDados[playerid][Fome] < 15)
    {
        SendClientMessage(playerid, VERMELHO, "[INFO]Voce esta com fome va ate um loja de alimento, e se coma algo.");
        GameTextForPlayer(playerid, "Voce esta com Fome", 5000, 5);
    }
    if(pDados[playerid][Fome] < 1)
    {
        pDados[playerid][Fome] = 0;
        SetPlayerHealth(playerid, 0.0);
    }
    return 1;
}

forward TimerSede(playerid);
public TimerSede(playerid)
{
    pDados[playerid][Sede]--;
    DOF2_SetInt(File(playerid), "Sede", pDados[playerid][Sede]);
    if(pDados[playerid][Sede] < 15)
    {
        SendClientMessage(playerid, VERMELHO, "[INFO]Voce esta com sede va ate um loja de alimentos, e beba algo.");
        GameTextForPlayer(playerid, "Voce esta com Sede", 5000, 5);
    }
    if(pDados[playerid][Sede] < 1)
    {
        pDados[playerid][Sede] = 0;
        SetPlayerHealth(playerid, 0.0);
    }
    return 1;
}