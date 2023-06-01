#include	<YSI_Coding\y_hooks>

forward SumirAviso(playerid);

hook SumirAviso(playerid)
{
    for(new i=0; i<10; ++i)
	{
		TextDrawHideForAll(AvisosA[i]);
	}
	return 1;
}

stock NomeAdmin(playerid)
{
    new PlayerNome[MAX_PLAYER_NAME];
    GetPlayerName(playerid, PlayerNome, sizeof(PlayerNome));
    return PlayerNome;
}

stock MostrarAviso(playerid)
{
    for(new i=0; i<10; ++i)
	{
		PlayerTextDrawShow(i, AvisosA[playerid][i]);
		SetTimer("SumirAviso", 1500, false);
	}
	return 1;
}