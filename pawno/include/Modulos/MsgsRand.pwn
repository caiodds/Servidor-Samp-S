#include "YSI_Coding/y_hooks"

new Msgs[] = {
	"| NL:RP | Use /comandos para ver os principais comandos do server.",
	"| NL:RP | Use /creditos para ver os criados do servidor.",
	"| NL:RP | Use /loja para ver os precos dos Vips",
	"| NL:RP | Compre seu Vip por apenas 5 Reais",
	"| NL:RP | Use /vip para ver os beneficios e os precos dos Vips"
};

hook OnGameModeInit()
{
	SetTimer("MsgRand", 180000, true);
	return 1;
}

forward MsgRand();
public MsgRand()
{
	SendClientMessageToAll(-1, Msgs[random(sizeof(Msgs))]);
}