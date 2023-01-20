
new PlayerText:namaserver[MAX_PLAYERS][16];

stock loadLogo(playerid)
{
	namaserver[playerid][0] = CreatePlayerTextDraw(playerid, 300.000000, 4.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, namaserver[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][0], 14.000000, 4.500000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][0], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][0], -2016478465);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][0], 0);

	namaserver[playerid][1] = CreatePlayerTextDraw(playerid, 300.000000, 19.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, namaserver[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][1], 14.000000, 4.500000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][1], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][1], -2016478465);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][1], 0);

	namaserver[playerid][2] = CreatePlayerTextDraw(playerid, 296.000000, 4.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, namaserver[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][2], 3.500000, 19.500000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][2], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][2], -2016478465);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][2], 0);

	namaserver[playerid][3] = CreatePlayerTextDraw(playerid, 308.000000, 11.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, namaserver[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][3], 14.000000, 4.500000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][3], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][3], 16777215);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][3], 0);

	namaserver[playerid][4] = CreatePlayerTextDraw(playerid, 323.000000, 11.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, namaserver[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][4], 3.500000, 19.500000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][4], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][4], 16777215);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][4], 0);

	namaserver[playerid][5] = CreatePlayerTextDraw(playerid, 308.000000, 26.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, namaserver[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][5], 14.000000, 4.500000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][5], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][5], 16777215);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][5], 0);

	namaserver[playerid][6] = CreatePlayerTextDraw(playerid, 321.000000, 3.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][6], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][6], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][6], 0);

	namaserver[playerid][7] = CreatePlayerTextDraw(playerid, 289.000000, 8.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][7], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][7], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][7], 0);

	namaserver[playerid][8] = CreatePlayerTextDraw(playerid, 295.000000, 27.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][8], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][8], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][8], 0);

	namaserver[playerid][9] = CreatePlayerTextDraw(playerid, 327.000000, 27.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][9], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][9], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][9], 0);

	namaserver[playerid][10] = CreatePlayerTextDraw(playerid, 312.000000, 33.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][10], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][10], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][10], 0);

	namaserver[playerid][11] = CreatePlayerTextDraw(playerid, 291.000000, 17.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][11], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][11], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][11], 0);

	namaserver[playerid][12] = CreatePlayerTextDraw(playerid, 315.000000, 17.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][12], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][12], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][12], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][12], 0);

	namaserver[playerid][13] = CreatePlayerTextDraw(playerid, 302.000000, 11.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][13], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][13], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][13], 0);

	namaserver[playerid][14] = CreatePlayerTextDraw(playerid, 301.000000, -2.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, namaserver[playerid][14], 4);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][14], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][14], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][14], 0);

	namaserver[playerid][15] = CreatePlayerTextDraw(playerid, 351.000000, 10.000000, "ROLEPLAY");
	PlayerTextDrawFont(playerid, namaserver[playerid][15], 1);
	PlayerTextDrawLetterSize(playerid, namaserver[playerid][15], 0.324999, 1.700000);
	PlayerTextDrawTextSize(playerid, namaserver[playerid][15], 400.000000, 61.000000);
	PlayerTextDrawSetOutline(playerid, namaserver[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, namaserver[playerid][15], 2);
	PlayerTextDrawAlignment(playerid, namaserver[playerid][15], 2);
	PlayerTextDrawColor(playerid, namaserver[playerid][15], 16777215);
	PlayerTextDrawBackgroundColor(playerid, namaserver[playerid][15], -2016478465);
	PlayerTextDrawBoxColor(playerid, namaserver[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, namaserver[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, namaserver[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, namaserver[playerid][15], 0);


    PlayerTextDrawShow(playerid, namaserver[playerid][0]);
    PlayerTextDrawShow(playerid, namaserver[playerid][1]);
    PlayerTextDrawShow(playerid, namaserver[playerid][2]);
    PlayerTextDrawShow(playerid, namaserver[playerid][3]);
    PlayerTextDrawShow(playerid, namaserver[playerid][4]);
    PlayerTextDrawShow(playerid, namaserver[playerid][5]);
    PlayerTextDrawShow(playerid, namaserver[playerid][6]);
    PlayerTextDrawShow(playerid, namaserver[playerid][7]);
    PlayerTextDrawShow(playerid, namaserver[playerid][8]);
    PlayerTextDrawShow(playerid, namaserver[playerid][9]);
    PlayerTextDrawShow(playerid, namaserver[playerid][10]);
    PlayerTextDrawShow(playerid, namaserver[playerid][11]);
    PlayerTextDrawShow(playerid, namaserver[playerid][12]);
    PlayerTextDrawShow(playerid, namaserver[playerid][13]);
    PlayerTextDrawShow(playerid, namaserver[playerid][14]);
    PlayerTextDrawShow(playerid, namaserver[playerid][15]);


	return 1;
}

stock destroyLogo(playerid)
{
	PlayerTextDrawDestroy(playerid, namaserver[playerid][0]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][1]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][2]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][3]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][4]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][5]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][6]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][7]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][8]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][9]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][10]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][11]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][12]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][13]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][14]);
	PlayerTextDrawDestroy(playerid, namaserver[playerid][15]);
	return 1;
}