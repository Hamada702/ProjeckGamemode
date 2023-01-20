#include    <YSI_Coding\y_hooks>

enum _ntdsucces
{
    TDsuccesShow,
    Time:TDsuccesTime,
}
new TDSucces[MAX_PLAYERS][_ntdsucces];

enum _ntdinfo
{
    TDinfoShow,
    Time:TDinfoTime,
}
new TDInfo[MAX_PLAYERS][_ntdinfo];

enum _ntderror
{
    TDerrorShow,
    Time:TDerrorTime,
}
new TDError[MAX_PLAYERS][_ntderror];


new PlayerText: TD_SUCCES_0[MAX_PLAYERS];
new PlayerText: TD_SUCCES_1[MAX_PLAYERS];
new PlayerText: TD_SUCCES_2[MAX_PLAYERS];
new PlayerText: TD_SUCCES_3[MAX_PLAYERS];
new PlayerText: TD_SUCCES_4[MAX_PLAYERS];
new PlayerText: TD_SUCCES_5[MAX_PLAYERS];
new PlayerText: TD_INFO_0[MAX_PLAYERS];
new PlayerText: TD_INFO_1[MAX_PLAYERS];
new PlayerText: TD_INFO_2[MAX_PLAYERS];
new PlayerText: TD_INFO_3[MAX_PLAYERS];
new PlayerText: TD_INFO_4[MAX_PLAYERS];
new PlayerText: TD_INFO_5[MAX_PLAYERS];
new PlayerText: TD_ERROR_0[MAX_PLAYERS];
new PlayerText: TD_ERROR_1[MAX_PLAYERS];
new PlayerText: TD_ERROR_2[MAX_PLAYERS];
new PlayerText: TD_ERROR_3[MAX_PLAYERS];
new PlayerText: TD_ERROR_4[MAX_PLAYERS];
new PlayerText: TD_ERROR_5[MAX_PLAYERS];
new PlayerText: TXT_SUCCES[MAX_PLAYERS];
new PlayerText: TXT_INFO[MAX_PLAYERS];
new PlayerText: TXT_ERROR[MAX_PLAYERS];


hook OnPlayerConnect(playerid)
{
	TD_SUCCES_0[playerid] = CreatePlayerTextDraw(playerid, 518.000, 121.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, TD_SUCCES_0[playerid], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, TD_SUCCES_0[playerid], 1);
	PlayerTextDrawColor(playerid, TD_SUCCES_0[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, TD_SUCCES_0[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_SUCCES_0[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_SUCCES_0[playerid], 255);
	PlayerTextDrawFont(playerid, TD_SUCCES_0[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_SUCCES_0[playerid], 1);

	TD_SUCCES_1[playerid] = CreatePlayerTextDraw(playerid, 518.000, 146.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, TD_SUCCES_1[playerid], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, TD_SUCCES_1[playerid], 1);
	PlayerTextDrawColor(playerid, TD_SUCCES_1[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, TD_SUCCES_1[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_SUCCES_1[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_SUCCES_1[playerid], 255);
	PlayerTextDrawFont(playerid, TD_SUCCES_1[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_SUCCES_1[playerid], 1);

	TD_SUCCES_2[playerid] = CreatePlayerTextDraw(playerid, 520.000, 127.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TD_SUCCES_2[playerid], 6.000, 26.000);
	PlayerTextDrawAlignment(playerid, TD_SUCCES_2[playerid], 1);
	PlayerTextDrawColor(playerid, TD_SUCCES_2[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, TD_SUCCES_2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_SUCCES_2[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_SUCCES_2[playerid], 255);
	PlayerTextDrawFont(playerid, TD_SUCCES_2[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_SUCCES_2[playerid], 1);

	TD_SUCCES_3[playerid] = CreatePlayerTextDraw(playerid, 525.000, 123.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TD_SUCCES_3[playerid], 94.000, 33.000);
	PlayerTextDrawAlignment(playerid, TD_SUCCES_3[playerid], 1);
	PlayerTextDrawColor(playerid, TD_SUCCES_3[playerid], 1887473919);
	PlayerTextDrawSetShadow(playerid, TD_SUCCES_3[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_SUCCES_3[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_SUCCES_3[playerid], 255);
	PlayerTextDrawFont(playerid, TD_SUCCES_3[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_SUCCES_3[playerid], 1);

	TD_SUCCES_4[playerid] = CreatePlayerTextDraw(playerid, 540.000, 124.000, "SUCCES");
	PlayerTextDrawLetterSize(playerid, TD_SUCCES_4[playerid], 0.180, 1.098);
	PlayerTextDrawAlignment(playerid, TD_SUCCES_4[playerid], 1);
	PlayerTextDrawColor(playerid, TD_SUCCES_4[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TD_SUCCES_4[playerid], 1);
	PlayerTextDrawSetOutline(playerid, TD_SUCCES_4[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TD_SUCCES_4[playerid], 150);
	PlayerTextDrawFont(playerid, TD_SUCCES_4[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TD_SUCCES_4[playerid], 1);

	TD_SUCCES_5[playerid] = CreatePlayerTextDraw(playerid, 528.000, 125.000, "LD_CHAT:thumbup");
	PlayerTextDrawTextSize(playerid, TD_SUCCES_5[playerid], 9.000, 9.000);
	PlayerTextDrawAlignment(playerid, TD_SUCCES_5[playerid], 1);
	PlayerTextDrawColor(playerid, TD_SUCCES_5[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TD_SUCCES_5[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_SUCCES_5[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_SUCCES_5[playerid], 255);
	PlayerTextDrawFont(playerid, TD_SUCCES_5[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_SUCCES_5[playerid], 1);

	TD_INFO_0[playerid] = CreatePlayerTextDraw(playerid, 518.000, 165.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, TD_INFO_0[playerid], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, TD_INFO_0[playerid], 1);
	PlayerTextDrawColor(playerid, TD_INFO_0[playerid], -65281);
	PlayerTextDrawSetShadow(playerid, TD_INFO_0[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_INFO_0[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_INFO_0[playerid], 255);
	PlayerTextDrawFont(playerid, TD_INFO_0[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_INFO_0[playerid], 1);

	TD_INFO_1[playerid] = CreatePlayerTextDraw(playerid, 518.000, 190.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, TD_INFO_1[playerid], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, TD_INFO_1[playerid], 1);
	PlayerTextDrawColor(playerid, TD_INFO_1[playerid], -65281);
	PlayerTextDrawSetShadow(playerid, TD_INFO_1[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_INFO_1[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_INFO_1[playerid], 255);
	PlayerTextDrawFont(playerid, TD_INFO_1[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_INFO_1[playerid], 1);

	TD_INFO_2[playerid] = CreatePlayerTextDraw(playerid, 520.000, 171.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TD_INFO_2[playerid], 6.000, 26.000);
	PlayerTextDrawAlignment(playerid, TD_INFO_2[playerid], 1);
	PlayerTextDrawColor(playerid, TD_INFO_2[playerid], -65281);
	PlayerTextDrawSetShadow(playerid, TD_INFO_2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_INFO_2[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_INFO_2[playerid], 255);
	PlayerTextDrawFont(playerid, TD_INFO_2[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_INFO_2[playerid], 1);

	TD_INFO_3[playerid] = CreatePlayerTextDraw(playerid, 525.000, 167.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TD_INFO_3[playerid], 94.000, 33.000);
	PlayerTextDrawAlignment(playerid, TD_INFO_3[playerid], 1);
	PlayerTextDrawColor(playerid, TD_INFO_3[playerid], 1887473919);
	PlayerTextDrawSetShadow(playerid, TD_INFO_3[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_INFO_3[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_INFO_3[playerid], 255);
	PlayerTextDrawFont(playerid, TD_INFO_3[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_INFO_3[playerid], 1);

	TD_INFO_4[playerid] = CreatePlayerTextDraw(playerid, 540.000, 168.000, "WARNING");
	PlayerTextDrawLetterSize(playerid, TD_INFO_4[playerid], 0.180, 1.098);
	PlayerTextDrawAlignment(playerid, TD_INFO_4[playerid], 1);
	PlayerTextDrawColor(playerid, TD_INFO_4[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TD_INFO_4[playerid], 1);
	PlayerTextDrawSetOutline(playerid, TD_INFO_4[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TD_INFO_4[playerid], 150);
	PlayerTextDrawFont(playerid, TD_INFO_4[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TD_INFO_4[playerid], 1);

	TD_INFO_5[playerid] = CreatePlayerTextDraw(playerid, 528.000, 169.000, "LD_CHAT:badchat");
	PlayerTextDrawTextSize(playerid, TD_INFO_5[playerid], 9.000, 9.000);
	PlayerTextDrawAlignment(playerid, TD_INFO_5[playerid], 1);
	PlayerTextDrawColor(playerid, TD_INFO_5[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TD_INFO_5[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_INFO_5[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_INFO_5[playerid], 255);
	PlayerTextDrawFont(playerid, TD_INFO_5[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_INFO_5[playerid], 1);

	TD_ERROR_0[playerid] = CreatePlayerTextDraw(playerid, 518.000, 210.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, TD_ERROR_0[playerid], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, TD_ERROR_0[playerid], 1);
	PlayerTextDrawColor(playerid, TD_ERROR_0[playerid], -16776961);
	PlayerTextDrawSetShadow(playerid, TD_ERROR_0[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_ERROR_0[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_ERROR_0[playerid], 255);
	PlayerTextDrawFont(playerid, TD_ERROR_0[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_ERROR_0[playerid], 1);

	TD_ERROR_1[playerid] = CreatePlayerTextDraw(playerid, 518.000, 235.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, TD_ERROR_1[playerid], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, TD_ERROR_1[playerid], 1);
	PlayerTextDrawColor(playerid, TD_ERROR_1[playerid], -16776961);
	PlayerTextDrawSetShadow(playerid, TD_ERROR_1[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_ERROR_1[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_ERROR_1[playerid], 255);
	PlayerTextDrawFont(playerid, TD_ERROR_1[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_ERROR_1[playerid], 1);

	TD_ERROR_2[playerid] = CreatePlayerTextDraw(playerid, 520.000, 216.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TD_ERROR_2[playerid], 6.000, 26.000);
	PlayerTextDrawAlignment(playerid, TD_ERROR_2[playerid], 1);
	PlayerTextDrawColor(playerid, TD_ERROR_2[playerid], -16776961);
	PlayerTextDrawSetShadow(playerid, TD_ERROR_2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_ERROR_2[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_ERROR_2[playerid], 255);
	PlayerTextDrawFont(playerid, TD_ERROR_2[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_ERROR_2[playerid], 1);

	TD_ERROR_3[playerid] = CreatePlayerTextDraw(playerid, 525.000, 212.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TD_ERROR_3[playerid], 94.000, 33.000);
	PlayerTextDrawAlignment(playerid, TD_ERROR_3[playerid], 1);
	PlayerTextDrawColor(playerid, TD_ERROR_3[playerid], 1887473919);
	PlayerTextDrawSetShadow(playerid, TD_ERROR_3[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_ERROR_3[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_ERROR_3[playerid], 255);
	PlayerTextDrawFont(playerid, TD_ERROR_3[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_ERROR_3[playerid], 1);

	TD_ERROR_4[playerid] = CreatePlayerTextDraw(playerid, 540.000, 213.000, "ERROR");
	PlayerTextDrawLetterSize(playerid, TD_ERROR_4[playerid], 0.180, 1.098);
	PlayerTextDrawAlignment(playerid, TD_ERROR_4[playerid], 1);
	PlayerTextDrawColor(playerid, TD_ERROR_4[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TD_ERROR_4[playerid], 1);
	PlayerTextDrawSetOutline(playerid, TD_ERROR_4[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TD_ERROR_4[playerid], 150);
	PlayerTextDrawFont(playerid, TD_ERROR_4[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TD_ERROR_4[playerid], 1);

	TD_ERROR_5[playerid] = CreatePlayerTextDraw(playerid, 528.000, 214.000, "LD_CHAT:thumbdn");
	PlayerTextDrawTextSize(playerid, TD_ERROR_5[playerid], 9.000, 9.000);
	PlayerTextDrawAlignment(playerid, TD_ERROR_5[playerid], 1);
	PlayerTextDrawColor(playerid, TD_ERROR_5[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TD_ERROR_5[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_ERROR_5[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_ERROR_5[playerid], 255);
	PlayerTextDrawFont(playerid, TD_ERROR_5[playerid], 4);
	PlayerTextDrawSetProportional(playerid, TD_ERROR_5[playerid], 1);

	TXT_SUCCES[playerid] = CreatePlayerTextDraw(playerid, 529.000, 136.000, "Sukses Membeli~n~potato~n~jumlah: 10");
	PlayerTextDrawLetterSize(playerid, TXT_SUCCES[playerid], 0.180, 0.699);
	PlayerTextDrawAlignment(playerid, TXT_SUCCES[playerid], 1);
	PlayerTextDrawColor(playerid, TXT_SUCCES[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TXT_SUCCES[playerid], 1);
	PlayerTextDrawSetOutline(playerid, TXT_SUCCES[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TXT_SUCCES[playerid], 150);
	PlayerTextDrawFont(playerid, TXT_SUCCES[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TXT_SUCCES[playerid], 1);

	TXT_INFO[playerid] = CreatePlayerTextDraw(playerid, 529.000, 179.000, "Sukses Membeli~n~potato~n~jumlah: 10");
	PlayerTextDrawLetterSize(playerid, TXT_INFO[playerid], 0.180, 0.699);
	PlayerTextDrawAlignment(playerid, TXT_INFO[playerid], 1);
	PlayerTextDrawColor(playerid, TXT_INFO[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TXT_INFO[playerid], 1);
	PlayerTextDrawSetOutline(playerid, TXT_INFO[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TXT_INFO[playerid], 150);
	PlayerTextDrawFont(playerid, TXT_INFO[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TXT_INFO[playerid], 1);

	TXT_ERROR[playerid] = CreatePlayerTextDraw(playerid, 529.000, 224.000, "Sukses Membeli~n~potato~n~jumlah: 10");
	PlayerTextDrawLetterSize(playerid, TXT_ERROR[playerid], 0.180, 0.699);
	PlayerTextDrawAlignment(playerid, TXT_ERROR[playerid], 1);
	PlayerTextDrawColor(playerid, TXT_ERROR[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TXT_ERROR[playerid], 1);
	PlayerTextDrawSetOutline(playerid, TXT_ERROR[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TXT_ERROR[playerid], 150);
	PlayerTextDrawFont(playerid, TXT_ERROR[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TXT_ERROR[playerid], 1);

	return 1;
}

stock destroyNotif(playerid)
{
	PlayerTextDrawDestroy(playerid, TD_SUCCES_0[playerid]);
	PlayerTextDrawDestroy(playerid, TD_SUCCES_1[playerid]);
	PlayerTextDrawDestroy(playerid, TD_SUCCES_2[playerid]);
	PlayerTextDrawDestroy(playerid, TD_SUCCES_3[playerid]);
	PlayerTextDrawDestroy(playerid, TD_SUCCES_4[playerid]);
	PlayerTextDrawDestroy(playerid, TD_SUCCES_5[playerid]);
	PlayerTextDrawDestroy(playerid, TD_INFO_0[playerid]);
	PlayerTextDrawDestroy(playerid, TD_INFO_1[playerid]);
	PlayerTextDrawDestroy(playerid, TD_INFO_2[playerid]);
	PlayerTextDrawDestroy(playerid, TD_INFO_3[playerid]);
	PlayerTextDrawDestroy(playerid, TD_INFO_4[playerid]);
	PlayerTextDrawDestroy(playerid, TD_INFO_5[playerid]);
	PlayerTextDrawDestroy(playerid, TD_ERROR_0[playerid]);
	PlayerTextDrawDestroy(playerid, TD_ERROR_1[playerid]);
	PlayerTextDrawDestroy(playerid, TD_ERROR_2[playerid]);
	PlayerTextDrawDestroy(playerid, TD_ERROR_3[playerid]);
	PlayerTextDrawDestroy(playerid, TD_ERROR_4[playerid]);
	PlayerTextDrawDestroy(playerid, TD_ERROR_5[playerid]);
	PlayerTextDrawDestroy(playerid, TXT_SUCCES[playerid]);
	PlayerTextDrawDestroy(playerid, TXT_INFO[playerid]);
	PlayerTextDrawDestroy(playerid, TXT_ERROR[playerid]);
	return 1;
}


stock NTD_SUCCESEx(playerid, string[], time = 5000)
{
    if(TDSucces[playerid][TDsuccesShow])
    {
        PlayerTextDrawHide(playerid, TD_SUCCES_0[playerid]);
		PlayerTextDrawHide(playerid, TD_SUCCES_1[playerid]);
		PlayerTextDrawHide(playerid, TD_SUCCES_2[playerid]);
		PlayerTextDrawHide(playerid, TD_SUCCES_3[playerid]);
		PlayerTextDrawHide(playerid, TD_SUCCES_4[playerid]);
		PlayerTextDrawHide(playerid, TD_SUCCES_5[playerid]);
		PlayerTextDrawHide(playerid, TXT_SUCCES[playerid]);
        TDSucces[playerid][TDsuccesShow] = 0;
    }
    new succes[128];
    format(succes, sizeof(succes), "%s", string);
    PlayerTextDrawSetString(playerid, TXT_SUCCES[playerid], succes);
    for(new i = 0; i < 6; i++)
	PlayerTextDrawShow(playerid, TD_SUCCES_0[playerid]);
	PlayerTextDrawShow(playerid, TD_SUCCES_1[playerid]);
	PlayerTextDrawShow(playerid, TD_SUCCES_2[playerid]);
	PlayerTextDrawShow(playerid, TD_SUCCES_3[playerid]);
	PlayerTextDrawShow(playerid, TD_SUCCES_4[playerid]);
	PlayerTextDrawShow(playerid, TD_SUCCES_5[playerid]);
    PlayerTextDrawShow(playerid, TXT_SUCCES[playerid]);
    TDSucces[playerid][TDsuccesShow] = 1;
    TDSucces[playerid][TDsuccesTime] = defer HideTDSucces[time](playerid);
    return 1;
}

stock NTD_INFOEx(playerid, string[], time = 5000)
{
    if(TDInfo[playerid][TDinfoShow])
    {
        stop TDInfo[playerid][TDinfoTime];
       	PlayerTextDrawHide(playerid, TD_INFO_0[playerid]);
		PlayerTextDrawHide(playerid, TD_INFO_1[playerid]);
		PlayerTextDrawHide(playerid, TD_INFO_2[playerid]);
		PlayerTextDrawHide(playerid, TD_INFO_3[playerid]);
		PlayerTextDrawHide(playerid, TD_INFO_4[playerid]);
		PlayerTextDrawHide(playerid, TD_INFO_5[playerid]);
		PlayerTextDrawHide(playerid, TXT_INFO[playerid]);
        TDInfo[playerid][TDinfoShow] = 0;
    }
    new info[128];
    format(info, sizeof(info), "%s", string);
    PlayerTextDrawSetString(playerid, TXT_INFO[playerid], info);
    PlayerTextDrawShow(playerid, TD_INFO_0[playerid]);
	PlayerTextDrawShow(playerid, TD_INFO_1[playerid]);
	PlayerTextDrawShow(playerid, TD_INFO_2[playerid]);
	PlayerTextDrawShow(playerid, TD_INFO_3[playerid]);
	PlayerTextDrawShow(playerid, TD_INFO_4[playerid]);
	PlayerTextDrawShow(playerid, TD_INFO_5[playerid]);
    PlayerTextDrawShow(playerid, TXT_INFO[playerid]);
    TDInfo[playerid][TDinfoShow] = 1;
    TDInfo[playerid][TDinfoTime] = defer HideTDInfo[time](playerid);
    return 1;
}

stock NTD_ERROREx(playerid, string[], time = 5000)
{
    if(TDError[playerid][TDerrorShow])
    {
        stop TDError[playerid][TDerrorTime];
        PlayerTextDrawHide(playerid, TD_ERROR_0[playerid]);
		PlayerTextDrawHide(playerid, TD_ERROR_1[playerid]);
		PlayerTextDrawHide(playerid, TD_ERROR_2[playerid]);
		PlayerTextDrawHide(playerid, TD_ERROR_3[playerid]);
		PlayerTextDrawHide(playerid, TD_ERROR_4[playerid]);
		PlayerTextDrawHide(playerid, TD_ERROR_5[playerid]);
		PlayerTextDrawHide(playerid, TXT_ERROR[playerid]);
        TDError[playerid][TDerrorShow] = 0;
    }
    new error[128];
    format(error, sizeof(error), "%s", string);
    PlayerTextDrawSetString(playerid, TXT_ERROR[playerid], error);
    PlayerTextDrawShow(playerid, TD_ERROR_0[playerid]);
	PlayerTextDrawShow(playerid, TD_ERROR_1[playerid]);
	PlayerTextDrawShow(playerid, TD_ERROR_2[playerid]);
	PlayerTextDrawShow(playerid, TD_ERROR_3[playerid]);
	PlayerTextDrawShow(playerid, TD_ERROR_4[playerid]);
	PlayerTextDrawShow(playerid, TD_ERROR_5[playerid]);
    PlayerTextDrawShow(playerid, TXT_ERROR[playerid]);
    TDError[playerid][TDerrorShow] = 1;
    TDError[playerid][TDerrorTime] = defer HideTDError[time](playerid);
    return 1;
}

timer HideTDSucces[5000](playerid)
{
    TDSucces[playerid][TDsuccesShow] = 0;
    PlayerTextDrawHide(playerid, TD_SUCCES_0[playerid]);
	PlayerTextDrawHide(playerid, TD_SUCCES_1[playerid]);
	PlayerTextDrawHide(playerid, TD_SUCCES_2[playerid]);
	PlayerTextDrawHide(playerid, TD_SUCCES_3[playerid]);
	PlayerTextDrawHide(playerid, TD_SUCCES_4[playerid]);
	PlayerTextDrawHide(playerid, TD_SUCCES_5[playerid]);
	PlayerTextDrawHide(playerid, TXT_SUCCES[playerid]);
    return 1;
}
timer HideTDInfo[5000](playerid)
{
    TDInfo[playerid][TDinfoShow] = 0;
    PlayerTextDrawHide(playerid, TD_INFO_0[playerid]);
	PlayerTextDrawHide(playerid, TD_INFO_1[playerid]);
	PlayerTextDrawHide(playerid, TD_INFO_2[playerid]);
	PlayerTextDrawHide(playerid, TD_INFO_3[playerid]);
	PlayerTextDrawHide(playerid, TD_INFO_4[playerid]);
	PlayerTextDrawHide(playerid, TD_INFO_5[playerid]);
	PlayerTextDrawHide(playerid, TXT_INFO[playerid]);
    return 1;
}
timer HideTDError[5000](playerid)
{
    TDError[playerid][TDerrorShow] = 0;
    PlayerTextDrawHide(playerid, TD_ERROR_0[playerid]);
	PlayerTextDrawHide(playerid, TD_ERROR_1[playerid]);
	PlayerTextDrawHide(playerid, TD_ERROR_2[playerid]);
	PlayerTextDrawHide(playerid, TD_ERROR_3[playerid]);
	PlayerTextDrawHide(playerid, TD_ERROR_4[playerid]);
	PlayerTextDrawHide(playerid, TD_ERROR_5[playerid]);
	PlayerTextDrawHide(playerid, TXT_ERROR[playerid]);
    return 1;
}