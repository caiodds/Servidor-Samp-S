#include <y_hooks>

#define Dial_conseTX 9577
#define Diag_Menu_Car 9578
#define NIDConseCarsC1 9579
#define NIDConseCarsC3 9580
#define NIDConseCarsC2 9581
#define NIDConseCarsC5 9582
#define NIDConseCSell  9583
#define NIDConseCor  9584
#define SellCarPlyPly 9585
#define QntSlotCar 5

new SVCarPLAYER[QntSlotCar][MAX_PLAYERS],SvCarCOR[QntSlotCar][MAX_PLAYERS];
new SVC_Localizar[MAX_PLAYERS],SvSelcCar[MAX_PLAYERS],pAceitar[MAX_PLAYERS][3],pTrancarCAR[MAX_VEHICLES];

static vehName[212][] ={
    {"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
    {"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
    {"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
    {"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
    {"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
    {"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
    {"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
    {"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
    {"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
    {"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
    {"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
    {"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
    {"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
    {"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
    {"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
    {"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
    {"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
    {"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
    {"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
    {"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
    {"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
    {"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
    {"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
    {"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
    {"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
    {"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},
    {"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
    {"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
    {"Utility Trailer"}
};

static const ValorDosCarros[][] =//CONFS CARROS DA CONSE
{//  VALOR ,ID,Categoria, Modelo nome
    {10000000,411,0,"infernus"},
    {10000000,451,0,"turismo"},
    {162000,541,1,"Bullet"},
    {125000,429,3,"Banshee"},
    {73500,567,3,"Savanna"},
    {90000,402,1,"Buffalo"},
    {80000,559,1,"Jester"},
    {79500,560,1,"Sultan"},
    {82000,412,4,"Voodoo"},
    {70000,439,4,"Stallion"},
    {53780,549,4,"Tampa"},
    {65000,496,2,"Blista"},
    {70000,445,2,"Admiral"},
    {69500,401,2,"Bravura"},
    {51000,542,2,"Clover"},
    {85000,489,7,"Rancher"},
    {89000,554,7,"Yosemite"},
    {65000,422,6,"Bobcat"},
    {250000,522,11,"NRG-500"},
    {180000,461,11,"PCJ-600"},
    {150000,521,11,"FCR-900"},
    {50000,468,11,"Sanchez"}
};
static const ConfgTipoCarrs[][] ={//Nome das Categorias
	{"SuperEsportivo"},//0
	{"Esportivo"},//1
	{"Popular"},//2
	{"Conversivel"},//3
	{"Classico"},//4
	{"Corrida"},//5
	{"Picape"},//6
	{"Caminhonete"},//7
	{"Van"},//8
	{"Caminhão"},//9
	{"Careta"},//10
	{"Moto"},//11
	{"VIP"}//12
};

static QntCarsConse = sizeof(ValorDosCarros);

hook OnPlayerDisconnect(playerid, reason)
{
    DestroyVehicle(SVCarPLAYER[i][playerid]);
    SVCarPLAYER[i][playerid] = 0;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
new string[2800];
   if(dialogid == Dial_conseTX){
		SvSelcCar[playerid] = listitem-1;
		new StrChatADM[500];
        strcat(StrChatADM, "{FFFFFF}Preto\n");
        strcat(StrChatADM, "Branco\n");
        strcat(StrChatADM, "Azul Claro\n");
        strcat(StrChatADM, "Vermelho\n");
        strcat(StrChatADM, "Cinza\n");
        strcat(StrChatADM, "Roxo Claro\n");
        strcat(StrChatADM, "Amarelo\n");
        strcat(StrChatADM, "Azul Céu\n");
        strcat(StrChatADM, "Metalido\n");
        strcat(StrChatADM, "Cinza Escuro\n");
		ShowPlayerDialog(playerid, NIDConseCor, DIALOG_STYLE_LIST, "Seleciona a cor", StrChatADM, "Ok", "Cancelar");
    }
    if(dialogid == SellCarPlyPly){
		if(response){
			new xPlayer,xValor,xSlot,playername[32],stringcar[128];
			if(sscanf(inputtext,"iii",xPlayer,xSlot,xValor)) return SendClientMessage(playerid , 0xFF0000FF , "Uso Correto /vendercarro [playerid][Slot][Valor]");
			if(SVCarPLAYER[xSlot][playerid] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Você não está com o seu veiculo Spawnado!");
			if(!IsPlayerConnected(xPlayer)) return SendClientMessage(playerid, 0xFFFFFFFF, "Este jogador não esta conectado!");
		    new Float:PosP[3]; GetPlayerPos(xPlayer,PosP[0],PosP[1],PosP[2]);
		    if(!IsPlayerInRangeOfPoint(playerid,5.0,PosP[0],PosP[1],PosP[2])) return SendClientMessage(playerid,0xFFFFFFFF,"Este jogador nao esta proximo a voce!");
			new path[50],StrCAR[24];
			path = SaveCarNomePlay(xPlayer);
			format(StrCAR, sizeof(StrCAR), "CarID_%i", xSlot);
			new SCCarid = DOF2_GetInt(path,StrCAR);
			if(SCCarid < 400) return SendClientMessage(playerid, 0xFFFFFFFF, "Voce nao possui nenhum veiculo neste slot!");
			pAceitar[xPlayer][0] = xValor;//Valor do Veiculo
			pAceitar[xPlayer][1] = playerid;//ID do jogador que vendeu
			pAceitar[xPlayer][2] = xSlot;//SLOT
	        GetPlayerName(playerid, playername, sizeof(playername));
	        format(stringcar, sizeof(stringcar), "[VEICULO]{FFFFFF} %s(%i) Quer te vender o veiculo (%s) por R$%i (/menucar, opção [7])", playername,playerid,vehName[SCCarid-400],xValor);
	        SendClientMessage(xPlayer, 0xFF0000FF, stringcar);
	        GetPlayerName(xPlayer, playername, sizeof(playername));
	        format(stringcar, sizeof(stringcar), "[VEICULO]{FFFFFF} Voce enviou uma solicitação de venda do veiculo (%s) para o %s(%i) por R$%i", vehName[SCCarid-400],playername,xPlayer,xValor);
	        SendClientMessage(playerid, 0xFF0000FF, stringcar);
		}
		return 1;
	}
	if(dialogid == NIDConseCor){
		if(response){
	        new stringcar[128],StrCAR[64],path[50],Slot = -1,DefCar = SvSelcCar[playerid], pCor = listitem;//
	     	if(GetPlayerMoney(playerid) < ValorDosCarros[DefCar][0]){
		        format(stringcar, sizeof(stringcar), "Voce nao tem dinheiro suficiente para comprar o %s(%i) por {33CC33}R$%i",ValorDosCarros[DefCar][2],ValorDosCarros[DefCar][1],ValorDosCarros[DefCar][0]);
		        return SendClientMessage(playerid, 0xFFFFFFFF, stringcar);
	     	}
	     	path = SaveCarNomePlay(playerid);
			for(new i = 0; i < QntSlotCar; i++){
				format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
				if(DOF2_GetInt(path,StrCAR) == 0){ Slot = i; break; }
			}
			if(Slot == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao tem Slots suficiente!");
			if(pCor < 0 || pCor > 255) return SendClientMessage(playerid, 0xFF0000FF, "Use cores de 0~255!");
			SvCarCOR[Slot][playerid] = pCor;
	        GivePlayerMoney(playerid,-ValorDosCarros[DefCar][0]);
	        DestroyVehicle(SVCarPLAYER[Slot][playerid]);
	        SVCarPLAYER[Slot][playerid] = AddStaticVehicleEx(ValorDosCarros[DefCar][1],2124.9561,-1132.2983,25.4612+5.0,350.3899,pCor,pCor,-1);
	        format(string, sizeof(string), "Voce comprou {00FCFC}%s(%i){FFFFFF} por {33CC33}R$%i!",ValorDosCarros[DefCar][3],ValorDosCarros[DefCar][1],ValorDosCarros[DefCar][0]);
	        SendClientMessage(playerid, 0xFFFFFFFF, string);
	        return 1;
		}
		return 1;
	}
	if(dialogid == NIDConseCSell){
		if(response){
			new SlcCAR = strval(inputtext),path[50],StrCAR[64],StrMsg[128],pModelo,pValor;
			path = SaveCarNomePlay(playerid);
			format(StrCAR, sizeof(StrCAR), "CarID_%i", SlcCAR);
			pModelo = DOF2_GetInt(path,StrCAR);
			pValor = floatround(ValorDosCarros[yChckVlrCar(pModelo)][0]/2);
			DOF2_SetInt(path,StrCAR,0);
			format(StrMsg, sizeof(StrMsg), "Voce vendeu o veiculo %s por {33CC33}R$%i", vehName[pModelo-400],pValor);
			SendClientMessage(playerid,0xFFFFFFFF,StrMsg);
			GivePlayerMoney(playerid,pValor);
		   	DestroyVehicle(SVCarPLAYER[SlcCAR][playerid]);
		   	SVCarPLAYER[SlcCAR][playerid] = 0;
		    DOF2_SaveFile();
		}
		return 1;
	}
	if(dialogid == NIDConseCarsC1){
		  	if(response){
					new SlcCAR = strval(inputtext);
					if(SlcCAR >= 5) return SendClientMessage(playerid, 0xFF0000AA, "Voce digitou um numero invalido!");
					new path[50],StrCAR[64], SCCarid, Float:PosSC[4];
	    			SCCarid = GetPlayerVehicleID(playerid);
					if(SCCarid != SVCarPLAYER[SlcCAR][playerid]) return SendClientMessage(playerid, 0xFF0000FF, "Este carro nao e seu, ou nao foi comprado!");
					path = SaveCarNomePlay(playerid);
					if(!DOF2_FileExists(path)) DOF2_CreateFile(path);
					GetVehiclePos(SCCarid, PosSC[0],PosSC[1],PosSC[2]);
					GetVehicleZAngle(SCCarid, PosSC[3]);
					format(StrCAR, sizeof(StrCAR), "CarID_%i", SlcCAR);
					DOF2_SetInt(path,StrCAR,GetVehicleModel(GetPlayerVehicleID(playerid)));
					format(StrCAR, sizeof(StrCAR), "PosX_%i", SlcCAR);
					DOF2_SetFloat(path,StrCAR,PosSC[0]);
					format(StrCAR, sizeof(StrCAR), "PosY_%i", SlcCAR);
					DOF2_SetFloat(path,StrCAR,PosSC[1]);
					format(StrCAR, sizeof(StrCAR), "PosZ_%i", SlcCAR);
					DOF2_SetFloat(path,StrCAR,PosSC[2]);
					format(StrCAR, sizeof(StrCAR), "PosA_%i", SlcCAR);
					DOF2_SetFloat(path,StrCAR,PosSC[3]);
					format(StrCAR, sizeof(StrCAR), "Cor_%i", SlcCAR);
					DOF2_SetInt(path,StrCAR,SvCarCOR[SlcCAR][playerid]);
					DOF2_SaveFile();
			        SendClientMessage(playerid, 0xFF0000FF, "voce estacionou seu carro aqui!");
	        }
	        return 1;
	}
	if(dialogid == NIDConseCarsC2){
	  	if(response){
		        new SlcCAR = strval(inputtext);
		        if(SlcCAR >= QntSlotCar) return SendClientMessage(playerid, 0xFF0000FF, "Voce digitou um numero invalido!");
		        if(SVCarPLAYER[SlcCAR][playerid] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao pegou seu veiculo.");
		        new Float:PosV[3],StrCAR[128];
		        GetVehiclePos(SVCarPLAYER[SlcCAR][playerid],PosV[0],PosV[1],PosV[2]);
		        if(floatround(PosV[0]) == 0 && floatround(PosV[1]) == 0){
		            SVCarPLAYER[SlcCAR][playerid] = 0;
		            format(StrCAR, sizeof(StrCAR), "Seu veiculo (%i) foi Sincronizado! Pegue novamente", SlcCAR);
		            SendClientMessage(playerid, 0xFFFF00FF, StrCAR);
		            return 1;
		        }
                SetPlayerCheckpoint(playerid, PosV[0],PosV[1],PosV[2], 6.0);
                format(StrCAR, sizeof(StrCAR), "Voce localizou o seu veiculo (%i)", SlcCAR);
                SendClientMessage(playerid, 0xFFFF00FF, StrCAR);
                SVC_Localizar[playerid] = 1;
        }
        TogglePlayerControllable(playerid, true);
        return 1;
	}
	if(dialogid == NIDConseCarsC3){
		  	if(response){
			        new SlcCAR = strval(inputtext);
			        if(SlcCAR >= 5) return SendClientMessage(playerid, 0xFF0000FF, "Voce digitou um numero invalido!");
			        if(SVCarPLAYER[SlcCAR][playerid] != 0) return SendClientMessage(playerid, 0xFF0000FF, "Voce ja pegou o veiculo deste slot!");
					new path[50],StrCAR[64], SCCarid, Float:PosSC[4];
					path = SaveCarNomePlay(playerid);
					format(StrCAR, sizeof(StrCAR), "CarID_%i", SlcCAR);
					SCCarid = DOF2_GetInt(path,StrCAR);
					format(StrCAR, sizeof(StrCAR), "PosX_%i", SlcCAR);
				   	PosSC[0] = DOF2_GetFloat(path,StrCAR);
				   	format(StrCAR, sizeof(StrCAR), "PosY_%i", SlcCAR);
				   	PosSC[1] = DOF2_GetFloat(path,StrCAR);
				   	format(StrCAR, sizeof(StrCAR), "PosZ_%i", SlcCAR);
				   	PosSC[2] = DOF2_GetFloat(path,StrCAR);
				   	format(StrCAR, sizeof(StrCAR), "PosA_%i", SlcCAR);
				   	PosSC[3] = DOF2_GetFloat(path,StrCAR);
					format(StrCAR, sizeof(StrCAR), "Cor_%i", SlcCAR);
					SvCarCOR[SlcCAR][playerid] = DOF2_GetInt(path,StrCAR);
				   	DestroyVehicle(SVCarPLAYER[SlcCAR][playerid]);
				   	SVCarPLAYER[SlcCAR][playerid] = AddStaticVehicleEx(SCCarid,PosSC[0],PosSC[1],PosSC[2],PosSC[3],SvCarCOR[SlcCAR][playerid],SvCarCOR[SlcCAR][playerid],-1);
				   	SetVehicleHealth(SVCarPLAYER[SlcCAR][playerid], 650.0);
				   	SendClientMessage(playerid, 0xFF0000FF, "Seu veiculo esta no local estacionado.");
	        }
	        TogglePlayerControllable(playerid, true);
	        return 1;
	}
	if(dialogid == NIDConseCarsC5){
		  	if(response){
			        new SlcCAR = strval(inputtext), StrCAR[128],Float:PosV[3];
			        if(SlcCAR >= 5) return SendClientMessage(playerid, 0xFF0000AA, "{6495ED}Voce digitou um numero invalido!");
			        if(SVCarPLAYER[SlcCAR][playerid] == 0) return SendClientMessage(playerid, 0xFF0000FF, "{6495ED}Voce nao pegou seu veiculo.");
			        if(AlguemNoCarro(SVCarPLAYER[SlcCAR][playerid]) == 1) return SendClientMessage(playerid, 0xFF0000FF,"Tem alguem dentro do seu veiculo!");
	                GetVehiclePos(SVCarPLAYER[SlcCAR][playerid],PosV[0],PosV[1],PosV[2]);
	                if(!IsPlayerInRangeOfPoint(playerid,20.0,PosV[0],PosV[1],PosV[2])) return SendClientMessage(playerid, 0xFF0000AA, "Voce nao esta perto o suficiente do seu veiculo!");
					DestroyVehicle(SVCarPLAYER[SlcCAR][playerid]);
	                format(StrCAR, sizeof(StrCAR), "Voce removeu seu veiuclo (%i)", SlcCAR);
	                SendClientMessage(playerid, 0xFF0000AA, StrCAR);
	                SVCarPLAYER[SlcCAR][playerid] = 0;
	        }
	        TogglePlayerControllable(playerid, true);
	        return 1;
	}
	if(dialogid == Diag_Menu_Car){
			    if(strcmp(inputtext, "1", true) == 0){
			        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao esta em um veiculo!");
					new path[50],StrCAR[24], FtrMV[64],StrMV[1000];
					strcat(StrMV, "{00FF00}Digite o numero do veiculo para ser estacionado\n\n");
					path = SaveCarNomePlay(playerid);
					strcat(StrMV, "\n{FF0000}Seus Carros comprados:\n\n");
					for(new i = 0; i < QntSlotCar; i++){
					        new DefCarSlot = GetVehicleModel(SVCarPLAYER[i][playerid]);
					        if(DefCarSlot >= 400){
								format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i)\n",i, vehName[DefCarSlot-400],DefCarSlot);
								strcat(StrMV, FtrMV);
							}
					}
					strcat(StrMV, "\n{FF0000}Seus Carros Salvos:\n\n");
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						new SCCarid = DOF2_GetInt(path,StrCAR);
						if(SCCarid >= 400){
							format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i)\n",i, vehName[SCCarid-400],SCCarid);
							strcat(StrMV, FtrMV);
						}
					}
			        ShowPlayerDialog(playerid, NIDConseCarsC1, DIALOG_STYLE_INPUT, "Estacionar Veiculo", StrMV, "OK", "Cancelar");
			    }
			    else if(strcmp(inputtext, "2", true) == 0){
					new path[50],StrCAR[24], FtrMV[64],StrMV[1000];
					strcat(StrMV, "{00FF00}Digite o numero do veiculo a ser Spawnado\n\n");
					path = SaveCarNomePlay(playerid);
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						new SCCarid = DOF2_GetInt(path,StrCAR);
						if(SCCarid >= 400){
							format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i)\n",i, vehName[SCCarid-400],SCCarid);
							strcat(StrMV, FtrMV);
						}
					}
	                ShowPlayerDialog(playerid, NIDConseCarsC3, DIALOG_STYLE_INPUT, "Spawnar Veiculo", StrMV, "OK", "Cancelar");
			        return 1;
			    }
			    else if(strcmp(inputtext, "3", true) == 0){
					new path[50],StrCAR[24], FtrMV[64],StrMV[1000];
					strcat(StrMV, "{00FF00}Digite o numero do veiculo a ser localizado\n\n");
					path = SaveCarNomePlay(playerid);
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						new SCCarid = DOF2_GetInt(path,StrCAR);
						if(SCCarid >= 400){
							format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i)\n",i, vehName[SCCarid-400],SCCarid);
							strcat(StrMV, FtrMV);
						}
					}
			        ShowPlayerDialog(playerid, NIDConseCarsC2, DIALOG_STYLE_INPUT, "Localizar Veiculo", StrMV, "OK", "Cancelar");
			    }
			    else if(strcmp(inputtext, "4", true) == 0){
					new path[50],StrCAR[24], FtrMV[64],StrMV[1000];
					strcat(StrMV, "{00FF00}Digite o numero do veiculo para ser removido\n\n");
					path = SaveCarNomePlay(playerid);
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						new SCCarid = DOF2_GetInt(path,StrCAR);
						if(SCCarid >= 400){
							format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i)\n",i, vehName[SCCarid-400],SCCarid);
							strcat(StrMV, FtrMV);
						}
					}
	                ShowPlayerDialog(playerid, NIDConseCarsC5, DIALOG_STYLE_INPUT, "Remover Veiculo", StrMV, "OK", "Cancelar");
			        return 1;
			    }
			    else if(strcmp(inputtext, "5", true) == 0){
					new path[50],StrCAR[24], FtrMV[64],StrMV[1000];
					strcat(StrMV, "{00FF00}Digite o numero do veiculo para ser removido\n\n");
					path = SaveCarNomePlay(playerid);
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						new SCCarid = DOF2_GetInt(path,StrCAR);
						if(SCCarid >= 400){
							format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i) {33CC33}R$%i\n",i, vehName[SCCarid-400],SCCarid, floatround(ValorDosCarros[yChckVlrCar(SCCarid)][0]/2));
							strcat(StrMV, FtrMV);
						}
					}
	                ShowPlayerDialog(playerid, NIDConseCSell, DIALOG_STYLE_INPUT, "Vender Veiculo", StrMV, "OK", "Cancelar");
			        return 1;
			    }
			    else if(strcmp(inputtext, "6", true) == 0){
					new path[50],StrCAR[24], FtrMV[64],StrMV[1000];
					strcat(StrMV, "{00FF00}Digite o numero do veiculo para ser Vendio para outro player\n");
					strcat(StrMV, "{00FF00}Digite: [playerid][Slot][Valor]\n");
					path = SaveCarNomePlay(playerid);
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						new SCCarid = DOF2_GetInt(path,StrCAR);
						if(SCCarid >= 400){
							format(FtrMV, sizeof(FtrMV), "{FF6347}[%i]{FFFFFF} - %s(%i) {33CC33}R$%i\n",i, vehName[SCCarid-400],SCCarid, floatround(ValorDosCarros[yChckVlrCar(SCCarid)][0]/2));
							strcat(StrMV, FtrMV);
						}
					}
	                ShowPlayerDialog(playerid, SellCarPlyPly, DIALOG_STYLE_INPUT, "Vender Veiculo para outro jogador", StrMV, "OK", "Cancelar");
			        return 1;
			    }
			    else if(strcmp(inputtext, "7", true) == 0){
					new xValor = pAceitar[playerid][0], xPlayer = pAceitar[playerid][1], xSlot = pAceitar[playerid][2],	PegarNome[32], ySlot = -1,stringcar[128];
				    if(pAceitar[playerid][0] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Voce nao tem nenhuma solicitação de venda de veiculos!");
				    if(GetPlayerMoney(playerid) < xValor) return SendClientMessage(playerid, 0xFFFFFFFF, "Você não tem dinheiro suficiente!");
				    if(SVCarPLAYER[xSlot][xPlayer] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "O Veiculo do jogador nao esta Spawnado!");
					new path[50],StrCAR[24];
					path = SaveCarNomePlay(xPlayer);
					format(StrCAR, sizeof(StrCAR), "CarID_%i", xSlot);
					new SCCarid = DOF2_GetInt(path,StrCAR);
					if(SCCarid < 400) return SendClientMessage(playerid, 0xFFFFFFFF, "Este jogador nao possui mais este Veiculo!");
					for(new i = 0; i < QntSlotCar; i++){
						format(StrCAR, sizeof(StrCAR), "CarID_%i", i);
						if(DOF2_GetInt(path,StrCAR) == 0){ ySlot = i; break; }
					}
					if(ySlot == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao tem Slots suficiente!");
				    GivePlayerMoney(xPlayer,xValor);
				    GivePlayerMoney(playerid,-xValor);
	        		GetPlayerName(xPlayer, PegarNome, sizeof(PegarNome));
					format(string, sizeof(string), "Você comprou o veiculo (%s) do %s(%i) por R$%i", vehName[SCCarid-400],PegarNome,xPlayer,xValor);
					SendClientMessage(playerid, 0xFFFFFFFF, string);
					GetPlayerName(playerid, PegarNome, sizeof(PegarNome));
					format(stringcar, sizeof(stringcar), "Jogador %s(%i) comprou o seu veiculo (%s) por R$%i", vehName[SCCarid-400],PegarNome,playerid,xValor);
					SendClientMessage(xPlayer, 0xFFFFFFFF, stringcar);
					SVCarPLAYER[ySlot][playerid] = SVCarPLAYER[xSlot][xPlayer];
	  				path = SaveCarNomePlay(xPlayer);
					format(StrCAR, sizeof(StrCAR), "CarID_%i", xSlot);
					DOF2_SetInt(path,StrCAR,0);
					SVCarPLAYER[xSlot][xPlayer] = 0;
				    pAceitar[playerid][0] = 0;//VALOR
				    pAceitar[playerid][1] = 0;//PLAYERID
				    pAceitar[playerid][2] = 0;//SLOT
				    DOF2_SaveFile();
			        return 1;
			    }
			    else if(strcmp(inputtext, "8", true) == 0){
				    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xFF0000FF, "Você não está em um carro!");
					if(pTrancarCAR[GetPlayerVehicleID(playerid)] > 0) return SendClientMessage(playerid, 0xFF0000FF, "Este veiculo já esta trancado!");
					pTrancarCAR[GetPlayerVehicleID(playerid)] = playerid+1;
			    }
			    else if(strcmp(inputtext, "9", true) == 0){
					new veiculo = -1,Float:PosCar[3];
					for(new i = 0; i < 2000; i++){
					    GetVehiclePos(i,PosCar[0],PosCar[1],PosCar[2]);
					    if(IsPlayerInRangeOfPoint(playerid,5.0,PosCar[0],PosCar[1],PosCar[2])){ veiculo = i;break;}
					}
					if(veiculo == -1) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao esta proximo a nenhum veiculo!");
					if(pTrancarCAR[veiculo] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Este veiculo nao esta trancado!");
					if(pTrancarCAR[veiculo]-1 != playerid) return SendClientMessage(playerid, 0xFF0000FF, "Você não possui as chaves deste veiculo!");
					pTrancarCAR[veiculo] = 0;
			    }
    			else SendClientMessage(playerid, 0xFF0000FF, "Opcao Invalida!");
        		return 1;
    }

CMD:conse(playerid)
{
if(!IsPlayerInRangeOfPoint(playerid,2.0,2131.4729,-1149.9431,24.2078)) return SendClientMessage(playerid, 0xFF0000FF, "Voce nao esta no local!");
new StrChatADM[3500], string[128];
strcat(StrChatADM, "{33CC33}Modelo\t\tValor\t\tCategoria\n");
strcat(StrChatADM, "{FFFFFF}");
for(new i = 0; i < QntCarsConse; i++)
{
    format(string, sizeof(string), "%s(%i)\tR$%i\t%s\n",ValorDosCarros[i][3],ValorDosCarros[i][1],ValorDosCarros[i][0],ConfgTipoCarrs[ValorDosCarros[i][2]][0]);
    strcat(StrChatADM, string);
}
ShowPlayerDialog(playerid, Dial_conseTX, DIALOG_STYLE_LIST, "{66CC66}Concessionária de veiculos", StrChatADM, "Comprar", "Cancelar");
return 1;
}
CMD:menucar(playerid){
		new StrChatADM[500];
        strcat(StrChatADM, "{FF6347}[1]{FFFFFF} - Estacionar\n");
		strcat(StrChatADM, "{FF6347}[2]{FFFFFF} - Pegar o veiculo\n");
		strcat(StrChatADM, "{FF6347}[3]{FFFFFF} - Localizar\n");
		strcat(StrChatADM, "{FF6347}[4]{FFFFFF} - Remover\n");
		strcat(StrChatADM, "{FF6347}[5]{FFFFFF} - Vender\n");
		strcat(StrChatADM, "{FF6347}[6]{FFFFFF} - Vender para um jogador\n");
		strcat(StrChatADM, "{FF6347}[7]{FFFFFF} - Aceitar a compra de um veiculo\n");
		strcat(StrChatADM, "{FF6347}[8]{FFFFFF} - Trancar\n");
		strcat(StrChatADM, "{FF6347}[9]{FFFFFF} - Destrancar\n");
		ShowPlayerDialog(playerid, Diag_Menu_Car, DIALOG_STYLE_INPUT, "{66CC66}Menu Carros", StrChatADM, "Ok", "Cancelar");
        return 1;
}