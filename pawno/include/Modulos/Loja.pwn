CMD:loja(playerid)
{
    ShowPlayerDialog(playerid, LOJINHA, DIALOG_STYLE_LIST, "24/7",
    "Celular\tR$500\
    \
    ", "Comprar", "Cancelar");
    return 1;
}