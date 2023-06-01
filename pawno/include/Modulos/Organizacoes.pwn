#define PASTA_ORGS   "NL/Organizacoes"
#define MAX_ORGS	30

CMD:darlider(playerid, params[])
{
	new id, org;
	if(pDados[playerid][Admin] < 4) return SendClientMessage(playerid, VERMELHO, "| ERRO |Voce nao e administrador para poder utilizar este comando ");
	if(sscanf(params, "dd", id, org)) return SendClientMessage(playerid, VERMELHO, "| Use | /darlider [playerid] [id da org]");
	if(org < MAX_ORGS) return SendClientMessage(playerid, VERMELHO, "| ERRO | O ID digitado e invalido!");
	if(IsPlayerConnected(id)) return SendClientMessage(playerid, VERMELHO, "| ERRO | O jogador nao esta online! ");
	
	pDados[id][Lider] = 1;
	pDados[id][Membro] = org;

	new file[50];
	DOF2_SetInt(File(playerid), "Lider", 1);
	DOF2_SetInt(File(playerid), "MembroORG", org);
	format(file, 50, "%s/%d", PASTA_ORGS, org);
	if(!DOF2_FileExists(file)) DOF2_CreateFile(file);
	DOF2_SetString(file, "Lider", Nome(playerid));
	DOF2_SaveFile();
	return 1;
}

CMD:tirarlider(playerid, params[])
{
	new id;
	if(pDados[playerid][Admin] < 4) return SendClientMessage(playerid, VERMELHO, "| ERRO |Voce nao e administrador para poder utilizar este comando ");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, VERMELHO, "| Use | /tirarlider [playerid]");
	if(IsPlayerConnected(id)) return SendClientMessage(playerid, VERMELHO, "| ERRO | O jogador nao esta online!");

	new file[50];
	DOF2_SetInt(File(playerid), "Lider", 0);
	DOF2_SetInt(File(playerid), "MembroORG", 0);
	format(file, 50, "%s/%d", PASTA_ORGS, pDados[id][Membro]);
	if(!DOF2_FileExists(file)) DOF2_CreateFile(file);
	DOF2_SetString(file, "Lider", "Ninguem");
	DOF2_SaveFile();

	pDados[id][Lider] = 0;
	pDados[id][Membro] = 0;
	return 1;
}

#define PASTA   "Organizacoes"
#define MAX_ORG	30

CMD:darsublider(playerid, params[])
{
	new id, org;
	if(pDados[playerid][Admin] < 4) return SendClientMessage(playerid, VERMELHO, "| ERRO |Voce nao e administrador para poder utilizar este comando ");
	if(sscanf(params, "dd", id, org)) return SendClientMessage(playerid, VERMELHO, "| Use | /darsublider [playerid] [id da org]");
	if(org < MAX_ORGS) return SendClientMessage(playerid, VERMELHO, "| ERRO | O ID digitado e invalido!");
	if(IsPlayerConnected(id)) return SendClientMessage(playerid, VERMELHO, "| ERRO | O jogador nao esta online! ");
	
	pDados[id][SubLider] = 1;
	pDados[id][Membro] = org;

	new file[50];
	DOF2_SetInt(File(playerid), "SubLider", 1);
	DOF2_SetInt(File(playerid), "MembroORG", org);
	format(file, 50, "%s/%d.ini", PASTA_ORGS, org);
	if(!DOF2_FileExists(file)) DOF2_CreateFile(file);
	DOF2_SetString(file, "SubLider", Nome(playerid));
	DOF2_SaveFile();
	return 1;
}

CMD:tirarsublider(playerid, params[])
{
	new id;
	if(pDados[playerid][Admin] < 4) return SendClientMessage(playerid, VERMELHO, "| ERRO |Voce nao e administrador para poder utilizar este comando ");
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, VERMELHO, "| Use | /tirarsublider [playerid]");
	if(IsPlayerConnected(id)) return SendClientMessage(playerid, VERMELHO, "| ERRO | O jogador nao esta online!");

	new file[50];
	DOF2_SetInt(File(playerid), "SubLider", 0);
	DOF2_SetInt(File(playerid), "MembroORG", 0);
	format(file, 50, "%s/%d.ini", PASTA_ORGS, pDados[id][Membro]);
	if(!DOF2_FileExists(file)) DOF2_CreateFile(file);
	DOF2_SetString(file, "SubLider", "Ninguem");
	DOF2_SaveFile();

	pDados[id][Lider] = 0;
	pDados[id][Membro] = 0;
	return 1;
}

CMD:convidar(playerid, params[])
{
	return 1;
}