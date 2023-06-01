#include <YSI_Coding\y_hooks>

/*CORES*/
#define COLOR_LIGHTRED	0xFF6347AA

/*NEWS*/
new Advertencia[MAX_PLAYERS];
new BaseAdvertencia[MAX_PLAYERS];
new PlayerText:AdvertenciaTXT[MAX_PLAYERS][13];

hook OnPlayerConnect(playerid)
{
	/*TEXT DRAWS*/
	AdvertenciaTXT[playerid][0] = CreatePlayerTextDraw(playerid, 1.533311, 1.996299, "box");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][0], 0.000000, 49.958351);
	PlayerTextDrawTextSize(playerid, AdvertenciaTXT[playerid][0], 647.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][0], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, AdvertenciaTXT[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, AdvertenciaTXT[playerid][0], -16777150);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][0], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][0], 0);

	AdvertenciaTXT[playerid][1] = CreatePlayerTextDraw(playerid, 185.416625, 131.925933, "box");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][1], 0.000000, 17.166666);
	PlayerTextDrawTextSize(playerid, AdvertenciaTXT[playerid][1], 463.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][1], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, AdvertenciaTXT[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, AdvertenciaTXT[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][1], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][1], 0);

	AdvertenciaTXT[playerid][2] = CreatePlayerTextDraw(playerid, 186.399856, 133.273941, "box");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][2], 0.000000, 16.886606);
	PlayerTextDrawTextSize(playerid, AdvertenciaTXT[playerid][2], 461.410400, 0.000000);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][2], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, AdvertenciaTXT[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, AdvertenciaTXT[playerid][2], -16776961);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][2], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][2], 0);

	AdvertenciaTXT[playerid][3] = CreatePlayerTextDraw(playerid, 209.333648, 188.162902, "box");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][3], 0.000000, -0.296332);
	PlayerTextDrawTextSize(playerid, AdvertenciaTXT[playerid][3], 439.500030, 0.000000);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][3], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, AdvertenciaTXT[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, AdvertenciaTXT[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][3], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][3], 0);

	AdvertenciaTXT[playerid][4] = CreatePlayerTextDraw(playerid, 242.083343, 159.925933, "ADVERTENCIA");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][4], 0.750832, 2.875550);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][4], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][4], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][4], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][4], 1);

	AdvertenciaTXT[playerid][5] = CreatePlayerTextDraw(playerid, 322.449981, 189.899978, "VGLINDOX_LINDOOOOOOOOO");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][5], 0.299582, 1.247406);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][5], 2);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][5], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][5], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][5], 1);

	AdvertenciaTXT[playerid][6] = CreatePlayerTextDraw(playerid, 341.250091, 276.074096, "Administrador:");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][6], 0.179995, 1.019258);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][6], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][6], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][6], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][6], 1);

	AdvertenciaTXT[playerid][7] = CreatePlayerTextDraw(playerid, 385.349945, 277.111175, "Admin_DollynhO");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][7], 0.188747, 0.905555);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][7], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][7], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][7], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][7], 1);

	AdvertenciaTXT[playerid][8] = CreatePlayerTextDraw(playerid, 452.916656, 132.344451, "x");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][8], 0.431248, 1.237035);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][8], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][8], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][8], 3);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, AdvertenciaTXT[playerid][8], true);

	AdvertenciaTXT[playerid][9] = CreatePlayerTextDraw(playerid, 232.083267, 275.555603, "Advertencia:");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][9], 0.183749, 0.998516);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][9], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][9], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][9], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][9], 1);

	AdvertenciaTXT[playerid][10] = CreatePlayerTextDraw(playerid, 269.583404, 276.592651, "1");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][10], 0.133744, 0.868884);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][10], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][10], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][10], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][10], 1);

	AdvertenciaTXT[playerid][11] = CreatePlayerTextDraw(playerid, 272.916625, 275.555603, "/");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][11], 0.139996, 1.019255);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][11], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][11], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][11], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][11], 1);

	AdvertenciaTXT[playerid][12] = CreatePlayerTextDraw(playerid, 275.683776, 276.592651, "3");
	PlayerTextDrawLetterSize(playerid, AdvertenciaTXT[playerid][12], 0.133744, 0.868884);
	PlayerTextDrawAlignment(playerid, AdvertenciaTXT[playerid][12], 1);
	PlayerTextDrawColor(playerid, AdvertenciaTXT[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][12], 1);
	PlayerTextDrawSetOutline(playerid, AdvertenciaTXT[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, AdvertenciaTXT[playerid][12], 255);
	PlayerTextDrawFont(playerid, AdvertenciaTXT[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, AdvertenciaTXT[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, AdvertenciaTXT[playerid][12], 1);
	return 1;
}

hook OnPyCkPyTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == AdvertenciaTXT[playerid][8]) return FecharAdvertencia(playerid);
	return 1;
}
CMD:advertencia(playerid, params[])
{
    new ID, Avisando[64], String[100];
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, -1, "Voce Nao Tem Permicao");
	if(sscanf(params, "ds[64]", ID, Avisando))
        return SendClientMessage(playerid, 0xFF0000AA, "[ERRO]: /advertencia [ID] [Motivo]");
    new string[128];
    Advertencia[ID] += 1;
    if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, -1, "Jogador nao Conectado");
    if(Advertencia[playerid] < 3)
    {
        format(string, sizeof(string), "* Voce Deu Advertencia %s.", Nome(ID));
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
        if(BaseAdvertencia[playerid] == 1)
        {
			format(string, sizeof(string), "* Voce Foi Advertido pelo admin: %s, pelo motivo: %s.", Nome(playerid), Avisando);
		    SendClientMessage(ID, COLOR_LIGHTRED, string);
		    MostrarAdvertencia(playerid);
		    //NOME ADMIN
            format(String, sizeof(String), "%s", Nome(playerid));
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][7], String);
			//ADVERTENCIA MOTIVO
			format(String, sizeof(String), "%s", Avisando);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][5], String);
			//QUANTOS AVISO ELE TOMOU
			format(String, sizeof(String), "%d", Advertencia[playerid]);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][10], String);
        }
        if(BaseAdvertencia[playerid] == 0)
        {
            format(string, sizeof(string), "* Voce Foi Advertido pelo admin: %s, pelo motivo: %s.", Nome(playerid), Avisando);
		    SendClientMessage(ID, COLOR_LIGHTRED, string);
		    MostrarAdvertencia(playerid);
		    //NOME ADMIN
            format(String, sizeof(String), "%s", Nome(playerid));
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][7], String);
			//ADVERTENCIA MOTIVO
			format(String, sizeof(String), "%s", Avisando);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][5], String);
			//QUANTOS AVISO ELE TOMOU
			format(String, sizeof(String), "%d", Advertencia[playerid]);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][10], String);
        }
    }
    if(Advertencia[playerid] >= 3)
    {
        format(string, sizeof(string), "* Voce Deu Advertencia %s.", Nome(ID));
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
        if(BaseAdvertencia[playerid] == 1)
        {
            format(string, sizeof(string), "* Voce recebeu 3 Advertencia do admin: %s, pelo motivo: %s e foi Banido.", Nome(playerid), Avisando);
		    SendClientMessage(ID, COLOR_LIGHTRED, string);
		    MostrarAdvertencia(playerid);
		    //NOME ADMIN
            format(String, sizeof(String), "%s", Nome(playerid));
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][7], String);
			//ADVERTENCIA MOTIVO
			format(String, sizeof(String), "%s", Avisando);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][5], String);
			//QUANTOS AVISO ELE TOMOU
			format(String, sizeof(String), "%d", Advertencia[playerid]);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][10], String);
        }
        if(BaseAdvertencia[playerid] == 0)
        {
            format(string, sizeof(string), "* Voce recebeu 3 Advertencia do admin: %s, pelo motivo: %s e foi Banido.", Nome(playerid), Avisando);
    		SendClientMessage(ID, COLOR_LIGHTRED, string);
    		MostrarAdvertencia(playerid);
		    //NOME ADMIN
            format(String, sizeof(String), "%s", Nome(playerid));
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][7], String);
			//ADVERTENCIA MOTIVO
			format(String, sizeof(String), "%s", Avisando);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][5], String);
			//QUANTOS AVISO ELE TOMOU
			format(String, sizeof(String), "%d", Advertencia[playerid]);
			PlayerTextDrawSetString(playerid, AdvertenciaTXT[playerid][10], String);
        }
		format(string, sizeof(string), "INFO: O Jogador %s(%d) recebeu 3 avisos e foi Banido",Nome(ID), ID);
        SendClientMessageToAll(0xFFFF00AA, string);
		Ban(ID);
    }
    return 1;
}
stock MostrarAdvertencia(playerid)
{
	for(new i=0; i<13; ++i)
	{
		PlayerTextDrawShow(playerid, AdvertenciaTXT[playerid][i]);
		SelectTextDraw(playerid, 0xFF0000AA);
	}
	return 1;
}
stock FecharAdvertencia(playerid)
{
    for(new i=0; i<13; ++i)
	{
		PlayerTextDrawHide(playerid, AdvertenciaTXT[playerid][i]);
		CancelSelectTextDraw(playerid);
	}
	return 1;
}
