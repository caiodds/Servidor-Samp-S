// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>
#include <sscanf>
#include <DOF2>



main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}
enum vip
{
    Vip
}
new PlayerName[MAX_PLAYERS][MAX_PLAYER_NAME];
new g_PlayerIsVIP[MAX_PLAYERS]; // Defina como 1 se o jogador for VIP, caso contr?rio, defina como 0
new playerVehicle[MAX_PLAYERS];
new comandopm[MAX_PLAYERS];
new policia[MAX_PLAYERS];
new bool: IsPlayerPolice[MAX_PLAYERS];



#define Verde                0x00FF00FF
#define vermelho             0xFF0000AA
#define Azul                 0x0000FFAA
#define Marron               0x804000AA
#define Branco               0xFFFFFFAA
#define Laranja              0xFF8000AA
#define Azul_Marinho         0x80FFFFAA
#define Cinza                0xC0C0C0AA
#define Rosa                 0xFF80FFAA
#define AZUL_CLARO           0x80BFFFAA
#define Verde_Escuro         0x007138AA
#define Amarelo              0xFFFF00AA
#define Roxo                 0x9F009FAA
#define VERDE_AGUA           0x03D687FF
#define CINZA_ESCURO         0x626262FF
#define VERDE                0x21DD00FF
#define VERMELHO_CLARO       0xFB0000FF
#define VERDE_CLARO          0x38FF06FF
#define ROSA_CHOQUE          0xE100E1FF
#define VERDE_ESCURO         0x008040FF
#define CINZA_ESCURO       	 0x626262FF

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Fugas LV");
	DisableInteriorEnterExits();
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	CreateVehicle(596,2290.6941,2441.2554,10.5475,0.6146,3,3, 0, 0, 100);
	CreateVehicle(596,2295.3640,2441.2671,10.5474,0.4774,3,3, 0, 0, 100);
	CreateVehicle(596,2295.2126,2459.0581,10.5474,0.4775,3,3, 0, 0, 100);
	CreateVehicle(596,2295.0564,2478.0696,10.5474,0.4776,3,3, 0, 0, 100);
	CreateVehicle(596,2290.8079,2478.1016,10.5474,0.6902,3,3, 1, 1, 100);
	CreateVehicle(596,2291.0129,2460.4814,10.5474,0.6902,3,3, 1, 1, 100);
	CreateVehicle(522,2034.4438,1339.2137,10.8203,269.9913, 2, 2, 100);
	Create3DTextLabel("Digite /equipar", vermelho, 2296.5112,2468.6177,10.8203, 5.0);
    CreatePickup(1239, 1,2296.5112,2468.6177,10.8203);
	UsePlayerPedAnims();

	return 1;
}

public OnGameModeExit()
{
	return 1;
}
public UpdatePlayerScore(playerid)
{
    
    return 1;
}

public SetPlayerNames(playerid, const name[])
{
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetSpawnInfo(playerid, 0, 0, 2035.5541,1327.4578,10.8203, 0, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	ShowPlayerDialog(playerid,11, DIALOG_STYLE_LIST,"Selecionar Exercito","Exercito Brasileiro\nExercito Portugal","Selecionar", "Fechar");
	return 1;
}

public ShowPlayerRG(playerid)
{
    new message[128];
    format(message, sizeof(message), "Seu Nome: %s", PlayerName[playerid]);
    ShowPlayerDialog(playerid, 4, DIALOG_STYLE_MSGBOX, "=== RG ===", message, "FECHAR", "");
    return 1;
}

public OnPlayerConnect(playerid)
{
	policia[playerid] = 0;
	g_PlayerIsVIP[playerid] = 0; // Defina como 1 se o jogador for VIP, caso contr?rio, defina como 0
	SetPlayerName(playerid, "NomePadrão"); // Define um nome padrão para o jogado
	SendClientMessage(playerid,Verde, "BEM VINDO AO SERVIDOR DIGITE /ajuda");
	 
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}


public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	UpdatePlayerScore(killerid);
	SendClientMessage(playerid, -1, "Voce foi mortopor %s", playerid);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{

	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    return 1;
}


public OnPlayerStateChange(playerid, newstate, oldstate)
{    if (newstate == PLAYER_STATE_DRIVER) // O jogador entrou no veículo como motorista
    {
        if (!policia[playerid]) // Se o jogador NÃO é um policial
        {

            new vehicleid = GetPlayerVehicleID(playerid);
            if (GetVehicleModel(vehicleid) == 596) // Verifica o modelo do veículo usando o ID
            {
                RemovePlayerFromVehicle(playerid);
                SendClientMessage(playerid,vermelho, "Você foi ejetado do veículo por não ser um policial!");
            }
        }
        else
        {
            
        }
    }
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 2){
		if(response){
			if(listitem == 0){
				SetPlayerPos(playerid, 2036.0341,1341.2943,10.8203);
				SendClientMessage(playerid, -1,"[ADMIN!] Voce foi para LV!");
			}
			if(listitem == 1){
				SetPlayerPos(playerid, 1539.2390,-1695.6740,13.5469);
				SendClientMessage(playerid, -1, "[ADMIN!] Voce foi para LS!");
			}
			if(listitem == 2){
				SetPlayerPos(playerid,-1430.3195,-286.0803,14.1484);
				SendClientMessage(playerid, -1, "[ADMIN!] Voce foi para SF!");
			}
		}else{
			SendClientMessage(playerid,-1, "Voce fechou o menu de teles");
		}
	}
	if(dialogid == 5){
		if(response){
			if(listitem == 0){
				GivePlayerWeapon(playerid, 24, 567);
			}
			if(listitem == 1){
				GivePlayerWeapon(playerid, 24, 789);
				GivePlayerWeapon(playerid, 30, 344);
			}
		}
	}
if(dialogid == 7){
        if(response){
            if(listitem == 0){
                new idveiculo, cor1, cor2, Float:Pos[4];
                GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
                GetPlayerFacingAngle(playerid, Pos[3]);
                CreateVehicle(411, Pos[0], Pos[1], Pos[2], Pos[3], cor1, cor2, -1,3);
                SendClientMessage(playerid, 0x00FF80AA, "): Veiculo criado com sucesso!");
            }
        }
        if(listitem == 1){
                new idveiculo, cor1, cor2, Float:Pos[4];
                GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
                GetPlayerFacingAngle(playerid, Pos[3]);
                CreateVehicle(506, Pos[0], Pos[1], Pos[2], Pos[3], cor1, cor2, -1,3);
                SendClientMessage(playerid, 0x00FF80AA, "): Veiculo criado com sucesso!");
        }
        if(listitem == 2){
                new idveiculo, cor1, cor2, Float:Pos[4];
                GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
                GetPlayerFacingAngle(playerid, Pos[3]);
                CreateVehicle(560, Pos[0], Pos[1], Pos[2], Pos[3], cor1, cor2, -1,3);
                SendClientMessage(playerid, 0x00FF80AA, "): Veiculo criado com sucesso!");
        }
    }
	if(dialogid == 9){
		if(response){
			if(listitem == 0){
				ShowPlayerDialog(playerid,99, DIALOG_STYLE_MSGBOX, "Info org", "EM BREVE","OK", "fechar");
			}
			if(listitem == 1){
				SendClientMessage(playerid,Azul,"[AVISO PM] VOCE PEGOU EQUIPAMENTO DA POLICIA MILITAR");
				GivePlayerWeapon(playerid,24, 345);
				GivePlayerWeapon(playerid,31, 590);
				GivePlayerWeapon(playerid, 29,890);
			}
			if(listitem == 2){
				ShowPlayerDialog(playerid,99, DIALOG_STYLE_MSGBOX, "Membros Ativos", "EM BREVE","OK", "fechar");
			}
		}
	}
	if(dialogid == 11){
		if(response){
			if(listitem == 0){
				SetPlayerPos(playerid,-1336.3706,450.284,7.1875);
				SetPlayerInterior(playerid,0);
				SendClientMessage(playerid,Verde, "Bem vindo ao Exercito Brasileiro");
			}
		}
	}
	return 1;
}
