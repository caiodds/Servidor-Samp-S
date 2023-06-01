#include 	<YSI_Coding\y_hooks>

// --------

//Variaveis
new Float:PosDrone[3];
new CarADM[MAX_PLAYERS];
// --------

//Cargos de Admin
#define Ajudante 1 
#define Moderador 2
#define Administrador 3 
#define AdministradorM 4
#define AdministradorG 5
#define Owner 6
#define Fundador 7

// --------

CMD:pegaradmin(playerid)
{
    pDados[playerid][Admin] = 7;
    SalvarConta(playerid);
	return 1;
}

CMD:irconce(playerid) return SetPlayerPos(playerid, 2131.7417,-1151.3241,24.0592);

/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Ajudante - Level 1         .                                    
...........................................
...........................................
...........................................
...........................................
*/
CMD:trabalhar(playerid)
{
    new String[250], skin;
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, -1, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!");
    if(pDados[playerid][Trabalhando] == false)
	{
		SetPlayerHealth(playerid,99999);
        SendClientMessageToAll(ROSA,"________________|ADMINISTRACAO|____________________");
        format(String, sizeof(String), "O administrador %s entrou no modo de Trabalho!",NomeAdmin(playerid));
    	SendClientMessageToAll(VERMELHO_CLARO,String);
    	SetPlayerSkin(playerid, skin);
		pDados[playerid][Trabalhando] = true;
		SetPlayerSkin(playerid,217);
		SetPlayerColor(playerid, LARANJA);
		}else{
		SetPlayerHealth(playerid,100);
		pDados[playerid][Trabalhando] = false;
        SendClientMessageToAll(ROSA,"________________|ADMINISTRACAO|____________________");
        format(String, sizeof(String), "O Admnistrador  %s nao esta mais no modo de Trabalho!",NomeAdmin(playerid));
    	SendClientMessageToAll(VERMELHO_CLARO,String);
    	SetPlayerSkin(playerid, skin);
		SetPlayerColor(playerid, -1);
	}
	return 1;
}

forward TimerOcultarAviso();
public TimerOcultarAviso()
{
	for(new i=0; i<10; i++)
	{
		TextDrawHideForAll(AvisosA[i]);
	}
	return 1;
}
CMD:av(playerid, params[])
{
	new msg[10000], String[100];
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, -1, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!");
    if(pDados[playerid][Trabalhando] == false) return SendClientMessage(playerid, -1, "{FF0000}| ERRO | Voce nao esta em modo de trabalho!");
	if(sscanf(params,"s",msg))return SendClientMessage(playerid, -1,"{FF0000}| ADMIN | Use /aviso [mensagem]");
	MostrarTDAvisos();
	//NOME
	format(String, sizeof(String), "%s", NomeAdmin(playerid));
	TextDrawSetString(AvisosA[9], String);
	//AVISO
	format(String, sizeof(String), "%s", msg);
	TextDrawSetString(AvisosA[7], String);
	//OCULTAR
	SetTimer("TimerOcultarAviso", 1000, false);
	return 1;
}

CMD:aa(playerid)
{
    if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
    new str1[444], str2[444], str3[444], str4[444], str5[444], MS[44444];
	format(str1, 444, "/carro /verid /tv /tvoff /a /spawn /ir");
	format(str2, 444, "/kick /av /verinfo /trazer");
	format(str3, 444, "/ban /darvida /darcolete");
	format(str4, 444, "");
	format(str5, 444, "/daradmin /dargrana /gmx");
	format(MS, 444444, "{D2691E}%s\n\n{ADFF2F}%s\n\n{00FFFF}%s\n\n{FF0000}%s\n\n{363636}%s", str1, str2, str3, str4, str5);
	ShowPlayerDialog(playerid, DIALOG_AA, DIALOG_STYLE_MSGBOX, "Comandos De Administradores", MS, "Ok", "");
	return 1;
}
CMD:veh(playerid, params[])
{
	new Veiculo, Modelo, Color[2], Float:Pos[4];
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(sscanf(params, "ddd", Modelo, Color[0], Color[1])) return SendClientMessage(playerid, Vermelho, "| ERRO | Use: /Veh [Modelo] [Color1] [Color2]");
	if(Modelo < 400 || Modelo > 611) return SendClientMessage(playerid, Vermelho, "| ERRO | Ve?culo InValido!");

	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayerFacingAngle(playerid, Pos[3]);

	Veiculo = AddStaticVehicleEx(Modelo, Pos[0], Pos[1], Pos[2], Pos[3], Color[0], Color[1], 0);
	PutPlayerInVehicle(playerid, Veiculo, 0);

	format(String, sizeof(String), "| INFO | Voce criou o Ve?culo ID: {FF0000}%d", Modelo);
	SendClientMessage(playerid, -1, String);
	return 1;
}

CMD:kick(playerid, params[])
{
	new id, level[4444], Str[5555];
	if(pDados[playerid][Admin] < 2) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "ds[4444]", id, level)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /kick id Motivo!.");
	format(Str, 44, "{FF0000}Serve: {00FFFF}O Admin [ {DC143C}%s {00FFFF}] Kickou O Jogador [ {DC143C}%s {00FFFF}] Pelo Motivo [ {DC143C}%s {00FFFF}]", Nome(playerid), Nome(id), level);
	SendClientMessageToAll(-1, Str);
	Kick(id);
	return 1;
}

/*
CMD:verid(playerid, params[])
{
	new Str[444], id;
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Use /verid IDFixo/ID].");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	SendClientMessage(playerid, -1, "{FF0000}======================={FFFFFF}==========={FF0000}====================");
	format(Str, 444, "{FF0000}Dono: {FFFFFF}%s \t{FF0000}ID Fixo: {FFFFFF}%d", Nome(id), GetPlayerFixedID(id));
	SendClientMessage(playerid, -1, Str);
	return 1;
}
*/

CMD:tv(playerid, params[])
{
	new id, Str[5555];
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /tv id!.");
	format(Str, 5555, "{FF0000}Serve: {00FFFF}Voce Esta Vendo O Jogador [ {DC143C}%s {00FFFF}]", Nome(id));
	SendClientMessage(playerid, -1, Str);
    TogglePlayerSpectating(playerid, 1);
    PlayerSpectatePlayer(playerid, id);
    SetPlayerInterior(playerid,GetPlayerInterior(id));
	return 1;
}

CMD:tvoff(playerid, params[])
{
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
    TogglePlayerSpectating(playerid, 0);
    SetSpawnInfo(playerid, 0, pDados[playerid][Skin], 266.7989,305.1628,999.1484,275.6573, 0, 0, 0, 0, 0, 0);
    SetPlayerInterior(playerid, 2);
	SetPlayerVirtualWorld(playerid, pDados[playerid][Quarto]);
	SpawnPlayer(playerid);
	return 1;
}

CMD:a(playerid, params[])
{
    if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid,0xFF0000FF,"{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
    new string[128];
    if(isnull(params)) return SendClientMessage(playerid, 0xFF0000FF, "Use: /a [texto]");
    format(string, sizeof(string), "[CHAT ADM] %s: %s", Nome(playerid), params);
    for(new i = 0; i <= MAX_PLAYERS; i ++)
    {
        if(IsPlayerConnected(i) && pDados[i][Admin] >= 1)
        {
            SendClientMessage(i,0xFF66FFAA, string);
        }
    }
    return 1;
}

CMD:spawn(playerid, params[])
{
    new id, Str[5555], Motivo[5555];
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "ds[5555]", id, Motivo)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /spawn id Motivo!.");
	format(Str, 5555, "{FF0000}Serve: {00FFFF}O Admin Deu Spawn No Player [ {DC143C}%s {00FFFF}] Pelo Motivo [ {DC143C}%s {00FFFF}]", Nome(playerid), Nome(id), Motivo);
	SendClientMessageToAll( -1, Str);
	SetSpawnInfo(id, 0, pDados[id][Skin], 266.7989,305.1628,999.1484,275.6573, 0, 0, 0, 0, 0, 0);
    SetPlayerInterior(id, 2);
	SetPlayerVirtualWorld(id, pDados[id][Quarto]);
	SpawnPlayer(id);
	return 1;
}

CMD:ir(playerid, params[])
{
    new id, Motivo[5555], Float:Pos[3];
	if(pDados[playerid][Admin] < 1) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /ir id!.");
	GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);
	SetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
	format(Motivo, 5555, "{FF0000}Serve: {00FFFF}Voce Foi Ate O Player [ {DC143C}%s {00FFFF}]",  Nome(id));
	SendClientMessage(playerid, -1, Motivo);
	return 1;
}

CMD:verinfo(playerid, params[])
{
    new id, Motivo[5555], Strr[555], Strrr[555], Strrrr[555], MGS[5555];
	if(pDados[playerid][Admin] < 2) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /verinfo id!.");
	format(Motivo, 5555, "{FF0000}Serve: {00FFFF}Voce Viu As Informacoes Do Player [ {DC143C}%s {00FFFF}]",  Nome(id));
	SendClientMessage(playerid, -1, Motivo);
	format(Strr, 555, "Nivel Admin: %d\tKills: %d\tMoney: %d", pDados[id][Admin], pDados[id][Mortes],  pDados[id][Cash]);
	format(Strrr, 555, "Id Da Skin: %d\tQuarto: %d",pDados[id][Skin], pDados[id][Quarto]);
	format(Strrrr, 555, "");
	format(MGS, 5555, "{FF0000}%s\n\n{FF0000}%s\n\n{FF0000}%s", Strr, Strrr, Strrrr);
	ShowPlayerDialog(playerid, DIALOG_VERINFO, DIALOG_STYLE_MSGBOX, "Informacoes", MGS, "Ok", "");
	return 1;
}

CMD:drone(playerid)
{
    if(pDados[playerid][Admin] >= Ajudante)
    {
		GetPlayerPos(playerid, PosDrone[0], PosDrone[1], PosDrone[2]);
	 	new	vehicleid = CreateVehicle(465, PosDrone[0], PosDrone[1], PosDrone[2], 0, -1, -1, -1);
		PutPlayerInVehicle(playerid, vehicleid, 0);
	}
	else return SendClientMessage(playerid, VERMELHO, "{19B0CF}| SERVER | {FFFFFF}Voce nao e um {FF0000}administrador!");
	return 1;
}

CMD:sairdrone(playerid)
{
    if(pDados[playerid][Admin] >= Ajudante)
    {
		new vehicleid = GetPlayerVehicleID(playerid);
		DestroyVehicle(vehicleid);
		SetPlayerPos(playerid, PosDrone[0], PosDrone[1], PosDrone[2]);
	}
	else return SendClientMessage(playerid, VERMELHO, "{19B0CF}| SERVER | {FFFFFF}Voce nao e um {FF0000}administrador!");
	return 1;
}

/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Moderador - Level 2        .
...........................................
...........................................
...........................................
...........................................
*/
CMD:trazer(playerid, params[])
{
    new id, Motivo[5555], Float:Pos[3];
	if(pDados[playerid][Admin] < 2) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /trazer id!.");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	SetPlayerPos(id, Pos[0], Pos[1], Pos[2]);
	SetPlayerInterior(id, GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(id, GetPlayerVirtualWorld(playerid));
	format(Motivo, 5555, "{FF0000}Serve: {00FFFF}Voce Trouxe O Player [ {DC143C}%s {00FFFF}]",  Nome(id));
	SendClientMessage(playerid, -1, Motivo);
	return 1;
}

CMD:ban(playerid, params[])
{
	new id, level[5555], Str[5555];
	if(pDados[playerid][Admin] < 3) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "ds[5555]", id, level)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /ban id Motivo!.");
	format(Str, 44, "{FF0000}Serve: {00FFFF}O Admin [ {DC143C}%s {00FFFF}] Baniu O Jogador [ {DC143C}%s {00FFFF}] Pelo Motivo [ {DC143C}%s {00FFFF}]", Nome(playerid), Nome(id), level);
	SendClientMessageToAll(-1, Str);
	Ban(id);
	return 1;
}

/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Administrador  - Level 3   .
...........................................
...........................................
...........................................
...........................................
*/

CMD:darvida(playerid, params[])
{
	new id, Float:level, Str[555];
	if(pDados[playerid][Admin] < 3) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "di", id, level)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /darvida id vida[0-100]!.");
    if(level < 0) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use Vida Maior Que 0!.");
    if(level > 100) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use Vida Menor Que 100!.");
	format(Str, 555, "{FF0000}Serve: {00FFFF}Voce Deu Vida [ {DC143C}%i {00FFFF}] Para O Jogador [ {DC143C}%s {00FFFF}]", level, Nome(id));
	SendClientMessage(playerid, -1, Str);
	SetPlayerHealth(id, level);
	return 1;
}

CMD:darcolete(playerid, params[])
{
	new id, Float:level, Str[555];
	if(pDados[playerid][Admin] < 3) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "di", id, level)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /darcolete id colete[0-100]!.");
    if(level < 0) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use Colete Maior Que 0!.");
    if(level > 100) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use Colete Menor Que 100!.");
	format(Str, 555, "{FF0000}Serve: {00FFFF}Voce Deu Colete [ {DC143C}%i {00FFFF}] Para O Jogador [ {DC143C}%s {00FFFF}]", level, Nome(id));
	SendClientMessage(playerid, -1, Str);
 	SetPlayerArmour(id, level);
	return 1;
}

/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Administrador  - Level 4   .
...........................................
...........................................
...........................................
...........................................
*/

CMD:dararma(playerid, params[])
{
	if(pDados[playerid][Admin] >= Administrador)
	{
	    new
	        arma,
	        idx,
	        municao;
	        
		if(sscanf(params,"udd",idx,arma,municao)) return SendClientMessage(playerid, VERMELHO,"[INFO]: Use /dararma [id] [arma] [municao]");
		if(arma < 1 || arma > 48) return SendClientMessage(playerid, VERMELHO,"[INFO]: Use de 1-48.");
		
		GivePlayerWeapon(idx, arma, municao);
		SendClientMessage(idx, -1, "[ADMIN]: O Admin te deu uma arma.");
        SendClientMessage(playerid, -1, "[ADMIN]: Voce deu uma Arma.");
	}
	else return SendClientMessage(playerid, VERMELHO, "{19B0CF}| SERVER | {FFFFFF}Voce nao e um {FF0000}administrador!");
	return 1;
}

/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Administrador  - Level 5   .
...........................................
...........................................
...........................................
...........................................
*/

CMD:congelartodos(playerid, params[])
{
	new String[225];
    if(pDados[playerid][Admin] < 5) return SendClientMessage(playerid, -1, "{FF0000}| INFO | {FFFFFF}Voce precisa ser admin {FF0000}nivel 5 {FFFFFF}para usar este {FF0000}comando!");
    if(pDados[playerid][Trabalhando] == false) return SendClientMessage(playerid, -1, "{FF0000}| INFO | {FFFFFF}Voce precisa estar no modo de trabalho para usar este comando. {FF0000}Use /trabalhar.");
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        TogglePlayerControllable(i, false);
        pDados[i][Congelado] = true;
	}
	format(String, sizeof(String), "{FF0000}| ADMIN | O Admin {1B95E0}%s {FF0000}Congelou todos os Jogadores", Nome(playerid));
    SendClientMessageToAll(-1, String);
    return 1;
}

CMD:descongelartodos(playerid, params[])
{
	new String[225];
    if(pDados[playerid][Admin] < 5) return SendClientMessage(playerid, -1, "Voce precisa ser admin nivel 4 para usar este comando!");
    if(pDados[playerid][Trabalhando] == false) return SendClientMessage(playerid, -1, "Voce precisa trabalhar para usar o comando. Use /servico.");
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        TogglePlayerControllable(i, true);
        pDados[i][Congelado] = false;
	}
	format(String, sizeof(String), "{FF0000}| ADMIN | O Admin {1B95E0}%s {FF0000}Descongelou todos os Jogadores", Nome(playerid));
    SendClientMessageToAll(-1, String);
    return 1;
}


/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Owner/Dono  - Level 6      .
...........................................
...........................................
...........................................
...........................................
*/


/*
...........................................
...........................................
...........................................
...........................................
.       Cargo: Fundador - Level 7         .
...........................................
...........................................
...........................................
...........................................
*/

CMD:daradmin(playerid, params[])
{
	new id, nivel, str[256], str2[256];
	if(pDados[playerid][Admin] < Fundador && !IsPlayerAdmin(playerid))  return SendClientMessage(playerid, VERMELHO, "{19B0CF}| SERVER | {FF0000}Voce nao tem permisao para usar este comando!");
	if(sscanf(params, "dd", id, nivel)) return SendClientMessage(playerid, VERMELHO, "[INFO]: Use /daradmin [id] [nivel]");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, VERMELHO, "[ERRP]: Player nao conectado!");
	if(nivel < 0 || nivel > 6) return SendClientMessage(playerid, VERMELHO, "[ERRO]: Niveis de 1 a 6!");
	format(str, sizeof(str), "%s setou o seu admin nivel %s.", Nome(playerid), GetLevelAdmin(nivel));
	SendClientMessage(id, 0x4F4F4FFF, str);
	format(str2, sizeof(str2), "Voce setou admin nivel %s para %s", GetLevelAdmin(nivel), Nome(id));
	SendClientMessage(playerid, 0x4F4F4FFF, str2);
	pDados[id][Admin] = nivel;
	pDados[id][Trabalhando] = false;
	return 1;
}

CMD:tiraradmin(playerid, params[])
{
	new str[256], str2[256], id;
	if(pDados[playerid][Admin] < Fundador && !IsPlayerAdmin(playerid))  return SendClientMessage(playerid, VERMELHO, "{19B0CF}| SERVER | {FF0000}Voce nao tem permisao para usar este comando!");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, VERMELHO, "[INFO]: Use /tiraradmin [playerid]");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, VERMELHO, "[INFO]: Player nao conectado!");
	if(pDados[id][Admin] < 1) return SendClientMessage(playerid, VERMELHO, "[INFO]: Este player nao e administrador.");
	format(str, sizeof(str), "%s tirou o seu admin.", Nome(playerid));
	SendClientMessage(id, 0x4F4F4FFF, str);
	format(str2, sizeof(str2), "Voce tirou o admin de %s.", Nome(id));
	SendClientMessage(playerid, 0x4F4F4FFF, str2);
	pDados[id][Admin] = 0;
	pDados[id][Trabalhando] = false;
	return 1;
}

CMD:gmx(playerid, params[])
{
	new Money[555], Str[555];
	if(pDados[playerid][Admin] < 7) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(sscanf(params, "s[555]", Money)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /gmx motivo!.");
	format(Str, 555, "{FF0000}Serve: {00FFFF}O Admin [ {DC143C}%s {00FFFF}] De Gmx No Servidor Pelo Motivo [ {DC143C}%s {00FFFF}]", Nome(playerid), Money);
	SendClientMessageToAll( -1, Str);
	SendRconCommand("gmx");
	return 1;
}


CMD:dargrana(playerid, params[])
{
	new id, Money, Str[555];
	if(pDados[playerid][Admin] < 5) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | Voce nao tem permissao para usar este comando!.");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, 0xFF0000FF, "{FF0000}| ERRO | O jogador nao esta online!");
	if(sscanf(params, "dd", id, Money)) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use /darmoney id Money!.");
    if(Money < 0) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use Money Maior Que 0!.");
    if(Money > 100000) return SendClientMessage(playerid, 0xFF0000FF, "Erro: Use Money Menor Que 100000!.");
	format(Str, 555, "{FF0000}Serve: {00FFFF}Voce Deu [ {DC143C}%d {00FFFF}] De Money Para O Jogador [ {DC143C}%s {00FFFF}]", Money, Nome(id));
	SendClientMessage(playerid, -1, Str);
	pDados[id][Cash] = Money;
	return 1;
}

CMD:criarteleporte(playerid, params[])
{
	new Comando[128],
	    Float:X,
	    Float:Y,
	    Float:Z;
	new String[225];
    if(pDados[playerid][Admin] < 7) return SendClientMessage(playerid, -1, "{19B0CF}| ADMIN | » {FFFFFF}precisa ser admin {FF0000}Level 7 {FFFFFF}para usar este {FF0000}comando!");
    if(pDados[playerid][Trabalhando] == false) return SendClientMessage(playerid, -1, "{19B0CF}| ADMIN | {FFFFFF}precisa estar no modo de trabalho para usar o comando. {FF0000}Use /trabalhar.");
	if(sscanf(params, "s", Comando)) return SendClientMessage(playerid, -1, "{19B0CF}| ADMIN | {FFFFFF}Use {FF0000}/criarteleporte [Comando]"), SendClientMessage(playerid, -1, "{19B0CF}| INFO | {FFFFFF}Use o comando para criar um teleporte, o teleporte sera salvo caso o server seja reiniciado");
	format(String, sizeof(String), "LLADMIN/Teleportes/te %s.txt", Comando);
	if(DOF2_FileExists(String)) return SendClientMessage(playerid, -1, "{FF0000}| ERRO | Este Comando ja existe!");
	DOF2_CreateFile(String);
	GetPlayerPos(playerid, X, Y, Z);
	DOF2_SetString(String, "Admin", Nome(playerid));
	DOF2_SetString(String, "Comando", Comando);
	DOF2_SetFloat(String, "X", X);
	DOF2_SetFloat(String, "Y", Y);
	DOF2_SetFloat(String, "Z", Z);
	format(String, sizeof(String), "| ADMIN | {FFFFFF}O Admin {1B95E0}%s{FFFFFF} Criou o teleporte {1B95E0}'te %s'{00C2EC}", Nome(playerid), Comando);
    SendClientMessageToAll(-1, String);
    return 1;
}

CMD:matartodos(playerid, params[])
{
	new String[255];
    if(pDados[playerid][Admin] < 7) return SendClientMessage(playerid, -1, "{FF0000}| ERRO | {FFFFFF}Voce precisa ser admin {FF00FF}nivel 7 {FFFFFF}para usar este {FF00FF}comando!");
    if(pDados[playerid][Trabalhando] == false) return SendClientMessage(playerid, -1, "{FF0000}| ERRO | {FFFFFF}Voce precisa trabalhar para usar o comando. {FF0000}Use /servico.");
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        SetPlayerHealth(i, 0);
	}
    format(String, sizeof(String), "{FF0000}| ADMIN | O Admin {1B95E0}%s{FF0000}Matou todos os Jogadores", Nome(playerid));
    SendClientMessageToAll(VERMELHO, String);
    return 1;
}

/*





                                    DIALOG DE PLAYERS
        




*/