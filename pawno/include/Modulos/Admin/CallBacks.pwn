#include    <YSI_Coding\y_hooks>

// --------

//Variaveis
new Float:PosTM[3];

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_TELEMARK)
    {
        if(response)
        {
            SetPlayerPos(playerid, PosTM[0], PosTM[1], PosTM[2]);
            SetPlayerInterior(playerid,0);
            SetPlayerVirtualWorld(playerid, 0);
        }
        else if(!response) return SendClientMessage(playerid, -1, "Voce decidiu nao teleportar.");
    }
    return 1;
}

hook OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(pDados[playerid][Admin] >= 1)
	{
		PosTM[0] = fX;
		PosTM[1] = fY;
		PosTM[2] = fZ;
		ShowPlayerDialog(playerid, DIALOG_TELEMARK, DIALOG_STYLE_MSGBOX, "TeleMark", "Deseja teleportar para o lugar marcado?", "Sim", "Nao");
	}
	return 1;
}