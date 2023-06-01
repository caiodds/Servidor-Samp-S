// == Includes
#include <y_hooks>

//Pastas
#define PASTA_VIPS	"NL/Vips"
#define PASTA_KEYS	"NL/Keys"

// == Dialogs
#define DIALOG_VIPS     				4995
#define DIALOG_VENC_VIP     			4996
#define DIALOG_COMANDOS_VIP     		4997
#define DIALOG_EFECTS     				4998
#define DIALOG_TOYS     				4999

#define DIALOG_ENABLE_KEY 				5000
#define DIALOG_NEW_KEY					5001
#define DIALOG_NEW_KEY_LEVEL			5005
#define DIALOG_NEW_KEY_DAYS 			5002
#define DIALOG_KEY_CONFIRM 				5003
#define DIALOG_REMOVE_KEY				5004


enum pInfo
{
	Vip,
	DiasVip,
	TempoVip,
	vKey[25],
	vDias,
	vNivel,
	bool:PegouKit,
	bool:PegouColete
};
new PlayerInfo[MAX_PLAYERS][pInfo], Timer, CarrosCriados[100], TodosCarros = 0;

hook OnFilterScriptInit()
{
	Timer = SetTimer("CheckVip", 60000, true);
	return 1;
}

hook OnFilterScriptExit()
{
	KillTimer(Timer);
	DOF2_Exit();
	return 1;
}

hook OnPlayerConnect(playerid)
{
	GetPlayerName(playerid, Nome(playerid), 24);
	LoadVips(playerid);
	return 1;
}

stock LoadVips(playerid)
{
	new file[24];
	format(file, 24, "%s/%s", PASTA_VIPS, Nome(playerid));
	if(DOF2_FileExists(file))
	{
		PlayerInfo[playerid][Vip] = DOF2_GetInt(file, "Nivel");
		PlayerInfo[playerid][DiasVip] = DOF2_GetInt(file, "Dias");
		PlayerInfo[playerid][TempoVip] = DOF2_GetInt(file, "TempoVip");
	} else {
		PlayerInfo[playerid][Vip] = 0;
		PlayerInfo[playerid][DiasVip] = 0;
		PlayerInfo[playerid][TempoVip] = 0;
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(PlayerInfo[playerid][Vip] > 0)
	{
		if(!DOF2_FileExists(FileVip(playerid))) return DOF2_CreateFile(FileVip(playerid));
		DOF2_SetInt(FileVip(playerid), "Nivel", PlayerInfo[playerid][Vip]);
		DOF2_SetInt(FileVip(playerid), "Dias", PlayerInfo[playerid][DiasVip]);
		DOF2_SetInt(FileVip(playerid), "Tempo", PlayerInfo[playerid][TempoVip]);
		DOF2_SaveFile();
	}
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if(PlayerInfo[playerid][PegouKit] == true) LiberarKit(playerid);
	if(PlayerInfo[playerid][PegouColete] == true) LiberarColete(playerid);
	return 1;
}

SetVip(playerid, Nivel, Dias)
{
	new stringV[70];
	if(PlayerInfo[playerid][Vip] > 0)
	{
		format(stringV, sizeof stringV, "C-VIP: Seu VIP foi renovado. + %d dias. Nivel: %d.", Dias, Nivel);
		PlayerInfo[playerid][TempoVip] += Dias;
		PlayerInfo[playerid][DiasVip] += Dias;
		PlayerInfo[playerid][Vip] = Nivel;
		
		if(!DOF2_FileExists(FileVip(playerid))) return DOF2_CreateFile(FileVip(playerid));
		DOF2_SetInt(FileVip(playerid), "Nivel", PlayerInfo[playerid][Vip]);
		DOF2_SetInt(FileVip(playerid), "Dias", PlayerInfo[playerid][DiasVip]);
		DOF2_SetInt(FileVip(playerid), "Tempo", PlayerInfo[playerid][TempoVip]);
		DOF2_SaveFile();
	} else {

		format(stringV, sizeof stringV, "C-VIP: Seu VIP foi ativado. %d dias. Nivel: %d. /ComandosVip", Dias, Nivel);
		PlayerInfo[playerid][TempoVip] = Dias;
		PlayerInfo[playerid][DiasVip] = Dias;
		PlayerInfo[playerid][Vip] = Nivel;

		if(!DOF2_FileExists(FileVip(playerid))) return DOF2_CreateFile(FileVip(playerid));
		DOF2_SetInt(FileVip(playerid), "Nivel", PlayerInfo[playerid][Vip]);
		DOF2_SetInt(FileVip(playerid), "Dias", PlayerInfo[playerid][DiasVip]);
		DOF2_SetInt(FileVip(playerid), "Tempo", PlayerInfo[playerid][TempoVip]);
		DOF2_SaveFile();
	}
	SendClientMessage(playerid, COR_VIP, stringV);
	return 1;
}

RemoveVip(playerid)
{
	if(DOF2_FileExists(FileVip(playerid))) return DOF2_RemoveFile(FileVip(playerid));
	
	PlayerInfo[playerid][TempoVip] = 0;
	PlayerInfo[playerid][Vip] = 0;
	PlayerInfo[playerid][DiasVip] = 0;
	SendClientMessage(playerid, COR_VIP, "C-VIP: Seus dias VIP chegaram ao fim. Para renovar adquira uma nova key VIP.");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_NEW_KEY:
		{
			if(!response) return 1;
			if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_NEW_KEY, DIALOG_STYLE_INPUT, "KEYS VIP", "\nDigite uma nova key valida\n{FFFF00}Apenas letras sao aceitas:\n\n", "Criar", "Cancelar");
			format(PlayerInfo[playerid][vKey], 50, inputtext);
			new Dialog[128];
			format(Dialog, sizeof Dialog, "{FFFFFF}Seu novo codigo VIP: {DE3A3A}%s\n\n{FFFFFF}Agora nos informe a quantidade de dias VIP:", PlayerInfo[playerid][vKey]);
			ShowPlayerDialog(playerid, DIALOG_NEW_KEY_DAYS, DIALOG_STYLE_INPUT, "KEYS VIP", Dialog, "Criar", "Cancelar");
		}

		case DIALOG_NEW_KEY_DAYS:
		{
  			if(!IsNumeric(inputtext)) return SendClientMessage(playerid, VERMELHO, "ERRO: Digite uma quantidade de dias validos.");
  			if(strval(inputtext) <= 0) return SendClientMessage(playerid, VERMELHO, "ERRO: nao pode ser criada uma Key com 0 dias vips.");
			PlayerInfo[playerid][vDias] = strval(inputtext);
			new Dialog[170];
			format(Dialog, sizeof Dialog, "{FFFFFF}Seu novo codigo VIP: {DE3A3A}%s\n{FFFFFF}Vencimento: {DE3A3A}%d dias\n\n{FFFFFF}Agora nos informe o nivel da key VIP: {DE3A3A}1 a 3", PlayerInfo[playerid][vKey], PlayerInfo[playerid][vDias]);
			ShowPlayerDialog(playerid, DIALOG_NEW_KEY_LEVEL, DIALOG_STYLE_INPUT, "KEYS VIP", Dialog, "Criar", "Cancelar");
		}

		case DIALOG_NEW_KEY_LEVEL:
		{
  			if(!IsNumeric(inputtext)) return SendClientMessage(playerid, VERMELHO, "ERRO: Digite uma quantidade de nivel validos 1 a 3.");
			if(strval(inputtext) < 1 || strval(inputtext) > 3) return SendClientMessage(playerid, VERMELHO, "ERRO: Digite uma quantidade de nivel validos 1 a 3.");
			PlayerInfo[playerid][vNivel] = strval(inputtext);
			new Dialog[190];
			format(Dialog, sizeof Dialog, "{FFFFFF}Informacoes de sua nova key:\n\nCodigo: {DE3A3A}%s\n{FFFFFF}Vencimento: {DE3A3A}%d dias\n{FFFFFF}Nivel: {DE3A3A}%d\n\n{FFFFFF}Deseja criar ?", PlayerInfo[playerid][vKey], PlayerInfo[playerid][vDias], PlayerInfo[playerid][vNivel]);
			ShowPlayerDialog(playerid, DIALOG_KEY_CONFIRM, DIALOG_STYLE_MSGBOX, "KEYS VIP", Dialog, "Sim", "nao");
		}

		case DIALOG_KEY_CONFIRM:
		{
			if(!response) return 1;
			new file[70];
			format(file, 70, "%s/%s", PASTA_KEYS, PlayerInfo[playerid][vKey]);
			if(DOF2_FileExists(file)) return SendClientMessage(playerid, -1, "Key ja existe!");
			DOF2_CreateFile(file);
			DOF2_SetInt(file, "Nivel", PlayerInfo[playerid][vNivel]);
			DOF2_SetInt(file, "Dias", PlayerInfo[playerid][vDias]);
			DOF2_SaveFile();
			
			KeyCreated(playerid, PlayerInfo[playerid][vKey], PlayerInfo[playerid][vDias], PlayerInfo[playerid][vNivel]);
		}

		case DIALOG_REMOVE_KEY:
		{
			if(!response) return 1;
			new file[70];
			format(file, 70, "%s/%s", PASTA_KEYS, inputtext);
			DOF2_RemoveFile(file);
			
			KeyDeleted(playerid, inputtext);
		}

		case DIALOG_ENABLE_KEY:
		{
			if(!response) return 1;
			CheckKeyExist(playerid, inputtext);
		}
		case DIALOG_TOYS:
		{
			if(!response) return 1;
			SendClientMessage(playerid, COR_VIP, "C-VIP: Use /tbrinq para remover o brinquedo.");
			GameTextForPlayer(playerid, "~g~/tbrinquedos", 2000, 3);
			switch(listitem)
			{
			  	case 0: SetPlayerAttachedObject(playerid, 0, 19330, 2, 0.166000, -0.038999, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
			  	case 1: SetPlayerAttachedObject(playerid, 0, 19161, 2, 0.078999, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
	   			case 2: SetPlayerAttachedObject(playerid, 0, 18639, 2, 0.131000, 0.019000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
			  	case 3: SetPlayerAttachedObject(playerid, 0, 18638, 2, 0.148999, 0.031000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
				case 4: SetPlayerAttachedObject(playerid, 0, 18939, 2, 0.164000, 0.001999, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
				case 5: SetPlayerAttachedObject(playerid, 0, 19488, 2, 0.121999, 0.000000, -0.005999, -83.199966, 98.200027, -2.500000, 1.000000, 1.000000, 1.000000);
				case 6: SetPlayerAttachedObject(playerid, 0, 19352, 2, 0.106999, 0.016000, -0.010999, 4.500000, 82.099990, -3.100001, 1.000000, 1.000000, 1.000000);
				case 7: SetPlayerAttachedObject(playerid, 0, 19090, 2, -0.315999, 0.019999, 0.030000, 0.000000, 0.000000, 0.000000, 1.455999, 0.526000, 0.541000);
				case 8: SetPlayerAttachedObject(playerid, 0, 19424, 2, 0.070999, -0.026000, -0.002000, -85.299987, 1.600005, -99.500000, 0.944001, 0.915000, 0.809999);
				case 9: SetPlayerAttachedObject(playerid, 0, 19078, 1, -1.000000,-0.517000,0.000000,0.000000,0.299999,10.499994,8.673998,9.400999,7.410993);
				case 10: SetPlayerAttachedObject(playerid,0, 19078, 4, -0.067000,0.053999,0.018000,-168.400039,-169.800003,-2.800000,1.000000,1.000000,1.000000);
				case 11: SetPlayerAttachedObject(playerid,0, 19085, 2, 0.090999,0.035000,-0.015000,106.599983,83.199996,0.800003,1.000000,1.000000,1.000000);
				case 12: SetPlayerAttachedObject(playerid,1, 19086, 15, 0.051000,0.000000,-0.424999,0.000000,0.000000,-102.100006,1.000000,1.000000,1.000000);
				case 13: SetPlayerAttachedObject(playerid,0, 19137, 2, 0.101000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
				case 14: SetPlayerAttachedObject(playerid,0, 19137, 15, 0.040999,0.000000,-0.130000,-86.300003,106.100013,-96.100051,7.741999,4.874000,5.584998);
				case 15: SetPlayerAttachedObject(playerid,0, 19315, 1, -0.247999,0.509999,-0.015999,4.300004,86.900024,85.500015,3.010000,4.463000,3.824000);
				case 16: SetPlayerAttachedObject(playerid,0, 19314, 2, 0.157000,0.000000,0.000000,-0.199999,-7.600006,-88.599998,1.000000,1.000000,1.000000);
				case 17: SetPlayerAttachedObject(playerid,0, 19314, 2, 0.157000,0.000000,0.000000,1.400000,-7.600006,-28.599973,0.711000,0.919999,0.361999);
				case 18: SetPlayerAttachedObject(playerid,0, 19320, 2, 0.000000,0.000000,0.000000,4.299999,72.999992,3.199999,3.594999,3.787999,4.951001);
				case 19: SetPlayerAttachedObject(playerid,0, 18963, 2, 0.261000,0.084999,0.004999,4.999999,85.400039,84.699974,2.097000,2.627000,3.033999);
				case 20: SetPlayerAttachedObject(playerid,0, 1607, 2, 0.267000,0.000000,0.000000,-0.199999,81.199996,-3.499999,1.135000,1.000000,1.126999);
				case 21: SetPlayerAttachedObject(playerid,0, 1608, 1, 0.000000,0.000000,0.000000,0.499999,89.200042,0.199999,1.000000,1.000000,1.000000);
				case 22: SetPlayerAttachedObject(playerid,0, 1609, 1, -0.358000,0.000000,0.170000,0.000000,93.099998,0.000000,1.427000,1.509000,1.641000);
				case 23: SetPlayerAttachedObject(playerid,0, 16442, 15, 0.000000,0.000000,0.259000,0.000000,0.000000,-104.400001,1.000000,1.000000,1.000000);
				case 24: SetPlayerAttachedObject(playerid,1, 373, 1, 0.33, -0.029, -0.15, 65, 25, 35);
				case 25: SetPlayerAttachedObject(playerid,1, 1240, 1, 0.15, 0.17, 0.06, 0.0, 90.0, 0.0);
				case 26: SetPlayerAttachedObject(playerid,1, 1252, 1, 0.1, -0.2, 0.0, 0.0, 90.0, 0.0);
				case 27: SetPlayerAttachedObject(playerid,1, 356, 1, -0.2, -0.15, 0.0, 0.0, 24.0, 0.0);
				case 28: SetPlayerAttachedObject(playerid,1 ,359, 15 ,-0.02 ,0.08 ,-0.3 ,0 ,50 ,-10);
				case 29: SetPlayerAttachedObject(playerid,0, 19065, 2, 0.120000, 0.040000, -0.003500, 0, 100, 100, 1.4, 1.4, 1.4);
				case 30: SetPlayerAttachedObject(playerid,0 ,1852 ,2 ,0.1 ,0 ,-0.01 ,0 ,15 ,0);
				case 31: SetPlayerAttachedObject(playerid,1, 1654, 1, 0.1,0.20,0.0,180.0,100.0,0.0);
			}
		}

		case DIALOG_EFECTS:
		{
			if(!response) return 1;
			SendClientMessage(playerid, COR_VIP, "C-VIP: Use /tefeitos para remover o efeito.");
			GameTextForPlayer(playerid, "~g~/tefeitos", 2000, 3);
			switch(listitem)
			{
			  	case 0: SetPlayerAttachedObject(playerid,1,18688,1,-0.895839,0.631365,-1.828601,21.642332,7.385670,13.958697,1.232679,1.000000,1.090367); // fire - Bruno
			  	case 1: SetPlayerAttachedObject(playerid,1,18742,1,0.036487,-1.759890,1.772809,225.616638,1.132580,0.677276,1.000000,1.000000,1.000000); // water_speed - explosaoaquatica
	   			case 2: SetPlayerAttachedObject(playerid,1,18864,1,2.178843,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000); // FakeSnow1 - neve
			  	case 3: SetPlayerAttachedObject(playerid,1,867,1,-0.213616,-0.444311,0.070721,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000); // p_rubble04col - pedras
				case 4: SetPlayerAttachedObject(playerid,1,1254,1,0.448984,0.065604,0.006619,4.313228,89.284942,0.000000,1.000000,1.000000,1.000000); // killfrenzy - caveira
				case 5: SetPlayerAttachedObject(playerid,1,1242,1,0.090351,0.088730,-0.000036,0.000000,89.157951,0.000000,1.619548,1.000000,1.348966); // bodyarmour - colete
				case 6: SetPlayerAttachedObject(playerid,1,18735,1,0.000000,-0.479024,-1.590823,0.000000,0.000000,0.000000,13.498819,1.000000,0.678294); // vent2 - fumaçao
				case 7: SetPlayerAttachedObject(playerid,1,19065,15,-0.025,-0.04,0.23,0,0,270,2,2,2); // Toca de Natal

				case 8:
				{
					SetPlayerAttachedObject(playerid,1,18688,1,-0.895839,0.631365,-1.828601,21.642332,7.385670,13.958697,1.232679,1.000000,1.090367); // fire - Bruno
					SetPlayerAttachedObject(playerid,2,1254,1,0.448984,0.065604,0.006619,4.313228,89.284942,0.000000,1.000000,1.000000,1.000000); // killfrenzy - caveira
				}
				case 9:
				{
					SetPlayerAttachedObject(playerid,1,1242,1,0.090351,0.088730,-0.000036,0.000000,89.157951,0.000000,1.619548,1.000000,1.348966); // bodyarmour - colete
					SetPlayerAttachedObject(playerid,2,18735,1,0.000000,-0.479024,-1.590823,0.000000,0.000000,0.000000,13.498819,1.000000,0.678294); // vent2 - fumaçao

				}
				case 10:
				{
					SetPlayerAttachedObject(playerid,1,867,1,-0.213616,-0.444311,0.070721,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000); // p_rubble04col - pedras
					SetPlayerAttachedObject(playerid,2,18742,1,0.036487,-1.759890,1.772809,225.616638,1.132580,0.677276,1.000000,1.000000,1.000000); // water_speed - explosaoaquatica
				}
				case 11:
				{
					SetPlayerAttachedObject(playerid,1,19065,15,-0.025,-0.04,0.23,0,0,270,2,2,2); // Toca de Natal
					SetPlayerAttachedObject(playerid,2,18864,1,2.178843,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000); // FakeSnow1 - neve
				}
			}
		}
	}
	return 1;
}

// ativar key
stock CheckKeyExist(playerid, Key[])
{
	new file[70];
	format(file, 70, "%s/%s", PASTA_KEYS, Key);
	if(!DOF2_FileExists(file)) return SendClientMessage(playerid, VERMELHO, "ERRO: Key inexistente.");

	new ValorDias = DOF2_GetInt(file, "Dias");
	new Nivel = DOF2_GetInt(file, "Nivel");
	SetVip(playerid, Nivel, ValorDias);

	DOF2_RemoveFile(file);
	return 1;
}

stock KeyCreated(playerid, Key[], Dias, Nivel)
{
	new MsgKeyVip[70];
	format(MsgKeyVip, sizeof MsgKeyVip, "Nova Key: [%s] - DIAS: [%d] - NIVEL: [%d]", Key, Dias, Nivel);
	SendClientMessage(playerid, LARANJA, MsgKeyVip);
	return 1;
}

stock KeyDeleted(playerid, Key[])
{
	new MsgKeyVip[60];
	format(MsgKeyVip, sizeof MsgKeyVip, "ADMIN: A key %s foi removida com sucesso.", Key);
	SendClientMessage(playerid, LARANJA, MsgKeyVip);
	return 1;
}

// verificar dias
forward CheckVip();
public CheckVip()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][Vip] == 1)
		{
			if(PlayerInfo[i][TempoVip] > 0)
			{
				PlayerInfo[i][TempoVip] = gettime() - ExpireVIP(i);
				} else {
				RemoveVip(i);
			}
		}
	}
	return 1;
}

ExpireVIP(playerid)
{
	new Dias = PlayerInfo[playerid][DiasVip] * 86400; // 86400 == 24horas
	return Dias;
}

LiberarKit(playerid)
{
	SendClientMessage(playerid, COR_VIP, "C-VIP: Voce ja pode pegar seu KIT-VIP novamente!");
	PlayerInfo[playerid][PegouKit] = false;
}

LiberarColete(playerid)
{
	SendClientMessage(playerid, COR_VIP, "C-VIP: Voce ja pode pegar seu COLETE-VIP novamente!!");
	PlayerInfo[playerid][PegouColete] = false;
}

VerificarNivelVip(playerid, lvl)
{
	if(PlayerInfo[playerid][Vip] < lvl)
	{
		new MsgErro[30];
		format(MsgErro, sizeof(MsgErro), "ERRO: Comando indisponivel. Vip %d+", lvl);
		SendClientMessage(playerid, VERMELHO, MsgErro);
		return 0;
	}
	return 1;
}

PosicaoFrentePlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos( playerid, x, y, a);
	GetPlayerFacingAngle( playerid, a);
	if(GetPlayerVehicleID( playerid ))
	{
		GetVehicleZAngle(GetPlayerVehicleID( playerid ), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

ShowToys(playerid)
{
	new string[1700];
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu de Bombeiro {0088FF}Slot 1 \n"); // 0
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu de Policial {0088FF}Slot 1 \n"); //   1
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu Michael Jackson {0088FF}Slot 1 \n"); // 2
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu Operario {0088FF}Slot 1 \n"); // 3
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu de Funkeiro {0088FF}Slot 1 \n"); // 4
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu de Veio {0088FF}Slot 1 \n"); // 5
	strcat(string, "{FFFF00}-{FFFFFF} Chapeu do Harry Potter {0088FF}Slot 1 \n"); // 6
	strcat(string, "{FFFF00}-{FFFFFF} Bolsa de sequestrador {0088FF}Slot 1 \n");// 7
	strcat(string, "{FFFF00}-{FFFFFF} Fones de ouvido {0088FF}Slot 1 \n");// 8
	strcat(string, "{FFFF00}-{FFFFFF} Loro Jose Gigante {0088FF}Slot 1 \n");// 9
	strcat(string, "{FFFF00}-{FFFFFF} Loro Jose menor (Ombro) {0088FF}Slot 2 \n");// 10
	strcat(string, "{FFFF00}-{FFFFFF} Tapa olho de pirata {0088FF}Slot 2 \n");// 11
	strcat(string, "{FFFF00}-{FFFFFF} Dildo {0088FF}Slot 2\n");// 12
	strcat(string, "{FFFF00}-{FFFFFF} Cabeca de galo {0088FF}Slot 1 \n");// 13
	strcat(string, "{FFFF00}-{FFFFFF} Cabeca de galo gigante Slot 1 \n");// 14
	strcat(string, "{FFFF00}-{FFFFFF} Cervo {0088FF}Slot 1 \n");// 15
	strcat(string, "{FFFF00}-{FFFFFF} Chifre de boi 1 {0088FF}Slot 1 \n");// 16
	strcat(string, "{FFFF00}-{FFFFFF} Chifre de boi 2 {0088FF}Slot 1 \n");// 17
	strcat(string, "{FFFF00}-{FFFFFF} Fanstasia de obobora {0088FF}Slot 1 \n");// 18
	strcat(string, "{FFFF00}-{FFFFFF} Cabecao do CJ {0088FF}Slot 1 \n"); // 19
	strcat(string, "{FFFF00}-{FFFFFF} Golfinho {0088FF}Slot 1 \n"); // 20
	strcat(string, "{FFFF00}-{FFFFFF} Tubarao {0088FF}Slot 1 \n"); // 21
	strcat(string, "{FFFF00}-{FFFFFF} Fantasia de tartaruga {0088FF}Slot 1 \n"); // 22
	strcat(string, "{FFFF00}-{FFFFFF} Vaca {0088FF}Slot 1 \n"); // 23
	strcat(string, "{FFFF00}-{FFFFFF} Colete no corpo {0088FF}Slot 2 \n");// 24
	strcat(string, "{FFFF00}-{FFFFFF} Coracao no peito {0088FF}Slot 2 \n");// 25
	strcat(string, "{FFFF00}-{FFFFFF} C4 nas costas {0088FF}Slot 2 \n");// 26
	strcat(string, "{FFFF00}-{FFFFFF} M4 nas costas  {0088FF}Slot 2 \n");// 27
	strcat(string, "{FFFF00}-{FFFFFF} Bazzuka nas costas  {0088FF}Slot 2 \n");// 28
	strcat(string, "{FFFF00}-{FFFFFF} Toca do Papai Noel  {0088FF}Slot 1 \n");// 29
	strcat(string, "{FFFF00}-{FFFFFF} Dado na cabeca  {0088FF}Slot 1 \n");// 30
	strcat(string, "{FFFF00}-{FFFFFF} C4 no peito  {0088FF}Slot 2 \n");// 31
	ShowPlayerDialog(playerid, DIALOG_TOYS, DIALOG_STYLE_LIST, "C-VIP: Selecione para adicionar a seu skin:", string, "APLICAR", "SAIR");
	return 1;
}

ShowEfects(playerid)
{
	new string[800];
	strcat(string, "{FFFF00}-{FFFFFF} Fogo na Skin {0088FF}Slot 1\n"); // 0
	strcat(string, "{FFFF00}-{FFFFFF} Explosao Aquatica {0088FF}Slot 1\n"); //   1
	strcat(string, "{FFFF00}-{FFFFFF} Neve {0088FF}Slot 1\n"); // 2
	strcat(string, "{FFFF00}-{FFFFFF} Pedras {0088FF}Slot 1\n"); // 3
	strcat(string, "{FFFF00}-{FFFFFF} Caveira {0088FF}Slot 1\n"); // 4
	strcat(string, "{FFFF00}-{FFFFFF} Colete {0088FF}Slot 1\n"); // 5
	strcat(string, "{FFFF00}-{FFFFFF} Fumaca {0088FF}Slot 1\n"); // 6
	strcat(string, "{FFFF00}-{FFFFFF} Touca de Natal {0088FF}Slot 1\n");// 7
	strcat(string, "{FFFF00}-{FFFFFF} Caveira e Fogo {0088FF}Slot 1 e 2\n");// 8
	strcat(string, "{FFFF00}-{FFFFFF} Colete e Fumaca {0088FF}Slot 1 e 2\n");// 9
	strcat(string, "{FFFF00}-{FFFFFF} Pedras e Explosao Aquatica {0088FF}Slot 1 e 2\n");// 10
	strcat(string, "{FFFF00}-{FFFFFF} Touca de Natal e Neve {0088FF}Slot 1 e 2\n");// 11
	ShowPlayerDialog(playerid, DIALOG_EFECTS, DIALOG_STYLE_LIST, "C-VIP: Selecione para adicionar a seu skin:", string, "APLICAR", "SAIR");
	return 1;
}

forward SendVipMessageToAll(playerid, const string[]);
public SendVipMessageToAll(playerid, const string[])
{
	switch(PlayerInfo[playerid][Vip])
	{
		case 1: SendClientMessageToAll(BRONZE, string);
		case 2: SendClientMessageToAll(PRATA, string);
		case 3: SendClientMessageToAll(OURO, string);
	}
	return 1;
}

forward ChatVIP(const string[]);
public ChatVIP(const string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][Vip] > 0)
		{
			switch(PlayerInfo[i][Vip])
			{
				case 1: SendClientMessage(i, BRONZE, string);
				case 2: SendClientMessage(i, PRATA, string);
				case 3: SendClientMessage(i, OURO, string);
			}
		}
	}
	return 1;
}

// ==================== Comandos VIP nivel 1

CMD:comandosvip(playerid)
{
	//if(!VerificarNivelVip(playerid, 1)) return 1;
	new String[800];
	strcat(String, "{FFFFFF}.: COMANDOS VIP {8B5A2B}BRONZE{FFFFFF} :.\n\n");
	strcat(String, "{8B5A2B} /v {FFFFFF}- Falar no modo VIP\n");
	strcat(String, "{8B5A2B} /cv {FFFFFF}- Falar no chat VIP\n");
	strcat(String, "{8B5A2B} /souvip {FFFFFF}- Ostentar seu VIP\n");
	strcat(String, "{8B5A2B} /venc {FFFFFF}- Ver vencimento do seu VIP\n\n\n");
	strcat(String, "{FFFFFF}.: COMANDOS VIP {9C9C9C}PRATA{FFFFFF} :.\n\n");
	strcat(String, "{9C9C9C} /vkit {FFFFFF}- Pegar KIT-VIP\n");
	strcat(String, "{9C9C9C} /vcolete {FFFFFF}- Colocar um colete\n");
	strcat(String, "{9C9C9C} /vjetpack {FFFFFF}- Criar um jetpack\n");
	strcat(String, "{9C9C9C} /vreparar {FFFFFF}- Reparar um veiculo\n\n\n");
	strcat(String, "{FFFFFF}.: COMANDOS VIP {EEC900}OURO{FFFFFF} :.\n\n");
	strcat(String, "{EEC900} /vcar {FFFFFF}- Criar carro VIP\n");
	strcat(String, "{EEC900} /vbike {FFFFFF}- Criar moto VIP\n");
	strcat(String, "{EEC900} /efeitos {FFFFFF}- Abre um menu de efeitos VIP\n");
	strcat(String, "{EEC900} /brinquedos {FFFFFF}- Abre um menu de brinquedos VIP\n");
	ShowPlayerDialog(playerid, DIALOG_COMANDOS_VIP, DIALOG_STYLE_MSGBOX, "{EEC900}C-VIP: - Comandos VIP", String, "Fechar", #);
	return 1;
}

CMD:venc(playerid)
{
	if(!VerificarNivelVip(playerid, 1)) return 1;
	new String[256], Str[128];
	format(Str, sizeof(Str), "{ffffff}NICK: {008B00}%s{FFFFFF} [{008B00}%d{FFFFFF}]   -   ", Nome(playerid), playerid);
	strcat(String, Str);
	format(Str, sizeof(Str), "{ffffff}VENCIMENTO EM: {008B00}%d {FFFFFF}DIAS\n\n", PlayerInfo[playerid][DiasVip]);
	strcat(String, Str);
	ShowPlayerDialog(playerid, DIALOG_VENC_VIP, DIALOG_STYLE_MSGBOX, "{EEC900}C-VIP: - Vencimento VIP ", String, "Fechar", #);
	return 1;
}

CMD:cv(playerid, params[])
{
	if(!VerificarNivelVip(playerid, 1)) return 1;
	new texto[100], String[128];
	if(sscanf(params, "s", texto)) return SendClientMessage(playerid, CINZA, "Use: /cv [texto]");
	if(strval(texto) > 100) return SendClientMessage(playerid, VERMELHO, "ERRO: Texto muito grande, diminua por favor!");
	format(String, sizeof(String), "%s {FFFF00}.:CHAT-VIP:.{FFFFFF} %s", Nome(playerid), texto);
	ChatVIP(String);
	return 1;
}

CMD:souvip(playerid)
{
	if(!VerificarNivelVip(playerid, 1)) return 1;
	new String[60];
	format(String, sizeof(String), "-VIP >> %s: Eu sou VIP, entao me chupa!", Nome(playerid));
	SendVipMessageToAll(playerid, String);
	return 1;
}

CMD:v(playerid, params[])
{
	if(!VerificarNivelVip(playerid, 1)) return 1;
	new texto[100], String[128];
	if(sscanf(params, "s", texto)) return SendClientMessage(playerid, CINZA, "Use: /v [Texto]");

	format(String, sizeof(String), "-VIP >> %s: %s", Nome(playerid), texto);
	SendVipMessageToAll(playerid, String);
	return 1;
}

// ======================================================


// ==================== Comandos VIP nivel 2
CMD:vjetpack(playerid)
{
	if(!VerificarNivelVip(playerid, 2)) return 1;
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, VERMELHO, "ERRO: Voce nao pode utilizar esse comando em um veiculo!");
	SendClientMessage(playerid, COR_VIP, "C-VIP: Jetpack criado com sucesso!");
	SetPlayerSpecialAction(playerid, 2);
	return 1;
}

CMD:vcolete(playerid)
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	if(PlayerInfo[playerid][PegouColete] == true) return SendClientMessage(playerid, VERMELHO, "ERRO: Voce ja pegou seu COLETE-VIP recentemente!");
	SendClientMessage(playerid, COR_VIP, "C-VIP: Colete criado com sucesso!");
	SetPlayerArmour(playerid, 100.0);
	PlayerInfo[playerid][PegouColete] = true;
	return 1;
}

CMD:vkit(playerid)
{
	if(!VerificarNivelVip(playerid, 2)) return 1;
	if(PlayerInfo[playerid][PegouKit] == true) return SendClientMessage(playerid, VERMELHO, "ERRO: Voce ja pegou seu KIT-VIP recentemente!");
	SendClientMessage(playerid, COR_VIP, "C-VIP: Voce pegou seu KIT-VIP com sucesso!");
	GivePlayerWeapon(playerid,  4, 99999);
	GivePlayerWeapon(playerid, 24, 99999);
	GivePlayerWeapon(playerid, 26, 99999);
	GivePlayerWeapon(playerid, 31, 99999);
	GivePlayerWeapon(playerid, 32, 99999);
	GivePlayerWeapon(playerid, 34, 99999);

	PlayerInfo[playerid][PegouKit] = true;
	return 1;
}

CMD:vreparar(playerid)
{
	if(!VerificarNivelVip(playerid, 2)) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, VERMELHO, "ERRO: Voce nao pode utilizar esse comando fora de um veiculo!");
	SendClientMessage(playerid, COR_VIP, "C-VIP: Veiculo reparado com sucesso!");
	RepairVehicle(GetPlayerVehicleID(playerid));
	return 1;
}

// ======================================================


// ==================== Comandos VIP nivel 3

CMD:vcar(playerid, params[])
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	new	Cor1, Cor2, idcarro;
	if(sscanf(params, "ii", Cor1, Cor2)) return SendClientMessage(playerid, CINZA, "Use: /vcar [Cor1] [Cor2]");
	new Float:X, Float:Y, Float:Z, Float:X1, Float:Y1, Float:A;
	PosicaoFrentePlayer(playerid, X, Y, 3);
	GetPlayerPos(playerid, X1, Y1, Z);
	GetPlayerFacingAngle(playerid, A);
	idcarro = AddStaticVehicle(411, X, Y, Z, A+90, Cor1, Cor2);
	CarrosCriados[TodosCarros] = idcarro;
	TodosCarros ++;
	SendClientMessage(playerid, COR_VIP, "C-VIP: Veiculo VIP criado com sucesso!");
	return 1;
}

CMD:vbike(playerid, params[])
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	new	Cor1, Cor2, idcarro;
	if(sscanf(params, "ii", Cor1, Cor2)) return SendClientMessage(playerid, CINZA, "Use: /vbike [Cor1] [Cor2]");
	new Float:X, Float:Y, Float:Z, Float:X1, Float:Y1, Float:A;
	PosicaoFrentePlayer(playerid, X, Y, 3);
	GetPlayerPos(playerid, X1, Y1, Z);
	GetPlayerFacingAngle(playerid, A);
	idcarro = AddStaticVehicle(522, X, Y, Z, A+90, Cor1, Cor2);
	CarrosCriados[TodosCarros] = idcarro;
	TodosCarros ++;
	SendClientMessage(playerid, COR_VIP, "C-VIP: Moto VIP criada com sucesso!");
	return 1;
}

CMD:brinquedos(playerid)
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, VERMELHO, "ERRO: Voce nao pode utilizar esse comando em um veiculo!");
	SendClientMessage(playerid, COR_VIP, "C-VIP: Lista de Brinquedos.");
	ShowToys(playerid);
	return 1;
}

CMD:tbrinquedos(playerid)
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	for(new i=0; i< MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
	}
	SendClientMessage(playerid, COR_VIP, "C-VIP: Brinquedos removidos com sucesso!");
	return 1;
}

CMD:efeitos(playerid)
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, VERMELHO, "ERRO: Voce nao pode utilizar esse comando em um veiculo!");
	SendClientMessage(playerid, COR_VIP, "C-VIP: Lista de Efeitos.");
	ShowEfects(playerid);
	return 1;
}

CMD:tefeitos(playerid)
{
	if(!VerificarNivelVip(playerid, 3)) return 1;
	RemovePlayerAttachedObject(playerid, 1); // Remocao dos Efeitos
	RemovePlayerAttachedObject(playerid, 2); // Remocao dos Efeitos2
	SendClientMessage(playerid, COR_VIP, "C-VIP: Efeitos removidos com sucesso!");
	return 1;
}

// ======================================================


// ==================== Comandos PLAYER

CMD:ativarvip(playerid)
{
	SendClientMessage(playerid, COR_VIP, "C-VIP: Adicione uma Key valida para ativar o VIP.");
	ShowPlayerDialog(playerid, DIALOG_ENABLE_KEY, DIALOG_STYLE_INPUT, "VIP", "\nNos informe sua key para ativar seu beneficio VIP:\n\n", "Ativar", "Sair");
	return 1;
}

CMD:vips(playerid)
{
	new ContVIP = 0, String[1000], Str[128];
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][Vip] > 0)
		{
			format(Str, sizeof(Str), ".:: VIP ON ::.  {008B00}%s {FFFFFF}   [{008B00}%i{FFFFFF}]\n", Nome(i), i);
			strcat(String, Str);
			ContVIP++;
		}
	}
	if(ContVIP == 0)
	{
		ShowPlayerDialog(playerid, DIALOG_VIPS, DIALOG_STYLE_MSGBOX, "{EEC900}C-VIP: - VIPs Online", "{FF0000}Nenhum VIP online no momento!", "Fechar", #);
	} else {
		ShowPlayerDialog(playerid, DIALOG_VIPS, DIALOG_STYLE_MSGBOX, "{EEC900}C-VIP: - VIPs Online", String, "Fechar", #);
	}
	return 1;
}
// ======================================================


// ==================== Comandos ADMIN RCON

CMD:criarkey(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, VERMELHO,"ERRO: Comando indisponivel. Admin RCON");
	ShowPlayerDialog(playerid, DIALOG_NEW_KEY, DIALOG_STYLE_INPUT, "KEYS VIP", "\nDigite uma nova key valida\n{FFFF00}Apenas letras sao aceitas:\n\n", "Criar", "Cancelar");
	return 1;
}

CMD:removerkey(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, VERMELHO,"ERRO: Comando indisponivel. Admin RCON");
	ShowPlayerDialog(playerid, DIALOG_REMOVE_KEY, DIALOG_STYLE_INPUT, "KEYS VIP", "\nDigite a Key que deseja Remover:\n\n", "Remover", "Cancelar");
	return 1;
}

CMD:darvip(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, VERMELHO,"ERRO: Comando indisponivel. Admin RCON");
	new Nivel, Dias, ID;
	if(sscanf(params, "udd", ID, Nivel, Dias)) return SendClientMessage(playerid, CINZA, "ADMIN: Use /darvip [ID] [Nivel] [Dias]");
	if(Nivel < 1 || Nivel > 3) return SendClientMessage(playerid, VERMELHO, "ERRO: Nivel Invalido! Disponivel de 1 a 3.");
	if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, VERMELHO, "ERRO: Jogador nao conectado.");
	SendClientMessage(playerid, LARANJA, "ADMIN: Comando efetuado com sucesso !");
	SetVip(ID, Nivel, Dias);
	return 1;
}

CMD:removervip(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, VERMELHO,"ERRO: Comando indisponivel. Admin RCON");
	new Motivo[100], Msg[128], ID;
	if(sscanf(params, "us", ID, Motivo)) return SendClientMessage(playerid, CINZA, "ADMIN: Use /tirarvipmysql_escape_string() [ID] [Motivo]");
	if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, VERMELHO, "ERRO: Jogador nao conectado.");
	format(Msg, sizeof Msg, "C-VIP: O admin %s retirou seu VIP. Motivo: %s.", Nome(playerid), Motivo);
	SendClientMessage(ID, COR_VIP, Msg);
	RemoveVip(ID);
	SendClientMessage(playerid, LARANJA, "ADMIN: Comando efetuado com sucesso !");
	return 1;
}

CMD:respawn(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, VERMELHO,"ERRO: Comando indisponivel. Admin RCON");
	new String[70];
	format(String, sizeof(String), "ADMIN: O Admin %s deu respawn em todos os veiculos VIP criados!", Nome(playerid));
	SendClientMessageToAll(LARANJA, String);
	SendClientMessage(playerid, LARANJA, "ADMIN: Todos os veiculos VIP criados foram destruidos!");
	for(new i = 0; i < sizeof(CarrosCriados); i++) DestroyVehicle(CarrosCriados[i]);
	return 1;
}
// ======================================================

stock FileVip(playerid)
{
	new file[24];
	format(file, 24, "%s/%s", PASTA_VIPS, Nome(playerid));
	return file;
}