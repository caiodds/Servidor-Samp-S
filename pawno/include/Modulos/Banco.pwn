#include    <YSI_Coding\y_hooks>

// --------

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_DEPOSITAR)
	{
		if(response)
		{
			new String[128];
			new Quantia;
			Quantia = strval(inputtext);
			
			if(Quantia > GetPlayerMoney(playerid)) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce nao pode depositar mais do que tem.");
			if(Quantia == 0) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce nao depositou nada.");
			
			GivePlayerMoney(playerid, -Quantia);
			pDados[playerid][SaldoBanco] = pDados[playerid][SaldoBanco] +Quantia;
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Voce depositou {1BC242}R$%d", Quantia);
			SendClientMessage(playerid, VERDE_CLARO, String);
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Seu novo saldo bancario e de {1BC242}R$%d ", pDados[playerid][SaldoBanco]);
			SendClientMessage(playerid, VERDE_CLARO, String);
		}
	}
	if(dialogid == DIALOG_SACAR)
	{
		if(response)
		{
			new String[128];
			new Quantia;
			Quantia = strval(inputtext);

			if(Quantia > pDados[playerid][SaldoBanco]) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce nao pode sacar mais do que tem em sua conta bancaria.");
			if(Quantia == 0) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce nao sacou nada!");
			
			GivePlayerMoney(playerid, Quantia);
			pDados[playerid][SaldoBanco] = pDados[playerid][SaldoBanco] -Quantia;
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Voce sacou {1BC242}R$%d", Quantia);
			SendClientMessage(playerid, VERDE_CLARO, String);
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Seu novo saldo Bancario e de {1BC242}R$%d ", pDados[playerid][SaldoBanco]);
			SendClientMessage(playerid, VERDE_CLARO, String);
		}
	}
	if(dialogid == DIALOG_IDTRANFERIR)
	{
		if(response)
		{
		    new IDx;
			IDx = strval(inputtext);
			if(!IsNumeric(inputtext)) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Digite um ID valido.");
			if(!IsPlayerConnected(IDx)) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Jogador offline.");
   			ShowPlayerDialog(playerid, DIALOG_IDTRANFERIR, DIALOG_STYLE_INPUT, "Transferencia", "Digite a quantidade que voce deseja transferir:", "Transferir", "Cancelar");
        }
		return 1;
    }
	if(dialogid == DIALOG_TRANSFERIR)
	{
		if(response)
		{
			new String[128];
			new Quantia;
			new IDx;
			Quantia = strval(inputtext);
			
			if(Quantia > pDados[playerid][SaldoBanco]) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce nao tem todo esse dinheiro em sua conta bancaria.");
			if(Quantia == 0) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce nao pode transferir R$0.");
			
			pDados[playerid][SaldoBanco] = pDados[playerid][SaldoBanco] -Quantia, pDados[IDx][SaldoBanco] = pDados[IDx][SaldoBanco] +Quantia;
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Voce transferiu {1BC242}R$%d para {1BC242}%s.", Quantia, Nome(IDx));
			SendClientMessage(playerid, VERDE_CLARO, String);
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Seu novo saldo bancario e de {1BC242}R$%d", pDados[playerid][SaldoBanco]);
			SendClientMessage(playerid, VERDE_CLARO, String);
			format(String, sizeof(String), "{19B0CF}[BANCO]: {FFFFFF}Voce acabou de receber uma transferencia bancaria do {1BC242}%s e ele transferiu {1BC242}R$%d.", Quantia, Nome(playerid));
			SendClientMessage(IDx, VERDE_CLARO, String);
		}
	}
	return 1;
}

hook OnPyCkPyTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == OpenBank[playerid][25]) return ShowPlayerDialog(playerid, DIALOG_DEPOSITAR, DIALOG_STYLE_INPUT, "Depositar", "Insira a quantiade que deseja depositar.", "Depositar", "Cancelar");
	if(playertextid == OpenBank[playerid][27]) return ShowPlayerDialog(playerid, DIALOG_SACAR, DIALOG_STYLE_INPUT, "Sacar", "Insira a quantiade que deseja sacar.", "Sacar", "Cancelar");
	if(playertextid == OpenBank[playerid][29]) return ShowPlayerDialog(playerid, DIALOG_IDTRANFERIR, DIALOG_STYLE_INPUT, "Transferir", "ID do player que Voce deseja fazer a transferencia banc�ria:", "Proximo", "Cancelar");
	if(playertextid == OpenBank[playerid][38]) return FecharTDBanco(playerid);
	    
	return 0;
}

//COMMANDOS
CMD:banco(playerid)
{
	if(pDados[playerid][ContaBanco] == 0) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce Nao Possui Uma Conta Bancaria! Digite /Abrirconta.");
    MostrarTDBanco(playerid);
	return 1;
}

CMD:abrirconta(playerid, params[])
{
	if(pDados[playerid][ContaBanco] == 1) return SendClientMessage(playerid, VERMELHO, "[BANCO]: Voce ja possui uma conta bancaria! Digite /Banco.");

	SendClientMessage(playerid, VERDE_CLARO, "[INFO]: Conta criada com sucesso!");
	pDados[playerid][ContaBanco] = 1;
	return 1;
}
