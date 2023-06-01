#include <YSI_Coding\y_hooks>

//Chats
CMD:ds(playerid, params[])
{
	new Str[128];
    format(Str, sizeof Str, "{19058b}(Discord) {FFFFFF}%s {19058b}[{FFFFFF}%d{19058b}]: {FFFFFF} %s", Nome(playerid), playerid, params);
    SendClientMessageToAll(-1, Str);
    return 1;
}

CMD:frp(playerid, params[])
{
	new Str[128];
    format(Str, sizeof Str, "{34eb52}(Fora do RP) {FFFFFF}%s {34eb52}[{FFFFFF}%d{34eb52}]: {FFFFFF} %s", Nome(playerid), playerid, params);
    SendClientMessageToAll(-1, Str);
    return 1;
}

//Comandos Spawn
CMD:alugarbike(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1703.9183,-2312.2183,13.5469))
	{
	    if(pDados[playerid][PegouBike] > 0) return SendClientMessage(playerid, -1, "[INFO]: Voce ja alugou uma bike!");
	    else
	    {
	        pDados[playerid][PegouBike] = CreateVehicle(481, 1703.8669, -2315.3730, 12.9911, 180.9774, -1, -1, 120);
	    }
	    SendClientMessage(playerid, -1, "[INFO]: Voce alugou uma bike por R$50!");
	    GivePlayerMoney(playerid, -50);
	    PutPlayerInVehicle(playerid, pDados[playerid][PegouBike], 0);
	}
	return 1;
}

//Agencia de Empregos
CMD:profs(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 951.8302, -1744.5352, 13.6210))
	{
	    MostrarTDEmpregos(playerid);
	}
	return 1;
}

CMD:mudarsexo(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_MUDARSEXO, DIALOG_STYLE_LIST, "Mudar Sexo", "Masculino\nFeminino", "Escolher", "Cancelar");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_MUDARSEXO)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:{
					pDados[playerid][Sexo] = 1; //MASCULINO
				}
				case 1:{
					pDados[playerid][Sexo] = 2; //FEMININO
				}
			}
		}
	}
	return 1;
}