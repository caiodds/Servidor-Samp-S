#include <YSI_Coding\y_hooks>
// ----------
#define SlotAKeFUZIL 1
#define SlotEscopeta 2
// ----------

hook OnPlayerUpdate(playerid)
{
    if(!IsPlayerInAnyVehicle(playerid))
	{
    	new Armas[MAX_PLAYERS],Balas[MAX_PLAYERS];
    	GetPlayerWeaponData(playerid, 5, Armas[playerid], Balas[playerid]);
		if(Armas[playerid] == 30 && Balas[playerid] >= 1)
		{
            if(GetPlayerWeapon(playerid) == 30) RemovePlayerAttachedObject(playerid,SlotAKeFUZIL);
            else SetPlayerAttachedObject(playerid, SlotAKeFUZIL, 355, 1, 0.182000, 0.139999, -0.163000, -15.900011, 41.499950, -177.500106, 1.000000, 1.000000, 1.000000);
		}
		else if(Armas[playerid] == 31 && Balas[playerid] >= 1)
		{
			if(GetPlayerWeapon(playerid) == 31) RemovePlayerAttachedObject(playerid,SlotAKeFUZIL);
            else SetPlayerAttachedObject(playerid, SlotAKeFUZIL, 356, 1, 0.182000, 0.139999, -0.163000, -15.900011, 41.499950, -177.500106, 1.000000, 1.000000, 1.000000);
		}
		else
		{
		    RemovePlayerAttachedObject(playerid,SlotAKeFUZIL);
		}
        GetPlayerWeaponData(playerid, 3, Armas[playerid], Balas[playerid]);
		if(Armas[playerid] == 25 && Balas[playerid] >= 1)
		{
		    if(GetPlayerWeapon(playerid) == 25) RemovePlayerAttachedObject(playerid,SlotEscopeta);
             else SetPlayerAttachedObject(playerid, SlotEscopeta, 349, 1, 0.182000, 0.139999, -0.163000, -15.900011, 41.499950, -177.500106, 1.000000, 1.000000, 1.000000);
		}
		else if(Armas[playerid] == 27 && Balas[playerid] >= 1)
		{
  			if(GetPlayerWeapon(playerid) == 27) RemovePlayerAttachedObject(playerid,SlotEscopeta);
			else SetPlayerAttachedObject(playerid, SlotEscopeta, 351, 1, 0.182000, 0.139999, -0.163000, -15.900011, 41.499950, -177.500106, 1.000000, 1.000000, 1.000000);
		}
		else
		{
		    RemovePlayerAttachedObject(playerid,SlotEscopeta);
		}
	}
	return 1;
}