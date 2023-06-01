#include <y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_AJUDA)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, DIALOG_AJUDACOMANDOS, DIALOG_STYLE_MSGBOX, "AJUDA COMANDOS", "{FFFFFF}Use: {FF00FF}/gps{FFFFFF} - para voce saber as localizacoes da cidade\n{FFFFFF}Use: {FF00FF}/rg {FFFFFF}- Para Voce Ver Sua Identificacao\n{FFFFFF}Use: {FF00FF}/mostrarrg [ID] - Para Voce Mostrar Sua Documentacao\n{FFFFFF}Use: {FF00FF}/render{FFFFFF} - Para Voce Fazer Animacao De Rendido\n", "Confirmar", "Cancelar");
            }
            if(listitem == 1)
            {
                ShowPlayerDialog(playerid, DIALOG_AJUDAEMPREGO, DIALOG_STYLE_LIST, "AJUDA EMPREGO", "1 - Lixeiro\n")
            }
        }
    }
}

CMD:ajuda(playerid)
{
    ShowPlayerDialog(playerid, DIALOG_AJUDA, DIALOG_STYLE_LIST, "Ajuda Player", "{FFFFFF}| {0000CD}Ajuda {FFFFFF}|Comandos\n{FFFFFF}| {0000CD}Ajuda {FFFFFF}|Emprego\n{FFFFFF}| {0000CD}Ajuda {FFFFFF}|Organizacoes\n{FFFFFF}| {0000CD}Ajuda {FFFFFF}|Corporacoes\n{0000CD}Ajuda {FFFFFF}|VIP", "Confirmar", "Cancelar");
    return 1;
}