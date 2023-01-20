CCRP::OnPlayerRegister(playerid)
{
	// retrieves the ID generated for an AUTO_INCREMENT column by the sent query
	Player[playerid][ID] = cache_insert_id();

	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Registration", "Account successfully registered, you have been automatically logged in.", "Okay", "");
	Player[playerid][TMPName] = Player[playerid][Name];
	Player[playerid][IsLoggedIn] = true;
	if(Player[playerid][City] == 1)
	{
		Player[playerid][X_Pos] = dspawn[0][0];
		Player[playerid][Y_Pos] = dspawn[0][1];
		Player[playerid][Z_Pos] = dspawn[0][2];
		Player[playerid][A_Pos] = dspawn[0][3];
	}
	if(Player[playerid][City] == 2)
	{
		Player[playerid][X_Pos] = dspawn[1][0];
		Player[playerid][Y_Pos] = dspawn[1][1];
		Player[playerid][Z_Pos] = dspawn[1][2];
		Player[playerid][A_Pos] = dspawn[1][3];
	}
	if(Player[playerid][City] == 3)
	{
		Player[playerid][X_Pos] = dspawn[2][0];
		Player[playerid][Y_Pos] = dspawn[2][1];
		Player[playerid][Z_Pos] = dspawn[2][2];
		Player[playerid][A_Pos] = dspawn[2][3];
	}
	Player[playerid][Money] = 50000;
	Player[playerid][LVL] = 1,
	Player[playerid][P_hungger] = 1000.0000,
	Player[playerid][P_thrist] = 1000.0000,
	Player[playerid][P_energy] = 1000.0000,
	Player[playerid][P_healt] = 100.0000,


	SetSpawnInfo(playerid, NO_TEAM, Player[playerid][Skin], Player[playerid][X_Pos], Player[playerid][Y_Pos], Player[playerid][Z_Pos], Player[playerid][A_Pos], 0, 0, 0, 0, 0, 0);
	GivePlayerMoney(playerid, Player[playerid][Money]);
	SetPlayerScore(playerid, Player[playerid][LVL]);
	SpawnPlayer(playerid);
	return 1;
}

CCRP::OnPlayerDataLoaded(playerid, race_check)
{
	/*	race condition check:
		player A connects -> SELECT query is fired -> this query takes very long
		while the query is still processing, player A with playerid 2 disconnects
		player B joins now with playerid 2 -> our laggy SELECT query is finally finished, but for the wrong player
		what do we do against it?
		we create a connection count for each playerid and increase it everytime the playerid connects or disconnects
		we also pass the current value of the connection count to our OnPlayerDataLoaded callback
		then we check if current connection count is the same as connection count we passed to the callback
		if yes, everything is okay, if not, we just kick the player
	*/
	if (race_check != g_MysqlRaceCheck[playerid]) return Kick(playerid);

	new string[228];
	if(cache_num_rows() > 0)
	{
		// we store the password and the salt so we can compare the password the player inputs
		// and save the rest so we won't have to execute another query later
		cache_get_value(0, "password", Player[playerid][Password], 65);
		cache_get_value(0, "salt", Player[playerid][Salt], 17);

		// saves the active cache in the memory and returns an cache-id to access it for later use
		Player[playerid][Cache_ID] = cache_save();

		format(string, sizeof string, "{ffffff}Karakter dengan Nama:  {00ff00}(%s)\n{ffffff}Sudah Terdaftar Di {00ffff}ColdCity RolePlay.\n{ffffff}Silahkan Masukan Password:", Player[playerid][Name]);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", string, "Login", "Abort");

		// from now on, the player has 30 seconds to login
		Player[playerid][LoginTimer] = SetTimerEx("OnLoginTimeout", SECONDS_TO_LOGIN * 1000, false, "d", playerid);
	}
	else
	{
		format(string, sizeof string, "{FFFFFF}Hai {00ff00}%s\n{ffffff}Selamat Datang Di {00ffff}ColdCity RolePlay,\n{ffffff}Silahkan Register Terlebih Dahulu,\n", Player[playerid][Name]);
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", string, "Register", "Exit");
	}
	return 1;
}

AssignPlayerData(playerid)
{
	cache_get_value_int(0, "id", Player[playerid][ID]);

	cache_get_value_int(0, "IsRegister", Player[playerid][IsRegister]);
	cache_get_value_int(0, "injured", Player[playerid][injured]);
	cache_get_value_float(0, "x", Player[playerid][X_Pos]);
	cache_get_value_float(0, "y", Player[playerid][Y_Pos]);
	cache_get_value_float(0, "z", Player[playerid][Z_Pos]);
	cache_get_value_float(0, "angle", Player[playerid][A_Pos]);
	cache_get_value_int(0, "interior", Player[playerid][Interior]);
	cache_get_value_int(0, "virtualworld", Player[playerid][Virtualworld]);
	cache_get_value_int(0, "P_city", Player[playerid][City]);
	cache_get_value_int(0, "P_gender", Player[playerid][Gender]);
	cache_get_value(0, "P_birth", Player[playerid][Birth]);
	cache_get_value_int(0, "P_skin", Player[playerid][Skin]);
	cache_get_value_int(0, "P_money", Player[playerid][Money]);
	cache_get_value_int(0, "p_lvl", Player[playerid][LVL]);
	cache_get_value_int(0, "P_exp", Player[playerid][Exp]);
	cache_get_value_float(0, "P_hungger", Player[playerid][P_hungger]);
	cache_get_value_float(0, "P_thrist", Player[playerid][P_thrist]);
	cache_get_value_float(0, "P_energy", Player[playerid][P_energy]);
	cache_get_value_float(0, "P_healt", Player[playerid][P_healt]);
	cache_get_value_float(0, "p_armor", Player[playerid][p_armor]);
	
	cache_get_value_name(0, "username", Player[playerid][TMPName]);

	SetPlayerScore(playerid, Player[playerid][LVL]);
	return 1;
}

UpdatePlayerData(playerid, reason)
{
	if (Player[playerid][IsLoggedIn] == false) return 0;

	// if the client crashed, it's not possible to get the player's position in OnPlayerDisconnect callback
	// so we will use the last saved position (in case of a player who registered and crashed/kicked, the position will be the default spawn point)
	if (reason == 1)
	{
		GetPlayerPos(playerid, Player[playerid][X_Pos], Player[playerid][Y_Pos], Player[playerid][Z_Pos]);
		GetPlayerFacingAngle(playerid, Player[playerid][A_Pos]);
	}


	update_player_float(playerid, "x", Player[playerid][X_Pos]);
	update_player_float(playerid, "y", Player[playerid][Y_Pos]);
	update_player_float(playerid, "z", Player[playerid][Z_Pos]);
	update_player_float(playerid, "angle", Player[playerid][A_Pos]);
	update_player_int(playerid, "interior", GetPlayerInterior(playerid));
	update_player_int(playerid, "virtualworld", GetPlayerVirtualWorld(playerid));
	update_player_int(playerid, "injured", Player[playerid][injured]);
	update_player_int(playerid, "P_money", Player[playerid][Money]);
	update_player_int(playerid, "p_lvl", GetPlayerScore(playerid));
	update_player_int(playerid, "p_exp", Player[playerid][Exp]);
	update_player_float(playerid, "P_hungger", Player[playerid][P_hungger]);
	update_player_float(playerid, "P_thrist", Player[playerid][P_thrist]);
	update_player_float(playerid, "P_energy", Player[playerid][P_energy]);
	update_player_float(playerid, "P_healt", Player[playerid][P_healt]);
	update_player_float(playerid, "p_armor", Player[playerid][p_armor]);

	return 1;
}