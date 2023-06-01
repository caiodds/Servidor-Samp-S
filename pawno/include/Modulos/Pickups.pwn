#include	<YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	//PICKUPS
	CreateDynamicPickup(1277, 1, 1703.9183, -2312.2183, 13.5469); //Alugar Bike
	CreateDynamicPickup(1210, 1, 951.8302, -1744.5352, 13.6210); //Agencia de Empregos
	CreateDynamicPickup(1274, 1, 1411.3075, -1627.0958, 13.6247); //Banco 1
	CreateDynamicPickup(1274, 1, 1411.1853, -1624.8353, 13.6247); //Banco 2
	CreateDynamicPickup(1274, 1, 1411.1298,-1622.6207,13.6247); //Banco 3
	CreateDynamicPickup(1274, 1, 1411.1282, -1620.5386, 13.6247); //Banco 4

    //3D LABEL
    Create3DTextLabel("Aluguel de Bikes\n{00FF00}/alugarbike", -1, 1703.9183, -2312.2183, 13.5469, 40.0, 0, 0);//Alugar Bike
    Create3DTextLabel("Agencia de Empregos\n{00FF00}/profs", -1, 951.8302, -1744.5352, 13.6210, 30.0, 0, 0);//Agencia de Empregos
    return 1;
}