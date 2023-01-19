
		/*																																								*\
																	*[GH_Stamina] Version: 1.0* 



											|		This simple include allows you to create and manage a stamina system.		|
	
			Utils:
		__________________________________________________________________________________________________________________________________________________________________
		/																																								/
																		[Utils]

		[+]PVAR: "Stamina"	-	"MAX_Stamina"	-	"Exhausted"-	-	"Sprint_Velocity"	



	-	[+] Define:

			*- #define STAMINA_DEFAULT_RECOVERYTIME		(5000)    		// Default value of Recovery time in milliseconds (tired anim)
			

	-	[+] Callback:

			*- public OnPlayerStaminaOver(playerid) 				 	// When the player is exhausted

	-	[+] Functions:
	
			*- IsPlayerRunning(playerid) 								// Check If the player is running

			*- IsPlayerExhausted(playerid) 								// Check If the player is exhausted

			*- SetPlayerExhausted(playerid, bool:Exhausted) 			// set the exhausted player (tired anim timing = STAMINA_DEFAULT_RECOVERYTIME)


			*- GetPlayerStamina(playerid)								// Get the player's current stamina  													(INTEGAR)
			*- GetPlayerMaxStamina(playerid) 							// Get the player's maximum stamina  													(INTEGAR)

			*- GivePlayerStamina(playerid, value) 						// Add / Subtract the player's current stamina   										(INTEGAR)
			*- GivePlayerMaxStamina(playerid, value) 					// Add / Subtract the player's maximum stamina   										(INTEGAR)

			*- SetPlayerStamina(playerid, value) 						// Set the player's current stamina 													(INTEGAR)
			*- SetPlayerMaxStamina(playerid, Float:value)						// Set the player's maximum stamina 													(INTEGAR)

			*- GivePlayerSprintVelocity(playerid, Float:value)         	// multiply / divide the player's sprint speed (exceeded (2.0) you will get a bad result) (FLOAT)
			*_ GetPlayerSprintVelocity(playerid) 						// Get the player's sprint velocity 													  (FLOAT)

		__________________________________________________________________________________________________________________________________________________________________
		/																																								*/
																																										
// [Includes]

#include <a_samp>

// [Defines]

#if defined include_Player_Status_Plus
    #endinput
#else
	#define include_Player_Status_Plus
#endif




#if !defined STAMINA_DEFAULT_RECOVERYTIME
	#define STAMINA_DEFAULT_RECOVERYTIME    (4000)
#endif
#if !defined HUNGER_DEFAULT_TIME
	#define HUNGER_DEFAULT_TIME    (4000)
#endif
#if !defined THIRST _DEFAULT_TIME
	#define THIRST_DEFAULT_TIME    (4000)
#endif

// [Callback]

forward OnPlayerStaminaOver(playerid);
forward OnPlayerThirsty(playerid);
forward OnPlayerHungry(playerid);


// [Functions]

stock IsPlayerRunning(playerid) // Check if the player is running
{
    if(!IsPlayerConnected(playerid) || IsPlayerInAnyVehicle(playerid) || IsPlayerExhausted(playerid)) return 0;

    new keys, updown, leftright;
    GetPlayerKeys(playerid, keys, updown, leftright);
    if(keys & KEY_SPRINT && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_USEJETPACK) return 1;
    else return 0;
}







stock IsPlayerExhausted(playerid) // Check if the player is exhausted
{
	if(GetPVarInt(playerid, "Exhausted") == 1) return true;
	else return false;
}
stock IsPlayerThirsty(playerid) // Check if the player is exhausted
{
	if(GetPVarInt(playerid, "Thirsty") == 1) return true;
	else return false;
}
stock IsPlayerHungry(playerid) // Check if the player is exhausted
{
	if(GetPVarInt(playerid, "Hungry") == 1) return true;
	else return false;
}







forward SetPlayerExhausted(playerid, bool:Exhausted);
public SetPlayerExhausted(playerid, bool:Exhausted)  // If true the player will do the recovery animation for the time set by #define STAMINA_DEFAULT_RECOVERYTIME
{
	if(Exhausted) 
	{
		TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(playerid,1);

		ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.1, 0, 1, 1, 0, STAMINA_DEFAULT_RECOVERYTIME, 1);

		SetPVarInt(playerid, "Exhausted", 1);
		SetTimerEx("SetPlayerExhausted", STAMINA_DEFAULT_RECOVERYTIME, false, "ib", playerid, false);
	}
	else SetPVarInt(playerid, "Exhausted", 0), ClearAnimations(playerid);
	return 1;
}
forward SetPlayerThirsty(playerid, bool:Thirsty);
public SetPlayerThirsty(playerid, bool:Thirsty)  // If true the player will do the recovery animation for the time set by #define THIRST_DEFAULT_TIME
{
	if(Thirsty) 
	{
		TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(playerid,1);

		ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.1, 0, 1, 1, 0, THIRST_DEFAULT_TIME, 1);

		SetPVarInt(playerid, "Thirsty", 1);
		SetTimerEx("SetPlayerThirsty", THIRST_DEFAULT_TIME, false, "ib", playerid, false);
	}
	else SetPVarInt(playerid, "Thirsty", 0), ClearAnimations(playerid);
	return 1;
}
forward SetPlayerHungry(playerid, bool:Hungry);
public SetPlayerHungry(playerid, bool:Hungry)  // If true the player will do the recovery animation for the time set by #define HUNGER_DEFAULT_TIME
{
	if(Hungry) 
	{
		TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(playerid,1);

		ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.1, 0, 1, 1, 0, HUNGER_DEFAULT_TIME, 1);

		SetPVarInt(playerid, "Hungry", 1);
		SetTimerEx("SetPlayerHungry", HUNGER_DEFAULT_TIME, false, "ib", playerid, false);
	}
	else SetPVarInt(playerid, "Hungry", 0), ClearAnimations(playerid);
	return 1;
}







stock GetPlayerStamina(playerid) // Get the player's current stamina (integar)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Stamina") == PLAYER_VARTYPE_NONE) return -1;
	new stamina = GetPVarInt(playerid, "Stamina");
	return stamina;
}
stock GetPlayerThirst(playerid) // Get the player's current stamina (integar)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Thirst") == PLAYER_VARTYPE_NONE) return -1;
	new thirst = GetPVarInt(playerid, "Thirst");
	return thirst;
}
stock GetPlayerHunger(playerid) // Get the player's current hunger (integar)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Hunger") == PLAYER_VARTYPE_NONE) return -1;
	new hunger = GetPVarInt(playerid, "Hunger");
	return hunger;
}







stock GetPlayerMaxStamina(playerid) // Set the player's maximum stamina (integar)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Stamina") == PLAYER_VARTYPE_NONE) return -1;
	new maxstamina = GetPVarInt(playerid, "MAX_Stamina");
	return maxstamina;
}
stock GetPlayerMaxThirst(playerid) // Set the player's maximum Thirst (integar)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Thirst") == PLAYER_VARTYPE_NONE) return -1;
	new maxthirst = GetPVarInt(playerid, "MAX_Thirst");
	return maxthirst;
}
stock GetPlayerMaxHunger(playerid) // Set the player's maximum hunger (integar)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Hunger") == PLAYER_VARTYPE_NONE) return -1;
	new maxhunger = GetPVarInt(playerid, "MAX_Hunger");
	return maxhunger;
}







stock GivePlayerStamina(playerid, value) // Add / Subtract the player's current stamina (integar)
{
	new stamina = GetPVarInt(playerid, "Stamina");

	if(stamina == -1) return 1;
	if(stamina + value == 0) return CallLocalFunction("OnPlayerStaminaOver", "i", playerid);
	if(stamina + value <= GetPVarInt(playerid, "MAX_Stamina")) 
	{
		stamina = stamina+value;
		SetPVarInt(playerid, "Stamina", stamina);
		return 1;
	}
	else return 0;
}
stock GivePlayerThirst(playerid, value) // Add / Subtract the player's current thirst (integar)
{
	new thirst = GetPVarInt(playerid, "Thirst");

	if(thirst == -1) return 1;
	if(thirst + value == 0) return CallLocalFunction("OnPlayerThirsty", "i", playerid);
	if(thirst + value <= GetPVarInt(playerid, "MAX_Thirst")) 
	{
		thirst = thirst+value;
		SetPVarInt(playerid, "Thirst", thirst);
		return 1;
	}
	else return 0;
}
stock GivePlayerHunger(playerid, value) // Add / Subtract the player's current hunger (integar)
{
	new hunger = GetPVarInt(playerid, "Hunger");

	if(hunger == -1) return 1;
	if(hunger + value == 0) return CallLocalFunction("OnPlayerHungry", "i", playerid);
	if(hunger + value <= GetPVarInt(playerid, "MAX_Hunger")) 
	{
		hunger = hunger+value;
		SetPVarInt(playerid, "Hunger", hunger);
		return 1;
	}
	else return 0;
}







stock GivePlayerMaxStamina(playerid, value) // Add / Subtract the player's MAX stamina (integar)
{
	new maxstamina = GetPVarInt(playerid, "MAX_Stamina"), stamina = GetPVarInt(playerid, "Stamina");

	maxstamina = maxstamina + value;
	SetPVarInt(playerid, "MAX_Stamina", maxstamina);

	if(stamina > maxstamina)stamina = maxstamina, SetPVarInt(playerid, "Stamina", stamina);

	return 1;
}
stock GivePlayerMaxThirst(playerid, value) // Add / Subtract the player's MAX thirst (integar)
{
	new maxthirst = GetPVarInt(playerid, "MAX_Thirst"), thirst = GetPVarInt(playerid, "Thirst");

	maxthirst = maxthirst + value;
	SetPVarInt(playerid, "MAX_Thirst", maxthirst);

	if(thirst > maxthirst)thirst = maxthirst, SetPVarInt(playerid, "Thirst", thirst);

	return 1;
}
stock GivePlayerMaxHunger(playerid, value) // Add / Subtract the player's MAX hunger (integar)
{
	new maxhunger = GetPVarInt(playerid, "MAX_Hunger"), hunger = GetPVarInt(playerid, "Hunger");

	maxhunger = maxhunger + value;
	SetPVarInt(playerid, "MAX_Hunger", maxhunger);

	if(hunger > maxhunger)hunger = maxhunger, SetPVarInt(playerid, "Hunger", hunger);

	return 1;
}







stock SetPlayerStamina(playerid, value) // Set the player's current stamina (the current stamina cannot be higher than MAX_STAMINA )
{
	if(value > GetPVarInt(playerid, "MAX_Stamina")) return SetPVarInt(playerid, "Stamina", GetPVarInt(playerid, "MAX_Stamina")); //if the current stamina exceeds the MAX_STAMINA, set the player's MAX_STAMINA directly to avoid bugs
	else if(value == 0) OnPlayerStaminaOver(playerid);
	SetPVarInt(playerid, "Stamina", value);
	return 1;
}
stock SetPlayerThirst(playerid, value) // Set the player's current thirst (the current stamina cannot be higher than MAX_Thirst )
{
	if(value > GetPVarInt(playerid, "MAX_Thirst")) return SetPVarInt(playerid, "Thirst", GetPVarInt(playerid, "MAX_Thirst")); //if the current stamina exceeds the MAX_Thirst, set the player's MAX_Thirst directly to avoid bugs
	else if(value == 0) OnPlayerThirsty(playerid);
	SetPVarInt(playerid, "Thirst", value);
	return 1;
}
stock SetPlayerHunger(playerid, value) // Set the player's current hunger (the current Hunger cannot be higher than MAX_Hunger )
{
	if(value > GetPVarInt(playerid, "MAX_Hunger")) return SetPVarInt(playerid, "Hunger", GetPVarInt(playerid, "MAX_Hunger")); //if the current stamina exceeds the MAX_Hunger, set the player's MAX_Hunger directly to avoid bugs
	else if(value == 0) OnPlayerHungry(playerid);
	SetPVarInt(playerid, "Hunger", value);
	return 1;
}







stock SetPlayerMaxStamina(playerid, value) //set the player's maximum stamina 
{
	new stamina = GetPlayerStamina(playerid), max_stamina = value;

	if(stamina > max_stamina) stamina = max_stamina, SetPVarInt(playerid, "Stamina", stamina);
	SetPVarInt(playerid, "MAX_Stamina", max_stamina);
	return 1;
}
stock SetPlayerMaxThirst(playerid, value) //set the player's maximum thirst 
{
	new thirst = GetPlayerThirst(playerid), max_thirst = value;

	if(thirst > max_thirst) thirst = max_thirst, SetPVarInt(playerid, "Thirst", thirst);
	SetPVarInt(playerid, "MAX_Thirst", max_thirst);
	return 1;
}
stock SetPlayerMaxHunger(playerid, value) //set the player's maximum hunger 
{
	new hunger = GetPlayerHunger(playerid), max_hunger = value;

	if(hunger > max_hunger) hunger = max_hunger, SetPVarInt(playerid, "Hunger", hunger);
	SetPVarInt(playerid, "MAX_Hunger", max_hunger);
	return 1;
}







stock GivePlayerSprintVelocity(playerid, Float:value) // multiply / divide the player's sprint speed (Recommended not to exceed 2.0 to avoid a bad result) (float)
{
	if(value == 0.0) return 1;
	else if(value > 0.0)
	{
		new Float:x, Float:y, Float:Z;

		GetPlayerVelocity(playerid, x, y, z);
		SetPlayerVelocity(playerid, x*value, y*value, z*value);
	}
	else if(value < 0.0) // if Subtract
	{
		GetPlayerVelocity(playerid, x, y, z);
		SetPlayerVelocity(playerid, x/value, y/value, z/value);
	}
	SetPVarFloat(playerid, "Sprint_Velocity", value);
		return 1;
}

stock GetPlayerSprintVelocity(playerid) // Get the player's sprint velocity (float)
{
	if(!IsPlayerConnected(playerid)) return -1;
	new Float:velocity = GetPVarFloat(playerid, "Sprint_Velocity");
	return Float:velocity;
}

