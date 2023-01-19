#include <YSI_Coding\y_hooks>


new PlayerText:kontenTD[MAX_PLAYERS][9];

hook OnPlayerConnect(playerid)
{
    kontenTD[playerid][0] = CreatePlayerTextDraw(playerid, 23.000000, 430.000000, "id");
	PlayerTextDrawFont(playerid, kontenTD[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][0], 0.308333, 1.250003);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][0], 298.500000, 15.000000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][0], -16776961);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][0], 0);

	kontenTD[playerid][1] = CreatePlayerTextDraw(playerid, 47.000000, 430.000000, "_");
	PlayerTextDrawFont(playerid, kontenTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][1], 0.362500, 1.250003);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][1], 298.500000, 25.500000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][1], 135);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][1], 0);

	kontenTD[playerid][2] = CreatePlayerTextDraw(playerid, 73.000000, 430.000000, "lv");
	PlayerTextDrawFont(playerid, kontenTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][2], 0.308333, 1.250003);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][2], 298.500000, 16.000000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][2], -2686721);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][2], 0);

	kontenTD[playerid][3] = CreatePlayerTextDraw(playerid, 97.000000, 430.000000, "_");
	PlayerTextDrawFont(playerid, kontenTD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][3], 0.362500, 1.250003);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][3], 298.500000, 24.500000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][3], 135);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][3], 0);

	kontenTD[playerid][4] = CreatePlayerTextDraw(playerid, 127.000000, 430.000000, "EXP");
	PlayerTextDrawFont(playerid, kontenTD[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][4], 0.308333, 1.250003);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][4], 298.500000, 25.000000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][4], 16711935);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][4], 0);

	kontenTD[playerid][5] = CreatePlayerTextDraw(playerid, 166.000000, 430.000000, "_");
	PlayerTextDrawFont(playerid, kontenTD[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][5], 0.362500, 1.250003);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][5], 298.500000, 45.500000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][5], 135);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][5], 0);

	kontenTD[playerid][6] = CreatePlayerTextDraw(playerid, 46.000000, 428.000000, "100");
	PlayerTextDrawFont(playerid, kontenTD[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][6], 0.212500, 1.500000);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][6], 0);

	kontenTD[playerid][7] = CreatePlayerTextDraw(playerid, 96.000000, 428.000000, "100");
	PlayerTextDrawFont(playerid, kontenTD[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][7], 0.212500, 1.500000);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][7], 0);

	kontenTD[playerid][8] = CreatePlayerTextDraw(playerid, 166.000000, 428.000000, "999/999");
	PlayerTextDrawFont(playerid, kontenTD[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, kontenTD[playerid][8], 0.191666, 1.500000);
	PlayerTextDrawTextSize(playerid, kontenTD[playerid][8], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, kontenTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, kontenTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, kontenTD[playerid][8], 2);
	PlayerTextDrawColor(playerid, kontenTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, kontenTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, kontenTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, kontenTD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, kontenTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, kontenTD[playerid][8], 0);

    return 1;
}

    //Pasang di OnPlayerSpawn
hook OnPlayerSpawn(playerid)
{
    PlayerTextDrawShow(playerid, kontenTD[playerid][0]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][1]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][2]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][3]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][4]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][5]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][6]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][7]);
	PlayerTextDrawShow(playerid, kontenTD[playerid][8]);

    return 1;
}
	
	//Pasang di Public OnPlayerUpdate

public OnPlayerUpdate(playerid)
{

    new string[256];
	format(string, sizeof(string), "%d", playerid);
	PlayerTextDrawSetString(playerid, kontenTD[playerid][6], string);

	format(string, sizeof(string), "%d", GetPlayerLevel(playerid));
	PlayerTextDrawSetString(playerid, kontenTD[playerid][7], string);

	format(string, sizeof(string), "%d/%d", GetPlayerExp(playerid));
	PlayerTextDrawSetString(playerid, kontenTD[playerid][8], string);
    return 1;
}