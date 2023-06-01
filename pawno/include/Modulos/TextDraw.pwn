#include    <YSI_Coding\y_hooks>

/*
Autor:
 _____        _ _             _      ____  
|  __ \      | | |           | |    / __ \ 
| |  | | ___ | | |_   _ _ __ | |__ | |  | |
| |  | |/ _ \| | | | | | '_ \| '_ \| |  | |
| |__| | (_) | | | |_| | | | | | | | |__| |
|_____/ \___/|_|_|\__, |_| |_|_| |_|\____/ 
                   __/ |                   
                  |___/ 

Discord: 𝕯𝖔𝖑𝖑𝖎𝖓𝖍𝕺 2.0#7777

Porfavor não retire os creditos!
*/

//Variaveis
new Text:AvisosA[10];
new PlayerText:OpenBank[MAX_PLAYERS][39];
new PlayerText:TelaEmpregos[MAX_PLAYERS][23];
new PlayerText:TelaLogin[MAX_PLAYERS][34];
new PlayerText:TelaRegistro[MAX_PLAYERS][44];
new PlayerText:Hud[MAX_PLAYERS][83];
new Text:logoserver[11];

hook OnPlayerConnect(playerid)
{
    CriarTDEmprego(playerid);
    CriarTDHud(playerid);
    CriarTDLogin(playerid);
    CriarTDRegistro(playerid);
	CriarTDAvisos();
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    MostrarTDHud(playerid);
    MostrarTDLogo(playerid);
    return 1;
}

stock CriarTDAvisos()
{
	AvisosA[0] = TextDrawCreate(3.399976, 168.077529, "box");
	TextDrawLetterSize(AvisosA[0], 0.000000, 10.791666);
	TextDrawTextSize(AvisosA[0], 179.000000, 0.000000);
	TextDrawAlignment(AvisosA[0], 1);
	TextDrawColor(AvisosA[0], -1);
	TextDrawUseBox(AvisosA[0], 1);
	TextDrawBoxColor(AvisosA[0], 38655);
	TextDrawSetShadow(AvisosA[0], 0);
	TextDrawSetOutline(AvisosA[0], 0);
	TextDrawBackgroundColor(AvisosA[0], 255);
	TextDrawFont(AvisosA[0], 1);
	TextDrawSetProportional(AvisosA[0], 1);
	TextDrawSetShadow(AvisosA[0], 0);

	AvisosA[1] = TextDrawCreate(68.933059, 196.014678, "viso");
	TextDrawLetterSize(AvisosA[1], 0.377081, 1.454818);
	TextDrawAlignment(AvisosA[1], 1);
	TextDrawColor(AvisosA[1], -1);
	TextDrawSetShadow(AvisosA[1], 0);
	TextDrawSetOutline(AvisosA[1], 0);
	TextDrawBackgroundColor(AvisosA[1], 255);
	TextDrawFont(AvisosA[1], 0);
	TextDrawSetProportional(AvisosA[1], 1);
	TextDrawSetShadow(AvisosA[1], 0);

	AvisosA[2] = TextDrawCreate(70.166389, 205.055480, "dministracao");
	TextDrawLetterSize(AvisosA[2], 0.377081, 1.454818);
	TextDrawAlignment(AvisosA[2], 1);
	TextDrawColor(AvisosA[2], -1);
	TextDrawSetShadow(AvisosA[2], 0);
	TextDrawSetOutline(AvisosA[2], 0);
	TextDrawBackgroundColor(AvisosA[2], 255);
	TextDrawFont(AvisosA[2], 0);
	TextDrawSetProportional(AvisosA[2], 1);
	TextDrawSetShadow(AvisosA[2], 0);

	AvisosA[3] = TextDrawCreate(52.583015, 196.222290, "A");
	TextDrawLetterSize(AvisosA[3], 0.629166, 2.315555);
	TextDrawAlignment(AvisosA[3], 1);
	TextDrawColor(AvisosA[3], 65535);
	TextDrawSetShadow(AvisosA[3], 0);
	TextDrawSetOutline(AvisosA[3], 0);
	TextDrawBackgroundColor(AvisosA[3], 255);
	TextDrawFont(AvisosA[3], 0);
	TextDrawSetProportional(AvisosA[3], 1);
	TextDrawSetShadow(AvisosA[3], 0);

	AvisosA[4] = TextDrawCreate(58.399703, 216.492431, "New_Life_Roleplay");
	TextDrawLetterSize(AvisosA[4], 0.193332, 0.998524);
	TextDrawAlignment(AvisosA[4], 1);
	TextDrawColor(AvisosA[4], 65535);
	TextDrawSetShadow(AvisosA[4], 0);
	TextDrawSetOutline(AvisosA[4], 0);
	TextDrawBackgroundColor(AvisosA[4], 255);
	TextDrawFont(AvisosA[4], 1);
	TextDrawSetProportional(AvisosA[4], 1);
	TextDrawSetShadow(AvisosA[4], 0);

	AvisosA[5] = TextDrawCreate(8.183300, 173.662734, "box");
	TextDrawLetterSize(AvisosA[5], 0.000000, 9.541663);
	TextDrawTextSize(AvisosA[5], 173.490280, 0.000000);
	TextDrawAlignment(AvisosA[5], 1);
	TextDrawColor(AvisosA[5], -1);
	TextDrawUseBox(AvisosA[5], 1);
	TextDrawBoxColor(AvisosA[5], 103);
	TextDrawSetShadow(AvisosA[5], 0);
	TextDrawSetOutline(AvisosA[5], 0);
	TextDrawBackgroundColor(AvisosA[5], 182);
	TextDrawFont(AvisosA[5], 1);
	TextDrawSetProportional(AvisosA[5], 1);
	TextDrawSetShadow(AvisosA[5], 0);

	AvisosA[6] = TextDrawCreate(8.183300, 173.662734, "box");
	TextDrawLetterSize(AvisosA[6], 0.000000, 9.541663);
	TextDrawTextSize(AvisosA[6], 173.490280, 0.000000);
	TextDrawAlignment(AvisosA[6], 1);
	TextDrawColor(AvisosA[6], -1);
	TextDrawUseBox(AvisosA[6], 1);
	TextDrawBoxColor(AvisosA[6], 103);
	TextDrawSetShadow(AvisosA[6], 0);
	TextDrawSetOutline(AvisosA[6], 0);
	TextDrawBackgroundColor(AvisosA[6], 182);
	TextDrawFont(AvisosA[6], 1);
	TextDrawSetProportional(AvisosA[6], 1);
	TextDrawSetShadow(AvisosA[6], 0);

	AvisosA[7] = TextDrawCreate(9.166643, 173.407379, "NewLife:RP_venha_conhecer");
	TextDrawLetterSize(AvisosA[7], 0.182494, 0.988147);
	TextDrawAlignment(AvisosA[7], 1);
	TextDrawColor(AvisosA[7], -1);
	TextDrawSetShadow(AvisosA[7], 0);
	TextDrawSetOutline(AvisosA[7], 0);
	TextDrawBackgroundColor(AvisosA[7], 255);
	TextDrawFont(AvisosA[7], 1);
	TextDrawSetProportional(AvisosA[7], 1);
	TextDrawSetShadow(AvisosA[7], 0);

	AvisosA[8] = TextDrawCreate(12.083312, 251.703659, "Admin:");
	TextDrawLetterSize(AvisosA[8], 0.181244, 0.962221);
	TextDrawAlignment(AvisosA[8], 1);
	TextDrawColor(AvisosA[8], -1);
	TextDrawSetShadow(AvisosA[8], 0);
	TextDrawSetOutline(AvisosA[8], 0);
	TextDrawBackgroundColor(AvisosA[8], 255);
	TextDrawFont(AvisosA[8], 1);
	TextDrawSetProportional(AvisosA[8], 1);
	TextDrawSetShadow(AvisosA[8], 0);

	AvisosA[9] = TextDrawCreate(33.333309, 252.085189, "RodrigoXV");
	TextDrawLetterSize(AvisosA[9], 0.181244, 0.962221);
	TextDrawAlignment(AvisosA[9], 1);
	TextDrawColor(AvisosA[9], -1);
	TextDrawSetShadow(AvisosA[9], 0);
	TextDrawSetOutline(AvisosA[9], 0);
	TextDrawBackgroundColor(AvisosA[9], 255);
	TextDrawFont(AvisosA[9], 1);
	TextDrawSetProportional(AvisosA[9], 1);
	TextDrawSetShadow(AvisosA[9], 0);

}

stock CriarTDOpenBank(playerid)
{
	/*
	----------------------------
			Text Banco
	----------------------------	
	*/
	OpenBank[playerid][0] = CreatePlayerTextDraw(playerid, 249.166687, 61.925899, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][0], 0.000000, 36.500003);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][0], 401.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][0], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][0], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][0], 0);

	OpenBank[playerid][1] = CreatePlayerTextDraw(playerid, 237.916671, 71.259231, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][1], 0.000000, 34.250003);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][1], 411.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][1], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][1], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][1], 0);

	OpenBank[playerid][2] = CreatePlayerTextDraw(playerid, 231.516799, 55.007404, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][2], 29.000000, 33.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][2], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][2], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][2], 0);

	OpenBank[playerid][3] = CreatePlayerTextDraw(playerid, 231.683563, 364.999969, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][3], 29.000000, 33.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][3], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][3], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][3], 0);

	OpenBank[playerid][4] = CreatePlayerTextDraw(playerid, 388.117156, 364.762847, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][4], 29.000000, 33.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][4], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][4], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][4], 0);

	OpenBank[playerid][5] = CreatePlayerTextDraw(playerid, 387.700531, 54.688755, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][5], 29.000000, 33.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][5], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][5], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][5], 0);

	OpenBank[playerid][6] = CreatePlayerTextDraw(playerid, 244.583435, 62.018524, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][6], 0.000000, 2.666679);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][6], 402.001953, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][6], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][6], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][6], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][6], 0);

	OpenBank[playerid][7] = CreatePlayerTextDraw(playerid, 237.699951, 67.666633, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][7], 0.000000, 2.041679);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][7], 410.452392, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][7], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][7], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][7], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][7], 0);

	OpenBank[playerid][8] = CreatePlayerTextDraw(playerid, 233.966735, 57.218555, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][8], 16.000000, 19.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][8], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][8], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][8], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][8], 0);

	OpenBank[playerid][9] = CreatePlayerTextDraw(playerid, 395.666961, 56.481597, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][9], 19.500011, 22.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][9], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][9], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][9], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][9], 0);

	OpenBank[playerid][10] = CreatePlayerTextDraw(playerid, 246.917114, 57.000125, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][10], 29.000000, 32.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][10], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][10], 16711935);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][10], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][10], 0);

	OpenBank[playerid][11] = CreatePlayerTextDraw(playerid, 248.017059, 58.618610, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][11], 26.470010, 29.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][11], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][11], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][11], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][11], 0);

	OpenBank[playerid][12] = CreatePlayerTextDraw(playerid, 248.533309, 71.877700, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][12], 0.000000, 0.375012);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][12], 299.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][12], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][12], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][12], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][12], 0);

	OpenBank[playerid][13] = CreatePlayerTextDraw(playerid, 241.249984, 67.629592, "open");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][13], 0.265000, 1.050371);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][13], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][13], 255);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][13], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][13], 0);

	OpenBank[playerid][14] = CreatePlayerTextDraw(playerid, 262.333251, 67.929595, "bank");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][14], 0.265000, 1.050371);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][14], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][14], 16711935);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][14], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][14], 0);

	OpenBank[playerid][15] = CreatePlayerTextDraw(playerid, 289.833435, 64.818504, "Guilherme_Oliveira");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][15], 0.200833, 0.951852);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][15], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][15], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][15], 0);

	OpenBank[playerid][16] = CreatePlayerTextDraw(playerid, 291.766906, 76.844383, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][16], 0.000000, 0.375012);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][16], 299.400146, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][16], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][16], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][16], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][16], 0);

	OpenBank[playerid][17] = CreatePlayerTextDraw(playerid, 292.466949, 77.444374, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][17], 0.000000, 0.250012);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][17], 299.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][17], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][17], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][17], 255);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][17], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][17], 0);

	OpenBank[playerid][18] = CreatePlayerTextDraw(playerid, 292.666961, 78.044364, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][18], 0.000000, 0.375012);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][18], 300.300201, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][18], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][18], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][18], 0);

	OpenBank[playerid][19] = CreatePlayerTextDraw(playerid, 300.383605, 80.036964, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][19], 0.000000, -0.166653);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][19], 300.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][19], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][19], 255);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][19], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][19], 0);

	OpenBank[playerid][20] = CreatePlayerTextDraw(playerid, 303.383422, 75.088859, "1234567899");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][20], 0.168750, 0.749630);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][20], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][20], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][20], 0);

	OpenBank[playerid][21] = CreatePlayerTextDraw(playerid, 357.899780, 72.459190, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][21], 0.000000, 0.500012);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][21], 368.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][21], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][21], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][21], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][21], 0);

	OpenBank[playerid][22] = CreatePlayerTextDraw(playerid, 357.899780, 73.459175, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][22], 0.000000, -0.083320);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][22], 368.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][22], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][22], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][22], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][22], 255);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][22], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][22], 0);

	OpenBank[playerid][23] = CreatePlayerTextDraw(playerid, 370.900024, 71.359230, "123456789");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][23], 0.168750, 0.749630);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][23], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][23], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][23], 0);

	OpenBank[playerid][24] = CreatePlayerTextDraw(playerid, 237.699951, 125.222206, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][24], 0.000000, 3.125014);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][24], 411.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][24], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][24], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][24], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][24], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][24], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][24], 0);

	OpenBank[playerid][25] = CreatePlayerTextDraw(playerid, 285.666961, 130.151870, "DEPOSITAR");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][25], 0.397500, 1.781481);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][25], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][25], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][25], 0);
	PlayerTextDrawSetSelectable(playerid, OpenBank[playerid][25], true);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][25], 150.0, 80.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	OpenBank[playerid][26] = CreatePlayerTextDraw(playerid, 237.699951, 180.092590, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][26], 0.000000, 3.125014);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][26], 411.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][26], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][26], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][26], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][26], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][26], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][26], 0);

	OpenBank[playerid][27] = CreatePlayerTextDraw(playerid, 299.833679, 185.114852, "SACAR");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][27], 0.397500, 1.781481);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][27], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][27], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][27], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][27], 0);
	PlayerTextDrawSetSelectable(playerid, OpenBank[playerid][27], true);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][27], 150.0, 80.0);
	SelectTextDraw(playerid, 0x0000FFFFAA);

	OpenBank[playerid][28] = CreatePlayerTextDraw(playerid, 237.983337, 233.074081, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][28], 0.000000, 3.125014);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][28], 410.700042, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][28], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][28], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][28], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][28], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][28], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][28], 0);

	OpenBank[playerid][29] = CreatePlayerTextDraw(playerid, 288.583648, 237.485260, "TRANSERIR");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][29], 0.397500, 1.781481);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][29], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][29], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][29], 0);
	PlayerTextDrawSetSelectable(playerid, OpenBank[playerid][29], true);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][29], 150.0, 80.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	OpenBank[playerid][30] = CreatePlayerTextDraw(playerid, 237.983337, 286.481414, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][30], 0.000000, 3.125014);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][30], 411.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][30], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][30], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][30], 8388863);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][30], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][30], 0);

	OpenBank[playerid][31] = CreatePlayerTextDraw(playerid, 276.083770, 291.411163, "PAGAR_MULTAS");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][31], 0.397500, 1.781481);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][31], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][31], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][31], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][31], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][31], 0);
	PlayerTextDrawSetSelectable(playerid, OpenBank[playerid][31], true);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][31], 150.0, 80.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	OpenBank[playerid][32] = CreatePlayerTextDraw(playerid, 282.566680, 343.000000, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][32], 0.000000, 1.708347);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][32], 355.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][32], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][32], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][32], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][32], -16776961);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][32], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][32], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][32], 0);

	OpenBank[playerid][33] = CreatePlayerTextDraw(playerid, 286.500000, 338.851898, "box");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][33], 0.000000, 2.541681);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][33], 350.600036, 0.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][33], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][33], -1);
	PlayerTextDrawUseBox(playerid, OpenBank[playerid][33], 1);
	PlayerTextDrawBoxColor(playerid, OpenBank[playerid][33], -16776961);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][33], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][33], 0);

	OpenBank[playerid][34] = CreatePlayerTextDraw(playerid, 278.667175, 333.788909, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][34], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][34], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][34], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][34], -16776961);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][34], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][34], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][34], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][34], 0);

	OpenBank[playerid][35] = CreatePlayerTextDraw(playerid, 278.783996, 346.962768, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][35], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][35], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][35], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][35], -16776961);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][35], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][35], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][35], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][35], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][35], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][35], 0);

	OpenBank[playerid][36] = CreatePlayerTextDraw(playerid, 344.650543, 333.907470, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][36], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][36], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][36], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][36], -16776961);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][36], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][36], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][36], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][36], 0);

	OpenBank[playerid][37] = CreatePlayerTextDraw(playerid, 344.667083, 346.870391, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][37], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][37], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][37], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][37], -16776961);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][37], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][37], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][37], 4);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][37], 0);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][37], 0);

	OpenBank[playerid][38] = CreatePlayerTextDraw(playerid, 300.250366, 341.707550, "SAIR");
	PlayerTextDrawLetterSize(playerid, OpenBank[playerid][38], 0.479583, 1.890369);
	PlayerTextDrawAlignment(playerid, OpenBank[playerid][38], 1);
	PlayerTextDrawColor(playerid, OpenBank[playerid][38], -1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][38], 0);
	PlayerTextDrawSetOutline(playerid, OpenBank[playerid][38], 0);
	PlayerTextDrawBackgroundColor(playerid, OpenBank[playerid][38], 255);
	PlayerTextDrawFont(playerid, OpenBank[playerid][38], 1);
	PlayerTextDrawSetProportional(playerid, OpenBank[playerid][38], 1);
	PlayerTextDrawSetShadow(playerid, OpenBank[playerid][38], 0);
	PlayerTextDrawSetSelectable(playerid, OpenBank[playerid][38], true);
	PlayerTextDrawTextSize(playerid, OpenBank[playerid][38], 150.0, 80.0);
	SelectTextDraw(playerid, 0x0000FFFF);
	CancelSelectTextDraw(playerid);
}

stock CriarTDEmprego(playerid)
{
	/*
	----------------------------
		Text Empregos
	----------------------------	
	*/
	TelaEmpregos[playerid][0] = CreatePlayerTextDraw(playerid, 220.833328, 90.962982, "box");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][0], 0.000000, 28.083372);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][0], 433.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][0], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, TelaEmpregos[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, TelaEmpregos[playerid][0], 110);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][0], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][0], 0);

	TelaEmpregos[playerid][1] = CreatePlayerTextDraw(playerid, 221.666656, 92.000007, "box");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][1], 0.000000, 3.291656);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][1], 433.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][1], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, TelaEmpregos[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, TelaEmpregos[playerid][1], 200);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][1], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][1], 0);

	TelaEmpregos[playerid][2] = CreatePlayerTextDraw(playerid, 253.749984, 99.777732, "AGENCIA_DE_EMPREGO");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][2], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][2], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][2], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][2], 0);

	TelaEmpregos[playerid][3] = CreatePlayerTextDraw(playerid, 221.033355, 123.055549, "box");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][3], 0.000000, -0.166673);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][3], 433.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][3], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, TelaEmpregos[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, TelaEmpregos[playerid][3], 65535);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][3], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][3], 0);

	TelaEmpregos[playerid][4] = CreatePlayerTextDraw(playerid, 231.733184, 127.429580, "box");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][4], 0.000000, 1.333325);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][4], 422.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][4], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, TelaEmpregos[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, TelaEmpregos[playerid][4], 200);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][4], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][4], 0);

	TelaEmpregos[playerid][5] = CreatePlayerTextDraw(playerid, 246.816772, 128.196304, "EMPREGO");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][5], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][5], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][5], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][5], 0);

	TelaEmpregos[playerid][6] = CreatePlayerTextDraw(playerid, 343.283325, 128.633331, "REQUISISTOS");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][6], 0.251666, 1.076297);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][6], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][6], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][6], 0);

	TelaEmpregos[playerid][7] = CreatePlayerTextDraw(playerid, 226.566650, 152.118408, "box");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][7], 0.000000, 20.541648);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][7], 429.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][7], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, TelaEmpregos[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, TelaEmpregos[playerid][7], 200);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][7], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][7], 0);

	TelaEmpregos[playerid][8] = CreatePlayerTextDraw(playerid, 230.150085, 152.588500, "LIXEIRO");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][8], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][8], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][8], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][8], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][8], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][9] = CreatePlayerTextDraw(playerid, 352.233428, 151.169967, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][9], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][9], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][9], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][9], 0);

	TelaEmpregos[playerid][10] = CreatePlayerTextDraw(playerid, 229.733413, 179.741394, "PRANCHEIRO");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][10], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][10], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][10], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][10], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][10], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][11] = CreatePlayerTextDraw(playerid, 352.233428, 179.241394, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][11], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][11], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][11], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][11], 0);

	TelaEmpregos[playerid][12] = CreatePlayerTextDraw(playerid, 229.216735, 208.401992, "LENHADOR");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][12], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][12], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][12], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][12], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][12], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][13] = CreatePlayerTextDraw(playerid, 351.566650, 206.638885, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][13], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][13], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][13], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][13], 0);

	TelaEmpregos[playerid][14] = CreatePlayerTextDraw(playerid, 228.916870, 264.560882, "CORREIO");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][14], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][14], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][14], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][14], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][14], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][15] = CreatePlayerTextDraw(playerid, 351.466522, 262.797851, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][15], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][15], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][15], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][15], 0);

	TelaEmpregos[playerid][16] = CreatePlayerTextDraw(playerid, 228.316635, 290.121124, "CARRO_FORTE");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][16], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][16], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][16], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][16], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][16], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][17] = CreatePlayerTextDraw(playerid, 351.833709, 289.606170, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][17], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][17], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][17], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][17], 0);

	TelaEmpregos[playerid][18] = CreatePlayerTextDraw(playerid, 227.966751, 236.859176, "ELETRICISTA");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][18], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][18], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][18], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][18], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][18], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][19] = CreatePlayerTextDraw(playerid, 352.166961, 234.422149, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][19], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][19], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][19], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][19], 0);

	TelaEmpregos[playerid][20] = CreatePlayerTextDraw(playerid, 427.499908, 79.555572, "X");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][20], 0.566250, 1.926666);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][20], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][20], -16776961);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][20], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][20], true);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][21] = CreatePlayerTextDraw(playerid, 228.316635, 313.822570, "CAMINHONEIRO");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][21], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][21], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][21], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, TelaEmpregos[playerid][21], true);
	PlayerTextDrawTextSize(playerid, TelaEmpregos[playerid][21], 18.0, 75.0);
	SelectTextDraw(playerid, 0x0000FFFF);

	TelaEmpregos[playerid][22] = CreatePlayerTextDraw(playerid, 352.583709, 313.236999, "NENHUM");
	PlayerTextDrawLetterSize(playerid, TelaEmpregos[playerid][22], 0.275415, 1.102223);
	PlayerTextDrawAlignment(playerid, TelaEmpregos[playerid][22], 1);
	PlayerTextDrawColor(playerid, TelaEmpregos[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, TelaEmpregos[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaEmpregos[playerid][22], 255);
	PlayerTextDrawFont(playerid, TelaEmpregos[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, TelaEmpregos[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, TelaEmpregos[playerid][22], 0);
}

stock CriarTDRegistro(playerid)
{
    /* 
	----------------------------
		Text Registro - Att
	----------------------------	
	*/
	TelaRegistro[playerid][0] = CreatePlayerTextDraw(playerid, 266.183166, 95.858436, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][0], 0.000000, 29.999973);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][0], 365.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][0], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][0], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][0], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][0], 0);

	TelaRegistro[playerid][1] = CreatePlayerTextDraw(playerid, 256.299804, 104.780624, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][1], 0.000000, 28.249967);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][1], 376.110107, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][1], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][1], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][1], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][1], 0);

	TelaRegistro[playerid][2] = CreatePlayerTextDraw(playerid, 254.716690, 94.033348, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][2], 19.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][2], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][2], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][2], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][2], 0);

	TelaRegistro[playerid][3] = CreatePlayerTextDraw(playerid, 358.666595, 94.233352, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][3], 19.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][3], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][3], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][3], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][3], 0);

	TelaRegistro[playerid][4] = CreatePlayerTextDraw(playerid, 254.266616, 345.896362, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][4], 19.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][4], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][4], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][4], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][4], 0);

	TelaRegistro[playerid][5] = CreatePlayerTextDraw(playerid, 358.716644, 345.777832, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][5], 19.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][5], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][5], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][5], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][5], 0);

	TelaRegistro[playerid][6] = CreatePlayerTextDraw(playerid, 251.716506, 90.733398, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][6], 31.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][6], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][6], 65535);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][6], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][6], 0);

	TelaRegistro[playerid][7] = CreatePlayerTextDraw(playerid, 349.949920, 90.751914, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][7], 31.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][7], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][7], 65535);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][7], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][7], 0);

	TelaRegistro[playerid][8] = CreatePlayerTextDraw(playerid, 251.599914, 332.744689, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][8], 31.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][8], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][8], 65535);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][8], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][8], 0);

	TelaRegistro[playerid][9] = CreatePlayerTextDraw(playerid, 349.783203, 332.600189, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][9], 31.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][9], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][9], 65535);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][9], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][9], 0);

	TelaRegistro[playerid][10] = CreatePlayerTextDraw(playerid, 266.183166, 98.958389, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][10], 0.000000, 29.166639);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][10], 365.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][10], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][10], 65535);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][10], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][10], 0);

	TelaRegistro[playerid][11] = CreatePlayerTextDraw(playerid, 258.499786, 112.028709, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][11], 0.000000, 26.225000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][11], 374.150146, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][11], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][11], -1061109505);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][11], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][11], 0);

	TelaRegistro[playerid][12] = CreatePlayerTextDraw(playerid, 293.283416, 96.248146, "New_Life");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][12], 0.371666, 1.413333);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][12], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][12], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][12], 0);

	TelaRegistro[playerid][13] = CreatePlayerTextDraw(playerid, 337.433380, 97.666625, "RP");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][13], 0.258749, 0.899999);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][13], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][13], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][13], 0);

	TelaRegistro[playerid][14] = CreatePlayerTextDraw(playerid, 290.549987, 116.329658, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][14], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][14], 48.000000, 55.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][14], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][14], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][14], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][14], 0);

	TelaRegistro[playerid][15] = CreatePlayerTextDraw(playerid, 280.399841, 104.540779, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][15], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][15], 68.780166, 78.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][15], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][15], -1061109505);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][15], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][15], 0);

	TelaRegistro[playerid][16] = CreatePlayerTextDraw(playerid, 300.633056, 119.577835, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][16], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][16], 29.000000, 34.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][16], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][16], -2139062017);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][16], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][16], 0);

	TelaRegistro[playerid][17] = CreatePlayerTextDraw(playerid, 293.549743, 135.796447, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][17], 43.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][17], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][17], -2139062017);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][17], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][17], 0);

	TelaRegistro[playerid][18] = CreatePlayerTextDraw(playerid, 315.300048, 170.533309, "DollynhO");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][18], 0.254164, 1.377037);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][18], 2);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][18], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][18], 0);

	TelaRegistro[playerid][19] = CreatePlayerTextDraw(playerid, 260.299896, 196.851715, "Senha:");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][19], 0.257916, 1.216297);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][19], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][19], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][19], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][19], 0);

	TelaRegistro[playerid][20] = CreatePlayerTextDraw(playerid, 266.499694, 211.622314, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][20], 0.000000, 1.309329);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][20], 363.832763, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][20], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][20], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][20], 0);

	TelaRegistro[playerid][21] = CreatePlayerTextDraw(playerid, 255.734207, 206.425643, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][21], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][21], 21.000000, 22.490011);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][21], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][21], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][21], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][21], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][21], 0);

	TelaRegistro[playerid][22] = CreatePlayerTextDraw(playerid, 356.367187, 206.425689, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][22], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][22], 19.340007, 22.309984);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][22], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][22], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][22], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][22], 0);

	TelaRegistro[playerid][23] = CreatePlayerTextDraw(playerid, 315.416839, 212.296356, "Digite_uma_senha");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][23], 0.178745, 1.039999);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][23], 2);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][23], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][23], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][23], 0);
	PlayerTextDrawSetSelectable(playerid, TelaRegistro[playerid][23], true);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][23], 22.0, 140.0);

	TelaRegistro[playerid][24] = CreatePlayerTextDraw(playerid, 259.883239, 227.962875, "Idade:");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][24], 0.257916, 1.216297);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][24], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][24], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][24], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][24], 0);

	TelaRegistro[playerid][25] = CreatePlayerTextDraw(playerid, 267.499603, 241.459487, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][25], 0.000000, 1.200672);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][25], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][25], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][25], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][25], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][25], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][25], 0);

	TelaRegistro[playerid][26] = CreatePlayerTextDraw(playerid, 256.016876, 236.462890, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][26], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][26], 18.000000, 21.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][26], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][26], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][26], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][26], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][26], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][26], 0);

	TelaRegistro[playerid][27] = CreatePlayerTextDraw(playerid, 357.266815, 236.462875, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][27], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][27], 18.000000, 21.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][27], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][27], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][27], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][27], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][27], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][27], 0);

	TelaRegistro[playerid][28] = CreatePlayerTextDraw(playerid, 316.866546, 241.533401, "Idade_do_personagem");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][28], 0.178745, 1.039999);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][28], 2);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][28], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][28], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][28], 0);
	PlayerTextDrawSetSelectable(playerid, TelaRegistro[playerid][28], true);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][28], 22.0, 140.0);

	TelaRegistro[playerid][29] = CreatePlayerTextDraw(playerid, 260.716552, 255.962951, "Sexo:");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][29], 0.257916, 1.216297);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][29], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][29], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][29], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][29], 0);

	TelaRegistro[playerid][30] = CreatePlayerTextDraw(playerid, 266.666290, 268.867065, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][30], 0.000000, 1.200672);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][30], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][30], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][30], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][30], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][30], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][30], 0);

	TelaRegistro[playerid][31] = CreatePlayerTextDraw(playerid, 256.266998, 263.962921, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][31], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][31], 18.000000, 21.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][31], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][31], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][31], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][31], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][31], 0);

	TelaRegistro[playerid][32] = CreatePlayerTextDraw(playerid, 356.800140, 263.925933, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][32], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][32], 18.000000, 21.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][32], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][32], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][32], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][32], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][32], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][32], 0);

	TelaRegistro[playerid][33] = CreatePlayerTextDraw(playerid, 317.083374, 268.496520, "Selecione_o_seu_sexo");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][33], 0.178745, 1.039999);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][33], 2);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][33], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][33], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][33], 0);
	PlayerTextDrawSetSelectable(playerid, TelaRegistro[playerid][33], true);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][33], 22.0, 140.0);

	TelaRegistro[playerid][34] = CreatePlayerTextDraw(playerid, 261.383331, 284.126068, "Skin:");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][34], 0.257916, 1.216297);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][34], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][34], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][34], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][34], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][34], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][34], 0);

	TelaRegistro[playerid][35] = CreatePlayerTextDraw(playerid, 267.333068, 297.022521, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][35], 0.000000, 1.174669);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][35], 365.500091, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][35], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][35], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][35], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][35], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][35], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][35], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][35], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][35], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][35], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][35], 0);

	TelaRegistro[playerid][36] = CreatePlayerTextDraw(playerid, 256.217590, 291.844177, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][36], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][36], 21.000000, 21.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][36], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][36], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][36], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][36], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][36], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][36], 0);

	TelaRegistro[playerid][37] = CreatePlayerTextDraw(playerid, 354.967590, 292.044189, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][37], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][37], 21.000000, 21.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][37], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][37], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][37], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][37], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][37], 4);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][37], 0);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][37], 0);

	TelaRegistro[playerid][38] = CreatePlayerTextDraw(playerid, 316.166442, 296.833496, "Digite_o_id_da_skin");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][38], 0.178745, 1.039999);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][38], 2);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][38], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][38], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][38], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][38], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][38], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][38], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][38], 0);
	PlayerTextDrawSetSelectable(playerid, TelaRegistro[playerid][38], true);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][38], 22.0, 140.0);

	TelaRegistro[playerid][39] = CreatePlayerTextDraw(playerid, 291.716735, 323.259307, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][39], 0.000000, 2.124999);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][39], 339.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][39], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][39], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][39], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][39], 65535);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][39], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][39], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][39], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][39], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][39], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][39], 0);

	TelaRegistro[playerid][40] = CreatePlayerTextDraw(playerid, 293.983398, 325.033325, "box");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][40], 0.000000, 1.624999);
	PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][40], 337.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][40], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][40], -1);
	PlayerTextDrawUseBox(playerid, TelaRegistro[playerid][40], 1);
	PlayerTextDrawBoxColor(playerid, TelaRegistro[playerid][40], 255);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][40], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][40], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][40], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][40], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][40], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][40], 0);

	TelaRegistro[playerid][41] = CreatePlayerTextDraw(playerid, 295.033264, 326.251922, "REGISTRAR");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][41], 0.234999, 1.076297);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][41], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][41], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][41], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][41], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][41], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][41], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][41], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][41], 0);
	PlayerTextDrawSetSelectable(playerid, TelaRegistro[playerid][41], true);
	//PlayerTextDrawTextSize(playerid, TelaRegistro[playerid][41], 10.0, 50.0);

	TelaRegistro[playerid][42] = CreatePlayerTextDraw(playerid, 268.166748, 350.740692, "Sua_segunda_vida_aqui!");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][42], 0.246665, 1.029631);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][42], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][42], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][42], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][42], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][42], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][42], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][42], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][42], 0);

	TelaRegistro[playerid][43] = CreatePlayerTextDraw(playerid, 360.249969, 341.925842, "v1.0");
	PlayerTextDrawLetterSize(playerid, TelaRegistro[playerid][43], 0.188749, 0.775551);
	PlayerTextDrawAlignment(playerid, TelaRegistro[playerid][43], 1);
	PlayerTextDrawColor(playerid, TelaRegistro[playerid][43], -1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][43], 0);
	PlayerTextDrawSetOutline(playerid, TelaRegistro[playerid][43], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaRegistro[playerid][43], 255);
	PlayerTextDrawFont(playerid, TelaRegistro[playerid][43], 1);
	PlayerTextDrawSetProportional(playerid, TelaRegistro[playerid][43], 1);
	PlayerTextDrawSetShadow(playerid, TelaRegistro[playerid][43], 0);
}

stock CriarTDLogin(playerid)
{	
    /* 
	----------------------------
			Text Login
	----------------------------	
	*/
	TelaLogin[playerid][0] = CreatePlayerTextDraw(playerid, 275.000030, 109.003395, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][0], 0.000000, 27.749982);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][0], 365.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][0], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][0], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][0], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][0], 0);

	TelaLogin[playerid][1] = CreatePlayerTextDraw(playerid, 263.750091, 117.299682, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][1], 0.000000, 25.833311);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][1], 377.069091, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][1], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][1], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][1], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][1], 0);

	TelaLogin[playerid][2] = CreatePlayerTextDraw(playerid, 262.450286, 106.796264, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][2], 18.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][2], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][2], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][2], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][2], 0);

	TelaLogin[playerid][3] = CreatePlayerTextDraw(playerid, 357.767120, 107.114784, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][3], 21.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][3], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][3], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][3], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][3], 0);

	TelaLogin[playerid][4] = CreatePlayerTextDraw(playerid, 358.550537, 337.837097, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][4], 20.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][4], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][4], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][4], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][4], 0);

	TelaLogin[playerid][5] = CreatePlayerTextDraw(playerid, 262.300628, 337.718688, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][5], 20.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][5], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][5], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][5], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][5], 0);

	TelaLogin[playerid][6] = CreatePlayerTextDraw(playerid, 258.033508, 102.374008, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][6], 32.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][6], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][6], 65535);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][6], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][6], 0);

	TelaLogin[playerid][7] = CreatePlayerTextDraw(playerid, 350.699920, 102.529594, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][7], 32.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][7], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][7], 65535);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][7], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][7], 0);

	TelaLogin[playerid][8] = CreatePlayerTextDraw(playerid, 350.483062, 326.940612, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][8], 32.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][8], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][8], 65535);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][8], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][8], 0);

	TelaLogin[playerid][9] = CreatePlayerTextDraw(playerid, 257.966735, 326.777679, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][9], 32.000000, 37.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][9], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][9], 65535);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][9], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][9], 0);

	TelaLogin[playerid][10] = CreatePlayerTextDraw(playerid, 273.999969, 110.703369, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][10], 0.000000, 27.229307);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][10], 364.000183, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][10], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][10], 65535);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][10], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][10], 0);

	TelaLogin[playerid][11] = CreatePlayerTextDraw(playerid, 264.916717, 124.147766, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][11], 0.000000, 24.291656);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][11], 376.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][11], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][11], -1061109505);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][11], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][11], 0);

	TelaLogin[playerid][12] = CreatePlayerTextDraw(playerid, 298.333374, 129.222076, "ld_pool:ball");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][12], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][12], 45.000000, 52.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][12], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][12], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][12], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][12], 0);

	TelaLogin[playerid][13] = CreatePlayerTextDraw(playerid, 289.449645, 119.436943, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][13], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][13], 63.000000, 71.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][13], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][13], -1061109505);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][13], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][13], 0);

	TelaLogin[playerid][14] = CreatePlayerTextDraw(playerid, 289.449645, 119.436943, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][14], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][14], 63.000000, 71.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][14], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][14], -1061109505);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][14], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][14], 0);

	TelaLogin[playerid][15] = CreatePlayerTextDraw(playerid, 289.449645, 119.436943, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][15], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][15], 63.000000, 71.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][15], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][15], -1061109505);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][15], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][15], 0);

	TelaLogin[playerid][16] = CreatePlayerTextDraw(playerid, 308.166412, 131.081329, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][16], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][16], 25.000000, 31.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][16], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][16], -2139062017);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][16], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][16], 0);

	TelaLogin[playerid][17] = CreatePlayerTextDraw(playerid, 298.599700, 144.925857, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][17], 45.000000, 38.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][17], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][17], -2139062017);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][17], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][17], 0);

	TelaLogin[playerid][18] = CreatePlayerTextDraw(playerid, 295.000030, 107.037025, "New_Life");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][18], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][18], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][18], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][18], 0);

	TelaLogin[playerid][19] = CreatePlayerTextDraw(playerid, 341.266662, 109.392570, "RP");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][19], 0.243750, 0.874073);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][19], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][19], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][19], 0);

	TelaLogin[playerid][20] = CreatePlayerTextDraw(playerid, 277.233184, 346.392608, "Sua_segunda_vida_aqui!");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][20], 0.234583, 0.962221);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][20], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][20], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][20], 0);

	TelaLogin[playerid][21] = CreatePlayerTextDraw(playerid, 319.050109, 179.948074, "Guilherme_Oliveira");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][21], 0.308750, 1.340741);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][21], 2);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][21], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][21], 0);

	TelaLogin[playerid][22] = CreatePlayerTextDraw(playerid, 270.333099, 201.270401, "Senha:");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][22], 0.237083, 1.081482);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][22], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][22], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][22], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][22], 0);

	TelaLogin[playerid][23] = CreatePlayerTextDraw(playerid, 277.083312, 213.333328, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][23], 0.000000, 1.208330);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][23], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][23], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][23], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][23], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][23], 0);

	TelaLogin[playerid][24] = CreatePlayerTextDraw(playerid, 264.433288, 208.274154, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][24], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][24], 22.000000, 21.110002);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][24], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][24], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][24], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][24], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][24], 0);

	TelaLogin[playerid][25] = CreatePlayerTextDraw(playerid, 354.483306, 208.337188, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][25], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][25], 22.000000, 21.110002);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][25], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][25], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][25], 4);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][25], 0);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][25], 0);

	TelaLogin[playerid][26] = CreatePlayerTextDraw(playerid, 319.216430, 212.840866, "Digite_a_sua_senha_aqui!");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][26], 0.237083, 1.081482);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][26], 2);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][26], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][26], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][26], 0);
	PlayerTextDrawSetSelectable(playerid, TelaLogin[playerid][26], true);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][26], 25.0, 140.0);

	TelaLogin[playerid][27] = CreatePlayerTextDraw(playerid, 290.049652, 332.974334, "Esqueceu_sua_senha?");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][27], 0.193332, 0.894815);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][27], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][27], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][27], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][27], 0);
	PlayerTextDrawSetSelectable(playerid, TelaLogin[playerid][27], true);

	TelaLogin[playerid][28] = CreatePlayerTextDraw(playerid, 292.450317, 256.689697, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][28], 0.000000, 1.916666);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][28], 347.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][28], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][28], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][28], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][28], 65535);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][28], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][28], 0);

	TelaLogin[playerid][29] = CreatePlayerTextDraw(playerid, 293.950408, 258.389801, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][29], 0.000000, 1.487334);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][29], 345.130126, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][29], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][29], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][29], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][29], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][29], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][29], 0);

	TelaLogin[playerid][30] = CreatePlayerTextDraw(playerid, 319.983428, 256.333374, "Logar");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][30], 0.383332, 1.516296);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][30], 2);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][30], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][30], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][30], 0);
	PlayerTextDrawSetSelectable(playerid, TelaLogin[playerid][30], true);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][30], 30.0, 140.0);

	TelaLogin[playerid][31] = CreatePlayerTextDraw(playerid, 298.700012, 287.800903, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][31], 0.000000, 1.666666);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][31], 337.499847, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][31], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][31], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][31], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][31], -16776961);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][31], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][31], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][31], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][31], 0);

	TelaLogin[playerid][32] = CreatePlayerTextDraw(playerid, 299.800079, 288.900970, "box");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][32], 0.000000, 1.416666);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][32], 336.760223, 0.000000);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][32], 1);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][32], -1);
	PlayerTextDrawUseBox(playerid, TelaLogin[playerid][32], 1);
	PlayerTextDrawBoxColor(playerid, TelaLogin[playerid][32], 255);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][32], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][32], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][32], 0);

	TelaLogin[playerid][33] = CreatePlayerTextDraw(playerid, 318.033508, 288.281585, "Sair");
	PlayerTextDrawLetterSize(playerid, TelaLogin[playerid][33], 0.383332, 1.516296);
	PlayerTextDrawAlignment(playerid, TelaLogin[playerid][33], 2);
	PlayerTextDrawColor(playerid, TelaLogin[playerid][33], -1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, TelaLogin[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, TelaLogin[playerid][33], 255);
	PlayerTextDrawFont(playerid, TelaLogin[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, TelaLogin[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, TelaLogin[playerid][33], 0);
	PlayerTextDrawSetSelectable(playerid, TelaLogin[playerid][33], true);
	PlayerTextDrawTextSize(playerid, TelaLogin[playerid][33], 30.0, 140.0);
}	


stock CriarTDHud(playerid)
{
	/* 
	----------------------------
		  Text HUD.v2 - Att
	----------------------------	
	*/

	Hud[playerid][0] = CreatePlayerTextDraw(playerid, 458.333190, 15.259263, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][0], 0.000000, 11.583333);
	PlayerTextDrawTextSize(playerid, Hud[playerid][0], 636.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][0], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][0], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][0], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][0], 0);

	Hud[playerid][1] = CreatePlayerTextDraw(playerid, 458.200073, 15.570322, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][1], 0.000000, 1.713997);
	PlayerTextDrawTextSize(playerid, Hud[playerid][1], 636.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][1], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][1], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][1], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][1], 0);

	Hud[playerid][2] = CreatePlayerTextDraw(playerid, 455.433441, 10.114783, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][2], 24.000000, 25.419986);
	PlayerTextDrawAlignment(playerid, Hud[playerid][2], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][2], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][2], 0);

	Hud[playerid][3] = CreatePlayerTextDraw(playerid, 456.466796, 11.333305, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][3], 22.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][3], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][3], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][3], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][3], 0);

	Hud[playerid][4] = CreatePlayerTextDraw(playerid, 477.950225, 18.188995, "Guilherme_Oliveira");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][4], 0.213743, 1.045181);
	PlayerTextDrawAlignment(playerid, Hud[playerid][4], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][4], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][4], 0);

	Hud[playerid][5] = CreatePlayerTextDraw(playerid, 553.982910, 16.296323, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][5], 0.000000, 1.416664);
	PlayerTextDrawTextSize(playerid, Hud[playerid][5], 552.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][5], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][5], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][5], 0);

	Hud[playerid][6] = CreatePlayerTextDraw(playerid, 558.241027, 18.188995, "Desempregado");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][6], 0.213743, 1.045181);
	PlayerTextDrawAlignment(playerid, Hud[playerid][6], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][6], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][6], 0);

	Hud[playerid][7] = CreatePlayerTextDraw(playerid, 453.333374, 11.914813, "");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][7], 28.000000, 30.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][7], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][7], 0);
	PlayerTextDrawFont(playerid, Hud[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][7], 0);
	PlayerTextDrawSetPreviewModel(playerid, Hud[playerid][7], 162);
	PlayerTextDrawSetPreviewRot(playerid, Hud[playerid][7], 0.000000, 0.000000, 0.000000, 1.000000);

	Hud[playerid][8] = CreatePlayerTextDraw(playerid, 462.000305, 30.233287, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][8], 0.000000, 0.083332);
	PlayerTextDrawTextSize(playerid, Hud[playerid][8], 572.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][8], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][8], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][8], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][8], 0);

	Hud[playerid][9] = CreatePlayerTextDraw(playerid, 458.899993, 34.044425, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][9], 0.000000, 5.416666);
	PlayerTextDrawTextSize(playerid, Hud[playerid][9], 612.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][9], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][9], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][9], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][9], 0);

	Hud[playerid][10] = CreatePlayerTextDraw(playerid, 461.767089, 38.329589, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][10], 0.000000, 1.291666);
	PlayerTextDrawTextSize(playerid, Hud[playerid][10], 541.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][10], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][10], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][10], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][10], 0);

	Hud[playerid][11] = CreatePlayerTextDraw(playerid, 497.033325, 29.014801, "(");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][11], 0.252499, 2.906661);
	PlayerTextDrawAlignment(playerid, Hud[playerid][11], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][11], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][11], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][11], 0);

	Hud[playerid][12] = CreatePlayerTextDraw(playerid, 465.283172, 42.003688, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][12], 0.000000, 0.125000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][12], 463.799987, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][12], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][12], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][12], 0);

	Hud[playerid][13] = CreatePlayerTextDraw(playerid, 466.583251, 41.303699, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][13], 0.000000, 0.375000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][13], 466.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][13], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][13], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][13], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][13], 0);

	Hud[playerid][14] = CreatePlayerTextDraw(playerid, 468.666564, 41.822193, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][14], 0.000000, 0.479665);
	PlayerTextDrawTextSize(playerid, Hud[playerid][14], 467.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][14], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][14], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][14], 0);

	Hud[playerid][15] = CreatePlayerTextDraw(playerid, 469.666625, 41.822193, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][15], 0.000000, 0.514665);
	PlayerTextDrawTextSize(playerid, Hud[playerid][15], 468.000061, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][15], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][15], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][15], 0);

	Hud[playerid][16] = CreatePlayerTextDraw(playerid, 470.666687, 41.822193, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][16], 0.000000, 0.472665);
	PlayerTextDrawTextSize(playerid, Hud[playerid][16], 469.000122, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][16], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][16], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][16], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][16], 0);

	Hud[playerid][17] = CreatePlayerTextDraw(playerid, 471.183532, 41.403697, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][17], 0.000000, 0.347333);
	PlayerTextDrawTextSize(playerid, Hud[playerid][17], 471.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][17], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][17], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][17], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][17], 0);

	Hud[playerid][18] = CreatePlayerTextDraw(playerid, 473.067016, 41.903690, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][18], 0.000000, 0.180665);
	PlayerTextDrawTextSize(playerid, Hud[playerid][18], 472.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][18], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][18], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][18], 0);

	Hud[playerid][19] = CreatePlayerTextDraw(playerid, 474.667114, 41.903690, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][19], 0.000000, 0.180665);
	PlayerTextDrawTextSize(playerid, Hud[playerid][19], 472.209228, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][19], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][19], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][19], 0);

	Hud[playerid][20] = CreatePlayerTextDraw(playerid, 476.266784, 39.029621, "100");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][20], 0.186250, 1.060742);
	PlayerTextDrawAlignment(playerid, Hud[playerid][20], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][20], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][20], 0);

	Hud[playerid][21] = CreatePlayerTextDraw(playerid, 488.483398, 41.285167, "%");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][21], 0.143748, 0.692592);
	PlayerTextDrawAlignment(playerid, Hud[playerid][21], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][21], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][21], 0);

	Hud[playerid][22] = CreatePlayerTextDraw(playerid, 504.899932, 40.822231, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][22], 0.000000, 0.046851);
	PlayerTextDrawTextSize(playerid, Hud[playerid][22], 504.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][22], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][22], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][22], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][22], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][22], 0);

	Hud[playerid][23] = CreatePlayerTextDraw(playerid, 505.649963, 42.377788, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][23], 0.000000, 0.421851);
	PlayerTextDrawTextSize(playerid, Hud[playerid][23], 508.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][23], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][23], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][23], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][23], 0);

	Hud[playerid][24] = CreatePlayerTextDraw(playerid, 510.000244, 40.822231, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][24], 0.000000, 0.046851);
	PlayerTextDrawTextSize(playerid, Hud[playerid][24], 508.870086, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][24], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][24], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][24], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][24], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][24], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][24], 0);

	Hud[playerid][25] = CreatePlayerTextDraw(playerid, 512.100219, 39.029621, "100");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][25], 0.186250, 1.060742);
	PlayerTextDrawAlignment(playerid, Hud[playerid][25], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][25], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][25], 0);

	Hud[playerid][26] = CreatePlayerTextDraw(playerid, 524.816711, 41.622211, "%");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][26], 0.143748, 0.692592);
	PlayerTextDrawAlignment(playerid, Hud[playerid][26], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][26], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][26], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][26], 0);

	Hud[playerid][27] = CreatePlayerTextDraw(playerid, 552.060363, 38.329589, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][27], 0.000000, 1.291666);
	PlayerTextDrawTextSize(playerid, Hud[playerid][27], 631.277954, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][27], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][27], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][27], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][27], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][27], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][27], 0);

	Hud[playerid][28] = CreatePlayerTextDraw(playerid, 561.851257, 41.922218, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][28], 0.000000, 0.226333);
	PlayerTextDrawTextSize(playerid, Hud[playerid][28], 562.701049, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][28], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][28], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][28], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][28], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][28], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][28], 0);

	Hud[playerid][29] = CreatePlayerTextDraw(playerid, 555.733642, 42.103679, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][29], 0.000000, 0.226333);
	PlayerTextDrawTextSize(playerid, Hud[playerid][29], 554.229248, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][29], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][29], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][29], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][29], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][29], 0);

	Hud[playerid][30] = CreatePlayerTextDraw(playerid, 556.533447, 41.103694, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][30], 0.000000, 0.403999);
	PlayerTextDrawTextSize(playerid, Hud[playerid][30], 556.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][30], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][30], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][30], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][30], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][30], 0);

	Hud[playerid][31] = CreatePlayerTextDraw(playerid, 557.833129, 40.403705, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][31], 0.000000, 0.570333);
	PlayerTextDrawTextSize(playerid, Hud[playerid][31], 560.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][31], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][31], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][31], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][31], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][31], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][31], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][31], 0);

	Hud[playerid][32] = CreatePlayerTextDraw(playerid, 561.882507, 41.122222, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][32], 0.000000, 0.403665);
	PlayerTextDrawTextSize(playerid, Hud[playerid][32], 562.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][32], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][32], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][32], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][32], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][32], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][32], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][32], 0);

	Hud[playerid][33] = CreatePlayerTextDraw(playerid, 554.976928, 43.851837, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][33], 0.000000, -0.166666);
	PlayerTextDrawTextSize(playerid, Hud[playerid][33], 593.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][33], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][33], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][33], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][33], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][33], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][33], 0);

	Hud[playerid][34] = CreatePlayerTextDraw(playerid, 567.832824, 38.192581, "100");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][34], 0.186250, 1.060742);
	PlayerTextDrawAlignment(playerid, Hud[playerid][34], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][34], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][34], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][34], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][34], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][34], 0);

	Hud[playerid][35] = CreatePlayerTextDraw(playerid, 579.883056, 40.485187, "%");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][35], 0.143748, 0.692592);
	PlayerTextDrawAlignment(playerid, Hud[playerid][35], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][35], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][35], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][35], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][35], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][35], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][35], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][35], 0);

	Hud[playerid][36] = CreatePlayerTextDraw(playerid, 590.098876, 29.533319, "(");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][36], 0.252499, 2.906661);
	PlayerTextDrawAlignment(playerid, Hud[playerid][36], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][36], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][36], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][36], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][36], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][36], 0);

	Hud[playerid][37] = CreatePlayerTextDraw(playerid, 604.982543, 38.311115, "100");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][37], 0.186250, 1.060742);
	PlayerTextDrawAlignment(playerid, Hud[playerid][37], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][37], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][37], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][37], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][37], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][37], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][37], 0);

	Hud[playerid][38] = CreatePlayerTextDraw(playerid, 600.183105, 39.574039, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][38], 0.000000, 0.875002);
	PlayerTextDrawTextSize(playerid, Hud[playerid][38], 599.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][38], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][38], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][38], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][38], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][38], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][38], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][38], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][38], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][38], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][38], 0);

	Hud[playerid][39] = CreatePlayerTextDraw(playerid, 597.266357, 42.185165, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][39], 0.000000, -0.124995);
	PlayerTextDrawTextSize(playerid, Hud[playerid][39], 602.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][39], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][39], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][39], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][39], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][39], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][39], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][39], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][39], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][39], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][39], 0);

	Hud[playerid][40] = CreatePlayerTextDraw(playerid, 597.666259, 43.985137, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][40], 0.000000, -0.211996);
	PlayerTextDrawTextSize(playerid, Hud[playerid][40], 601.120849, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][40], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][40], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][40], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][40], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][40], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][40], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][40], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][40], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][40], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][40], 0);

	Hud[playerid][41] = CreatePlayerTextDraw(playerid, 597.966186, 45.485115, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][41], 0.000000, -0.211996);
	PlayerTextDrawTextSize(playerid, Hud[playerid][41], 600.880737, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][41], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][41], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][41], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][41], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][41], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][41], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][41], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][41], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][41], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][41], 0);

	Hud[playerid][42] = CreatePlayerTextDraw(playerid, 598.366088, 47.085090, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][42], 0.000000, -0.146329);
	PlayerTextDrawTextSize(playerid, Hud[playerid][42], 600.239013, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][42], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][42], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][42], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][42], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][42], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][42], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][42], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][42], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][42], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][42], 0);

	Hud[playerid][43] = CreatePlayerTextDraw(playerid, 599.082641, 49.177696, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][43], 0.000000, -0.201330);
	PlayerTextDrawTextSize(playerid, Hud[playerid][43], 599.438842, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][43], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][43], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][43], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][43], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][43], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][43], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][43], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][43], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][43], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][43], 0);

	Hud[playerid][44] = CreatePlayerTextDraw(playerid, 617.382934, 40.677818, "%");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][44], 0.143748, 0.692592);
	PlayerTextDrawAlignment(playerid, Hud[playerid][44], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][44], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][44], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][44], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][44], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][44], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][44], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][44], 0);

	Hud[playerid][45] = CreatePlayerTextDraw(playerid, 461.416687, 57.570327, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][45], 0.000000, 1.505663);
	PlayerTextDrawTextSize(playerid, Hud[playerid][45], 632.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][45], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][45], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][45], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][45], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][45], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][45], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][45], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][45], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][45], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][45], 0);

	Hud[playerid][46] = CreatePlayerTextDraw(playerid, 465.216644, 61.270343, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][46], 0.000000, 0.622999);
	PlayerTextDrawTextSize(playerid, Hud[playerid][46], 477.200012, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][46], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][46], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][46], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][46], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][46], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][46], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][46], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][46], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][46], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][46], 0);

	Hud[playerid][47] = CreatePlayerTextDraw(playerid, 466.299987, 62.455535, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][47], 0.000000, 0.387663);
	PlayerTextDrawTextSize(playerid, Hud[playerid][47], 476.030029, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][47], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][47], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][47], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][47], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][47], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][47], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][47], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][47], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][47], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][47], 0);

	Hud[playerid][48] = CreatePlayerTextDraw(playerid, 466.716735, 62.870319, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][48], 0.000000, 0.581332);
	PlayerTextDrawTextSize(playerid, Hud[playerid][48], 477.700042, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][48], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][48], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][48], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][48], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][48], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][48], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][48], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][48], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][48], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][48], 0);

	Hud[playerid][49] = CreatePlayerTextDraw(playerid, 477.816680, 66.166648, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][49], 0.000000, 0.009328);
	PlayerTextDrawTextSize(playerid, Hud[playerid][49], 484.100067, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][49], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][49], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][49], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][49], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][49], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][49], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][49], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][49], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][49], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][49], 0);

	Hud[playerid][50] = CreatePlayerTextDraw(playerid, 481.933380, 60.133312, "50");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][50], 0.210831, 0.936294);
	PlayerTextDrawAlignment(playerid, Hud[playerid][50], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][50], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][50], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][50], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][50], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][50], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][50], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][50], 0);

	Hud[playerid][51] = CreatePlayerTextDraw(playerid, 543.015380, 49.755523, ")");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][51], 0.252499, 2.906661);
	PlayerTextDrawAlignment(playerid, Hud[playerid][51], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][51], 858993663);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][51], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][51], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][51], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][51], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][51], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][51], 0);

	Hud[playerid][52] = CreatePlayerTextDraw(playerid, 552.966491, 61.314769, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][52], 0.000000, 0.664663);
	PlayerTextDrawTextSize(playerid, Hud[playerid][52], 566.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][52], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][52], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][52], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][52], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][52], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][52], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][52], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][52], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][52], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][52], 0);

	Hud[playerid][53] = CreatePlayerTextDraw(playerid, 551.983398, 62.755546, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][53], 0.000000, -0.072336);
	PlayerTextDrawTextSize(playerid, Hud[playerid][53], 567.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][53], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][53], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][53], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][53], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][53], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][53], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][53], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][53], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][53], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][53], 0);

	Hud[playerid][54] = CreatePlayerTextDraw(playerid, 552.917114, 62.881484, "1234");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][54], 0.162082, 0.744445);
	PlayerTextDrawAlignment(playerid, Hud[playerid][54], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][54], 255);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][54], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][54], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][54], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][54], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][54], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][54], 0);

	Hud[playerid][55] = CreatePlayerTextDraw(playerid, 569.966674, 60.233322, "123456");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][55], 0.210831, 0.936294);
	PlayerTextDrawAlignment(playerid, Hud[playerid][55], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][55], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][55], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][55], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][55], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][55], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][55], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][55], 0);

	Hud[playerid][56] = CreatePlayerTextDraw(playerid, 469.333312, 78.829605, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][56], 0.000000, 1.398993);
	PlayerTextDrawTextSize(playerid, Hud[playerid][56], 537.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][56], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][56], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][56], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][56], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][56], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][56], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][56], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][56], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][56], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][56], 0);

	Hud[playerid][57] = CreatePlayerTextDraw(playerid, 472.098876, 84.863052, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][57], 0.000000, -0.476662);
	PlayerTextDrawTextSize(playerid, Hud[playerid][57], 480.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][57], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][57], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][57], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][57], 589505535);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][57], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][57], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][57], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][57], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][57], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][57], 0);

	Hud[playerid][58] = CreatePlayerTextDraw(playerid, 472.482635, 83.348144, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][58], 0.000000, -0.148329);
	PlayerTextDrawTextSize(playerid, Hud[playerid][58], 480.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][58], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][58], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][58], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][58], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][58], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][58], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][58], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][58], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][58], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][58], 0);

	Hud[playerid][59] = CreatePlayerTextDraw(playerid, 472.482635, 84.248130, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][59], 0.000000, -0.148329);
	PlayerTextDrawTextSize(playerid, Hud[playerid][59], 480.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][59], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][59], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][59], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][59], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][59], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][59], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][59], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][59], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][59], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][59], 0);

	Hud[playerid][60] = CreatePlayerTextDraw(playerid, 473.349212, 86.277793, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][60], 0.000000, -0.314994);
	PlayerTextDrawTextSize(playerid, Hud[playerid][60], 476.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][60], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][60], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][60], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][60], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][60], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][60], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][60], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][60], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][60], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][60], 0);

	Hud[playerid][61] = CreatePlayerTextDraw(playerid, 474.182525, 86.796310, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][61], 0.000000, -0.077329);
	PlayerTextDrawTextSize(playerid, Hud[playerid][61], 474.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][61], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][61], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][61], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][61], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][61], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][61], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][61], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][61], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][61], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][61], 0);

	Hud[playerid][62] = CreatePlayerTextDraw(playerid, 473.182464, 86.796310, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][62], 0.000000, -0.077329);
	PlayerTextDrawTextSize(playerid, Hud[playerid][62], 472.999938, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][62], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][62], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][62], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][62], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][62], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][62], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][62], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][62], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][62], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][62], 0);

	Hud[playerid][63] = CreatePlayerTextDraw(playerid, 473.382476, 88.563018, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][63], 0.000000, -0.133329);
	PlayerTextDrawTextSize(playerid, Hud[playerid][63], 473.519348, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][63], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][63], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][63], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][63], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][63], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][63], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][63], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][63], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][63], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][63], 0);

	Hud[playerid][64] = CreatePlayerTextDraw(playerid, 482.349182, 84.003715, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][64], 0.000000, -0.195662);
	PlayerTextDrawTextSize(playerid, Hud[playerid][64], 481.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][64], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][64], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][64], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][64], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][64], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][64], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][64], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][64], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][64], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][64], 0);

	Hud[playerid][65] = CreatePlayerTextDraw(playerid, 484.583312, 79.555534, "30");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][65], 0.242500, 1.076295);
	PlayerTextDrawAlignment(playerid, Hud[playerid][65], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][65], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][65], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][65], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][65], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][65], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][65], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][65], 0);

	Hud[playerid][66] = CreatePlayerTextDraw(playerid, 496.448760, 76.737007, "/");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][66], 0.293332, 1.542961);
	PlayerTextDrawAlignment(playerid, Hud[playerid][66], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][66], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][66], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][66], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][66], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][66], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][66], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][66], 0);

	Hud[playerid][67] = CreatePlayerTextDraw(playerid, 501.433258, 79.174064, "10000");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][67], 0.242500, 1.076295);
	PlayerTextDrawAlignment(playerid, Hud[playerid][67], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][67], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][67], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][67], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][67], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][67], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][67], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][67], 0);

	Hud[playerid][68] = CreatePlayerTextDraw(playerid, 548.432189, 78.948135, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][68], 0.000000, 1.398993);
	PlayerTextDrawTextSize(playerid, Hud[playerid][68], 630.899291, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][68], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][68], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][68], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][68], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][68], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][68], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][68], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][68], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][68], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][68], 0);

	Hud[playerid][69] = CreatePlayerTextDraw(playerid, 547.916748, 76.703689, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][69], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][69], 15.000000, 17.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][69], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][69], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][69], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][69], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][69], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][69], 4);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][69], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][69], 0);

	Hud[playerid][70] = CreatePlayerTextDraw(playerid, 554.117492, 80.211135, "L");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][70], 0.221661, 1.003702);
	PlayerTextDrawAlignment(playerid, Hud[playerid][70], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][70], 255);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][70], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][70], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][70], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][70], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][70], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][70], 0);

	Hud[playerid][71] = CreatePlayerTextDraw(playerid, 478.315765, 96.933357, "box");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][71], 0.000000, 2.023993);
	PlayerTextDrawTextSize(playerid, Hud[playerid][71], 620.298706, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][71], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][71], -1);
	PlayerTextDrawUseBox(playerid, Hud[playerid][71], 1);
	PlayerTextDrawBoxColor(playerid, Hud[playerid][71], 252645375);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][71], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][71], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][71], 353703423);
	PlayerTextDrawFont(playerid, Hud[playerid][71], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][71], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][71], 0);

	Hud[playerid][72] = CreatePlayerTextDraw(playerid, 480.833404, 95.629646, "ID_FIXO");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][72], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][72], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][72], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][72], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][72], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][72], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][72], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][72], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][72], 0);

	Hud[playerid][73] = CreatePlayerTextDraw(playerid, 485.000000, 103.925949, "1500");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][73], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][73], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][73], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][73], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][73], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][73], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][73], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][73], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][73], 0);

	Hud[playerid][74] = CreatePlayerTextDraw(playerid, 562.500183, 81.774047, "Verona_Beach");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][74], 0.192497, 0.848149);
	PlayerTextDrawAlignment(playerid, Hud[playerid][74], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][74], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][74], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][74], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][74], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][74], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][74], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][74], 0);

	Hud[playerid][75] = CreatePlayerTextDraw(playerid, 512.400146, 95.766685, "FPS");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][75], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][75], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][75], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][75], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][75], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][75], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][75], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][75], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][75], 0);

	Hud[playerid][76] = CreatePlayerTextDraw(playerid, 512.816833, 103.866561, "100");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][76], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][76], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][76], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][76], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][76], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][76], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][76], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][76], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][76], 0);

	Hud[playerid][77] = CreatePlayerTextDraw(playerid, 531.095581, 95.766685, "ESTRELAS");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][77], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][77], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][77], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][77], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][77], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][77], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][77], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][77], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][77], 0);

	Hud[playerid][78] = CreatePlayerTextDraw(playerid, 534.111633, 102.666580, "1000");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][78], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][78], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][78], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][78], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][78], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][78], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][78], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][78], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][78], 0);

	Hud[playerid][79] = CreatePlayerTextDraw(playerid, 566.386962, 95.766685, "VIP");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][79], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][79], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][79], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][79], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][79], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][79], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][79], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][79], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][79], 0);

	Hud[playerid][80] = CreatePlayerTextDraw(playerid, 567.386718, 103.166572, "30");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][80], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][80], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][80], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][80], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][80], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][80], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][80], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][80], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][80], 0);

	Hud[playerid][81] = CreatePlayerTextDraw(playerid, 582.682983, 95.766685, "NEW_COIN");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][81], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][81], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][81], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][81], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][81], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][81], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][81], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][81], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][81], 0);

	Hud[playerid][82] = CreatePlayerTextDraw(playerid, 582.682983, 103.366569, "12345678");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][82], 0.197080, 0.884441);
	PlayerTextDrawAlignment(playerid, Hud[playerid][82], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][82], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][82], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][82], 0);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][82], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][82], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][82], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][82], 0);
	return 1;
}
stock CriarTDLogo()
{
    /*
	----------------------------
			Text Logo - Att
	----------------------------	
	*/

	logoserver[0] = TextDrawCreate(284.766845, 23.555612, "N");
	TextDrawLetterSize(logoserver[0], 0.521664, 2.066663);
	TextDrawAlignment(logoserver[0], 1);
	TextDrawColor(logoserver[0], -1);
	TextDrawSetShadow(logoserver[0], 0);
	TextDrawSetOutline(logoserver[0], 0);
	TextDrawBackgroundColor(logoserver[0], 255);
	TextDrawFont(logoserver[0], 1);
	TextDrawSetProportional(logoserver[0], 1);
	TextDrawSetShadow(logoserver[0], 0);

	logoserver[1] = TextDrawCreate(297.500366, 26.366695, "ew");
	TextDrawLetterSize(logoserver[1], 0.436666, 1.708889);
	TextDrawAlignment(logoserver[1], 1);
	TextDrawColor(logoserver[1], -1);
	TextDrawSetShadow(logoserver[1], 0);
	TextDrawSetOutline(logoserver[1], 0);
	TextDrawBackgroundColor(logoserver[1], 255);
	TextDrawFont(logoserver[1], 1);
	TextDrawSetProportional(logoserver[1], 1);
	TextDrawSetShadow(logoserver[1], 0);

	logoserver[2] = TextDrawCreate(317.417144, 24.118644, "L");
	TextDrawLetterSize(logoserver[2], 0.521664, 2.066663);
	TextDrawAlignment(logoserver[2], 1);
	TextDrawColor(logoserver[2], 65535);
	TextDrawSetShadow(logoserver[2], 0);
	TextDrawSetOutline(logoserver[2], 0);
	TextDrawBackgroundColor(logoserver[2], 255);
	TextDrawFont(logoserver[2], 1);
	TextDrawSetProportional(logoserver[2], 1);
	TextDrawSetShadow(logoserver[2], 0);

	logoserver[3] = TextDrawCreate(325.400238, 26.748197, "ife");
	TextDrawLetterSize(logoserver[3], 0.436666, 1.708889);
	TextDrawAlignment(logoserver[3], 1);
	TextDrawColor(logoserver[3], 65535);
	TextDrawSetShadow(logoserver[3], 0);
	TextDrawSetOutline(logoserver[3], 0);
	TextDrawBackgroundColor(logoserver[3], 255);
	TextDrawFont(logoserver[3], 1);
	TextDrawSetProportional(logoserver[3], 1);
	TextDrawSetShadow(logoserver[3], 0);

	logoserver[4] = TextDrawCreate(302.766693, 39.848072, "Role");
	TextDrawLetterSize(logoserver[4], 0.257499, 0.988147);
	TextDrawAlignment(logoserver[4], 1);
	TextDrawColor(logoserver[4], -1);
	TextDrawSetShadow(logoserver[4], 0);
	TextDrawSetOutline(logoserver[4], 0);
	TextDrawBackgroundColor(logoserver[4], 255);
	TextDrawFont(logoserver[4], 0);
	TextDrawSetProportional(logoserver[4], 1);
	TextDrawSetShadow(logoserver[4], 0);

	logoserver[5] = TextDrawCreate(285.266632, 41.185237, "]]");
	TextDrawLetterSize(logoserver[5], 0.246665, 0.894815);
	TextDrawAlignment(logoserver[5], 1);
	TextDrawColor(logoserver[5], 65535);
	TextDrawSetShadow(logoserver[5], 0);
	TextDrawSetOutline(logoserver[5], 0);
	TextDrawBackgroundColor(logoserver[5], 255);
	TextDrawFont(logoserver[5], 2);
	TextDrawSetProportional(logoserver[5], 1);
	TextDrawSetShadow(logoserver[5], 0);

	logoserver[6] = TextDrawCreate(326.752532, 41.185237, "]]");
	TextDrawLetterSize(logoserver[6], 0.246665, 0.894815);
	TextDrawAlignment(logoserver[6], 1);
	TextDrawColor(logoserver[6], -1);
	TextDrawSetShadow(logoserver[6], 0);
	TextDrawSetOutline(logoserver[6], 0);
	TextDrawBackgroundColor(logoserver[6], 255);
	TextDrawFont(logoserver[6], 2);
	TextDrawSetProportional(logoserver[6], 1);
	TextDrawSetShadow(logoserver[6], 0);

	logoserver[7] = TextDrawCreate(289.752777, 49.618606, "]]]");
	TextDrawLetterSize(logoserver[7], 0.246665, 0.894815);
	TextDrawAlignment(logoserver[7], 1);
	TextDrawColor(logoserver[7], -1);
	TextDrawSetShadow(logoserver[7], 0);
	TextDrawSetOutline(logoserver[7], 0);
	TextDrawBackgroundColor(logoserver[7], 255);
	TextDrawFont(logoserver[7], 2);
	TextDrawSetProportional(logoserver[7], 1);
	TextDrawSetShadow(logoserver[7], 0);

	logoserver[8] = TextDrawCreate(314.054260, 49.418609, "]]]");
	TextDrawLetterSize(logoserver[8], 0.246665, 0.894815);
	TextDrawAlignment(logoserver[8], 1);
	TextDrawColor(logoserver[8], 65535);
	TextDrawSetShadow(logoserver[8], 0);
	TextDrawSetOutline(logoserver[8], 0);
	TextDrawBackgroundColor(logoserver[8], 255);
	TextDrawFont(logoserver[8], 2);
	TextDrawSetProportional(logoserver[8], 1);
	TextDrawSetShadow(logoserver[8], 0);

	logoserver[9] = TextDrawCreate(596.249877, 433.185150, "v1.0");
	TextDrawLetterSize(logoserver[9], 0.279166, 1.211109);
	TextDrawAlignment(logoserver[9], 1);
	TextDrawColor(logoserver[9], -1);
	TextDrawSetShadow(logoserver[9], 0);
	TextDrawSetOutline(logoserver[9], 0);
	TextDrawBackgroundColor(logoserver[9], 255);
	TextDrawFont(logoserver[9], 1);
	TextDrawSetProportional(logoserver[9], 1);
	TextDrawSetShadow(logoserver[9], 0);

	logoserver[10] = TextDrawCreate(316.067504, 39.848072, "play");
	TextDrawLetterSize(logoserver[10], 0.257499, 0.988147);
	TextDrawAlignment(logoserver[10], 1);
	TextDrawColor(logoserver[10], 65535);
	TextDrawSetShadow(logoserver[10], 0);
	TextDrawSetOutline(logoserver[10], 0);
	TextDrawBackgroundColor(logoserver[10], 255);
	TextDrawFont(logoserver[10], 0);
	TextDrawSetProportional(logoserver[10], 1);
	TextDrawSetShadow(logoserver[10], 0);
}
// --------------
//	 Mostrar TxD
// --------------
stock MostrarTDLogo(playerid)
{
	for(new i=0; i<11; ++i)
	{
	    TextDrawShowForPlayer(playerid, logoserver[i]);
	}
}

stock MostrarTDHud(playerid)
{
	for(new i=0; i<77; ++i)
	{
		new String[20];
		PlayerTextDrawShow(playerid, Hud[playerid][i]);

		format(String, sizeof(String), "%s", Nome(playerid));
		PlayerTextDrawSetString(playerid, Hud[playerid][4], String);

		format(String, sizeof(String), "$ %i", pDados[playerid][Dinheiro]);
		PlayerTextDrawSetString(playerid, Hud[playerid][50], String);
		PlayerTextDrawSetPreviewModel(playerid, Hud[playerid][7], pDados[playerid][Skin]);
	}
}

stock MostrarTDAvisos()
{
	for(new i=0; i<10; ++i)
	{
		TextDrawShowForAll(AvisosA[i]);
	}
}

stock MostrarTDBanco(playerid)
{
	for(new i=0; i<40; ++i)
	{
		PlayerTextDrawShow(playerid, OpenBank[playerid][i]);
		SelectTextDraw(playerid, 0x0000FFFFAA);
		
		new String[120];
		format(String, sizeof(String), "%s", Nome(playerid));
		PlayerTextDrawSetString(playerid, OpenBank[playerid][15], String);

		format(String, sizeof(String), "R$%d", pDados[playerid][SaldoBanco]);
		PlayerTextDrawSetString(playerid, OpenBank[playerid][23], String);
	}
	SelectTextDraw(playerid, 0x0000FFFFAA);
	return 1;
}

stock MostrarTDEmpregos(playerid)
{
	for(new i=0; i<23; ++i)
	{
		PlayerTextDrawShow(playerid, TelaEmpregos[playerid][i]);
		SelectTextDraw(playerid, 0x0000FFFFAA);
	}
	SelectTextDraw(playerid, 0x0000FFFFAA);
	return 1;
}

stock MostrarTDRegistro(playerid)
{
	for(new i=0; i<44; ++i)
	{
	    new String[128];
		PlayerTextDrawShow(playerid, TelaRegistro[playerid][i]);
		
		format(String, sizeof(String), "%s", Nome(playerid));
		PlayerTextDrawSetString(playerid, TelaRegistro[playerid][18], String);
		
		SelectTextDraw(playerid, 0x0000FFFFAA);
	}
	SelectTextDraw(playerid, 0x0000FFFFAA);
	return 1;
}

stock MostrarTDLogin(playerid)
{
    for(new i=0; i<44; ++i)
	{
	    new String[128];
		PlayerTextDrawShow(playerid, TelaLogin[playerid][i]);
		
		format(String, sizeof(String), "%s", Nome(playerid));
		PlayerTextDrawSetString(playerid, TelaLogin[playerid][21], String);
		
		SelectTextDraw(playerid, 0x0000FFFFAA);
	}
	SelectTextDraw(playerid, 0x0000FFFFAA);
	return 1;
}

// --------------
//	 FECHAR TxD
// --------------
stock FecharTDHud(playerid)
{
	for(new i=0; i<77; ++i)
	{
		PlayerTextDrawHide(playerid, Hud[playerid][i]);
	}
}

stock FecharTDBanco(playerid)
{
	for(new i=0; i<40; ++i)
	{
		PlayerTextDrawHide(playerid, OpenBank[playerid][i]);
		CancelSelectTextDraw(playerid);
	}
	CancelSelectTextDraw(playerid);
	return 1;
}

stock FecharTDAvisosA()
{
	for(new i=0; 1<10; ++i)
	{
		TextDrawHideForAll( AvisosA[i]);
	}
	return 1;
}

stock FecharTDEmpregos(playerid)
{
	for(new i=0; i<23; ++i)
	{
	    PlayerTextDrawHide(playerid, TelaEmpregos[playerid][i]);
	    CancelSelectTextDraw(playerid, 0x0000FFFF);
	}
	CancelSelectTextDraw(playerid, 0x0000FFFF);
	return 1;
}