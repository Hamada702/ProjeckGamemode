forward OnCheatDetected(playerid, ip_address[], type, code);
public OnCheatDetected(playerid, ip_address[], type, code)
{
    switch(code)
    {
        case 7:
        {
            KickMessages(playerid, "[FLY HACK]");
        }
        case 8:
        {
            KickMessages(playerid, "[FLY HACK]");
        }
        case 9:
        {
            KickMessages(playerid, "[SPEED HACK]");
        }
        case 11:
        {
            KickMessages(playerid, "[HEALTH HACK]");
        }
        case 12:
        {
            KickMessages(playerid, "[HEALTH HACK]");
        }
        case 13:
        {
            KickMessages(playerid, "[ARMOUR HACK]");
        }
        case 14:
        {
            ResetPlayerMoney(playerid);
            KickMessages(playerid, "[MONEY HACK]");
        }
        case 15:
        {
            ResetPlayerWeapons(playerid);
            KickMessages(playerid, "[WEAPON HACK]");
        }
        case 16:
        {
            ResetPlayerWeapons(playerid);
            KickMessages(playerid, "[AMMO HACK]");
        }
        case 17:
        {
            ResetPlayerWeapons(playerid);
            KickMessages(playerid, "[AMMO HACK]");
        }
        case 19:
        {
            KickMessages(playerid, "[GOD MODE]");
        }
        case 20:
        {
            KickMessages(playerid, "[GOD MODE]");
        }
        case 29:
        {
            KickMessages(playerid, "[AUTO AIM]");
        }
        case 36:
        {
            KickMessages(playerid, "[FAKE NPC]");
        }
        case 35:
        {
            KickMessages(playerid, "[AUTO AIM]");
        }
        case 40:
        {
            KickMessages(playerid, "[SANBOX]");
        }
    }
    return 1;
}