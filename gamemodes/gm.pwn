/**
#---------------------- INFO GAMEMODE -----------------------#
# 															 #
# Nama Gamemode		:		SuKaSuka-RP 					 #
# Pembuat			:		Bink702, HamdaniDev              #
# SorceLink			:		Tidak Di Share 				     #
#															 #
#------------------------------------------------------------#
*/

// Disable warning compiler
#pragma warning disable 239
#pragma warning disable 214
#pragma warning disable 203
#pragma warning disable 213
#pragma warning disable 202
#pragma warning disable 205
#pragma warning disable 206

#include <a_samp>

// Version o8f script
#define SCRIPT_VERSION_MAJOR							0
#define SCRIPT_VERSION_MINOR							1
#define SCRIPT_VERSION_PATCH							0
#define SCRIPT_VERSION_NAME								"CCRP"

// Database MYSQL
#define LOG_ERROR
#define LOG_WARNING
#define LOG_DEBUG

//------------------------------------------------------------------------------
// Server Property Settings
#define CCRP::%0(%1) forward %0(%1); public %0(%1)
#define CGEN_MEMORY						20000
new MySQL: gSQL;

#undef	  	MAX_PLAYERS
#define	 	MAX_PLAYERS			50
#define		SECONDS_TO_LOGIN 	30
#undef     MAX_VEHICLES
#define     MAX_VEHICLES        500

#define MIN_VIRTUAL_WORLD				(1000000)
#define MAX_VIRTUAL_WORLD				(1200000)


#define SCM SendClientMessage
#define SCMA SendClientMessageToAll
#define SPD ShowPlayerDialog
#define Error(%1,%2) SendClientMessage(%1, COLOR_GREY3, ""RED_E"ERROR: "WHITE_E""%2)
#define Usage(%1,%2) SendClientMessage(%1, COLOR_LIME , ">"SBLUE_E" KEGUNAAN: "WHITEP_E""%2)
#define Servers(%1,%2) SendClientMessage(%1, COLOR_WHITE, ""SBLUE_E"SERVER: "WHITE_E""%2)
#define Info(%1,%2) SendClientMessageEx(%1, ANDRE, "INFO: "WHITE_E""%2)

//------------------------------------------------------------------------------
// Define Include
#include "../modules/Define/colors.pwn"
#include "../modules/Define/enum.pwn"

//------------------------------------------------------------------------------
// Pawo Include
#include <streamer>
#include <nex-ac>
#include <sscanf2>
#include <a_mysql>
#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>
#include <YSI_Data\y_iterate>
#include <YSI_Visual\y_commands>
#include <YSI_Coding\y_va>
#include <YSI_Core\y_utils>
#include <mSelection> 
#include <utils>
#include <admsys>
#include <progress2>
#include <crashdetect>
#include <sampvoice>
#include <garageblock>


//------------------------------------------------------------------------------
// Main Gamemode Scripting

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else


main()
{
	print("============================================================\n");
	printf("\n\n%s %d.%d.%d Initializing......\n\n", SCRIPT_VERSION_NAME, SCRIPT_VERSION_MAJOR, SCRIPT_VERSION_MINOR, SCRIPT_VERSION_PATCH);
	print("============================================================\n");
}

#endif

public OnGameModeInit()
{
	print("\n\n============================================================\n");
	print("Initializing...\n");
	SetGameModeText(SCRIPT_VERSION_NAME " " #SCRIPT_VERSION_MAJOR "." #SCRIPT_VERSION_MINOR "." #SCRIPT_VERSION_PATCH);
	// Mysql Connection
	mysql_log(ERROR | WARNING);
    gSQL = mysql_connect_file();

    if(gSQL == MYSQL_INVALID_HANDLE || mysql_errno(gSQL) != 0) {

        new error[128];
        mysql_error(error, sizeof(error), gSQL);
        printf("[Database] Failed! Error: [%d] %s", mysql_errno(gSQL), error);
		mysql_close();
		SendRconCommand("exit");
    }
    else
    {
        printf("[Database] Connected!");
        //CallRemoteFunction("OnDBConnReady", "");
		print("MySQL-connection established!");
        ShowPlayerMarkers(0);
        DisableInteriorEnterExits();
        EnableStuntBonusForAll(0);
        BlockGarages(.text="NO ENTER");
        SetNameTagDrawDistance(10.0000);
        LimitGlobalChatRadius(10.0000);
	}
	return 1;
}

public OnGameModeExit()
{
	mysql_close();
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	
	return 1;
}

hook OnPlayerConnect(playerid)
{
	loadLogo(playerid);

    GPSMarker[playerid] = 0;
	SetPlayerColor(playerid, 0xFFFFFFFF);
	g_MysqlRaceCheck[playerid]++;

    for(new i; i < sizeof(sc_VendingMachines); i++)
	{
		RemoveBuildingForPlayer(playerid, sc_VendingMachines[i][e_Model], sc_VendingMachines[i][e_PosX], sc_VendingMachines[i][e_PosY], sc_VendingMachines[i][e_PosZ], 0.25);
	}

    // reset player data
	static const empty_player[E_PLAYERS];
	Player[playerid] = empty_player;
	GetPlayerName(playerid, Player[playerid][Name], MAX_PLAYER_NAME);

    // cek nama
    new strPname[128];
	format(strPname, sizeof(strPname), "Nama %s Tidak Sesuai\nHarap Gunakan Nama Roleplay\nContoh\nJack_Toreto, Gylbert_Timberli, Andreas_Wilson", Player[playerid][Name]);
	if(!IsValidRoleplayName(Player[playerid][Name])) return ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "UCP", strPname, "Okay", "");
	
    // load ucp
    new Qucp[128];
	mysql_format(gSQL, Qucp, sizeof Qucp, "SELECT * FROM `ucp` WHERE `ucp_name` = '%s'", Player[playerid][Name]);
	mysql_query(gSQL, Qucp, true);
	cache_get_value_name(0, "ucp_name", cUcp[playerid][Uname], 65);
	cache_get_value_name_int(0, "blacklist", cUcp[playerid][blacklist]);
	new rows = cache_num_rows();
	if(!rows) return ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Login", "UCP tidak terdaftar.", "Okay", "");
	if(cUcp[playerid][blacklist] == 1) return ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Login", "UCP blacklist.", "Okay", "");

	// cek login
	new query[103];
	mysql_format(gSQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", Player[playerid][Name]);
	mysql_tquery(gSQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	cache_delete(rows);

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	destroyLogo(playerid);
	destroyNotif(playerid);

	return 1;
}

//------------------------------------------------------------------------------
// Include Module To Main Script
// Include



// Function
#include "../modules/func/sqlfun.pwn"
#include "../modules/func/sqlquery.pwn"

// Callback
#include "../modules/callback/dialog.pwn"
#include "../modules/callback/anticheat.pwn"

// Hook
#include "../modules/textdraw/notiftd.pwn"
#include "../modules/textdraw/logo.pwn"

//------------------------------------------------------------------------------