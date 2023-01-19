/**
#--------------------------------------------------------------#
# /$$       /$$           /$$      /$$$$$$$$/$$$$$$   /$$$$$$  #
#| $$      |__/          | $$     |_____ $$/$$$_  $$ /$$__  $$ #
#| $$$$$$$  /$$ /$$$$$$$ | $$   /$$    /$$/ $$$$\ $$|__/  \ $$ #
#| $$__  $$| $$| $$__  $$| $$  /$$/   /$$/| $$ $$ $$  /$$$$$$/ #
#| $$  \ $$| $$| $$  \ $$| $$$$$$/   /$$/ | $$\ $$$$ /$$____/  #
#| $$  | $$| $$| $$  | $$| $$_  $$  /$$/  | $$ \ $$$| $$       #
#| $$$$$$$/| $$| $$  | $$| $$ \  $$/$$/   |  $$$$$$/| $$$$$$$$ #
#|_______/ |__/|__/  |__/|__/  \__/__/     \______/ |________/ #
#--------------------------------------------------------------#

#------------------------ INDONESIA -------------------------#
# JANGAN MERUBAH AUTHOR, KALO MAU PAKE NAMA SENDIRI YA BIKIN #
# KALO GA BISA BIKIN YA BELAJAR, MAAF KALO BANYAK KEKURANGAN #
# DISCORD : hamdani#6477                                     #
# xbox    : bink702                                          #

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
#define SCRIPT_VERSION_NAME								"DevSuKaSuKaGamemode"

// Database MYSQL
#define MySQL_HOST                                      "127.0.0.1"
#define MySQL_USER                                      "root"
#define MySQL_DB                                        "kusukarp"
#define MySQL_PASS                                      ""

#define LOG_ERROR
#define LOG_WARNING
#define LOG_DEBUG

//------------------------------------------------------------------------------
// Server Property Settings

#define MAX_BUILDINGS									32
#define MAX_CREATED_VEHICLE_PER_PLAYER					1
#define ADVERTISE_INTERVAL								300000
#define UPDATE_HOSTNAME_INTERVAL						15000

//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
// Define Include

#include "../modules/Define/colors.pwn"

//------------------------------------------------------------------------------


#define CGEN_MEMORY						20000

//------------------------------------------------------------------------------

// Pawo Include

#include <streamer>
#include <nex-ac>
#include <sscanf2>
#include <easy-mysql>
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


//------------------------------------------------------------------------------


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
	SQL::Connect(MySQL_HOST, MySQL_USER, MySQL_PASS, MySQL_DB, "latin5", 1, 3306, true);
	if(mysql_errno() != 0)
    {
        print("ERROR: A MySQL-connection could not be established!");
        mysql_close();
		SendRconCommand("exit");
	}
	else
	{
		print("MySQL-connection established!");
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
	SetPlayerPos(playerid, 143.7643,-70.2287 + 3.0,1.4297);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	SetPlayerSkin(playerid, 12);
	return 1;
}

SetPlayerSkinFix(playerid, skinid)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    new
        Float:tmpPos[4],
        vehicleid = GetPlayerVehicleID(playerid),
        seatid = GetPlayerVehicleSeat(playerid);

    GetPlayerPos(playerid, tmpPos[0], tmpPos[1], tmpPos[2]);
    GetPlayerFacingAngle(playerid, tmpPos[3]);

    // If the skinid is invalid, less than 0 or more than 311 or is equal to 74 (invalid skin), then do nothing
    if (0 > skinid > 311 || skinid == 74)
    {
        return 0;
    }

    if (GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DUCK)
    {
        SetPlayerPos(playerid, tmpPos[0], tmpPos[1], tmpPos[2]);
        SetPlayerFacingAngle(playerid, tmpPos[3]);
        TogglePlayerControllable(playerid, true); // preventing any freeze - optional
        return SetPlayerSkin(playerid, skinid);
    }
    else if (IsPlayerInAnyVehicle(playerid))
    {
        new
            tmp;

        RemovePlayerFromVehicle(playerid);
        SetPlayerPos(playerid, tmpPos[0], tmpPos[1], tmpPos[2]);
        SetPlayerFacingAngle(playerid, tmpPos[3]);
        TogglePlayerControllable(playerid, true); // preventing any freeze - important! because of doing animations of exiting vehicle
        tmp = SetPlayerSkin(playerid, skinid);
        PutPlayerInVehicle(playerid, vehicleid, (seatid == 128) ? 0 : seatid);
        return tmp;
    }
    else
    {
        return SetPlayerSkin(playerid, skinid);
    }
}


YCMD:ucok(playerid, params[], help) 
{
	SetPlayerSkin(playerid, 0);
	return 1;
}






//------------------------------------------------------------------------------
// Include Module To Main Script
// Include
#include "../modules/Vehicle/Vehicle.pwn"
#include "../modules/Vehicle/Spidometer.pwn"
#include "../modules/Player/playerStatus.pwn"
#include "../modules/Player/playermenupc.pwn"
#include "../modules/Player/playerInventory.pwn"


// Function
#include "../modules/Function/ClickPlayerTextDraw.pwn"
//------------------------------------------------------------------------------