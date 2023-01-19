#include <a_samp>
#include <core>
#include <float>
#include <sampvoice>
#include <zcmd>

new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

public OnFilterScriptInit()
{
    print("--------------------------------");
    print("SampVoice Beta By: Hamdani");
    print("--------------------------------");
    return 1;
}

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid) 
{
    // Attach player to local stream as speaker if 'B' key is pressed
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
}
public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    // Detach the player from the local stream if the 'B' key is released
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
}

public OnPlayerConnect(playerid)
{
    // Checking for plugin availability
    if (SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, -1, "Could not find plugin sampvoice.");
    }
    // Checking for a microphone
    else if (SvHasMicro(playerid) == SV_FALSE)
    {
        SendClientMessage(playerid, -1, "The microphone could not be found.");
    }
    else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    {
        SendClientMessage(playerid, -1, "Press B to talk");

        // Assign microphone activation keys to the player
        SvAddKey(playerid, 0x42);
    }
}

public OnPlayerDisconnect(playerid, reason)
{
    // Removing the player's local stream after disconnecting
    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }
}

public OnFilterScriptExit()
{
    return 1;
}

CMD:voice(playerid, params[]) {
    SvDeleteStream(lstream[playerid]);
    lstream[playerid] = SV_NULL;
    SendClientMessage(playerid, 0xFFFF00FF, "reloading Voice");
    SetTimerEx("reconec", 2000, false,  "i", playerid);
    return 1;
}

forward reconec(playerid);
public reconec(playerid)
{
    lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local");
    return 1;
}
