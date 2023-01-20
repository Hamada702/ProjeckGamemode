public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new Query[216], Query2[216], String[216], String2[216];
	switch (dialogid)
	{
		case DIALOG_UNUSED: return 1; // Useful for dialogs that contain only information and we do nothing depending on whether they responded or not

        case DIALOG_INVALID:
        {
            if(!response) return KickMessages(playerid, "[IMIGRAN]");
            return KickMessages(playerid, "[IMIGRAN]");
        }

		case DIALOG_LOGIN:
		{
			if (!response) return KickMessages(playerid, "[IMIGRAN]");

			new hashed_pass[65];
			SHA256_PassHash(inputtext, Player[playerid][Salt], hashed_pass, 65);

			if (strcmp(hashed_pass, Player[playerid][Password]) == 0)
			{
				//correct password, spawn the player
				ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "{ffffff}Selamat datang kembali di {00ffff}ColdCity RolePlay.\n{ffffff}Gunekan {00ff00}/updates {ffffff}untuk melihat info update terbaru", "Okay", "");

				// sets the specified cache as the active cache so we can retrieve the rest player data
				cache_set_active(Player[playerid][Cache_ID]);

				//AssignPlayerData(playerid);

				// remove the active cache from memory and unsets the active cache as well
				cache_delete(Player[playerid][Cache_ID]);
				Player[playerid][Cache_ID] = MYSQL_INVALID_CACHE;

				KillTimer(Player[playerid][LoginTimer]);
				Player[playerid][LoginTimer] = 0;
				Player[playerid][IsLoggedIn] = true;


				// spawn the player to their last saved position after login
				SetSpawnInfo(playerid, NO_TEAM, Player[playerid][Skin], Player[playerid][X_Pos], Player[playerid][Y_Pos], Player[playerid][Z_Pos], Player[playerid][A_Pos], 0, 0, 0, 0, 0, 0);
				GivePlayerMoney(playerid, Player[playerid][Money]);
				SpawnPlayer(playerid);
				
			}
			else
			{
				Player[playerid][LoginAttempts]++;

				if (Player[playerid][LoginAttempts] >= 3)
				{
					ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "You have mistyped your password too often (3 times).", "Okay", "");
					DelayedKick(playerid);
				}
				else ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Wrong password!\nPlease enter your password in the field below:", "Login", "Abort");
			}
		}
		case DIALOG_REGISTER:
		{
			if (!response) return KickMessages(playerid, "[IMIGRAN]");
			if(strlen(inputtext) < 5 || strlen(inputtext) > 32) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", "Your password must be longer than 5 characters!\nPlease enter your password in the field below:", "Register", "Abort");
			// 16 random characters from 33 to 126 (in ASCII) for the salt
			for (new i = 0; i < 16; i++) Player[playerid][Salt][i] = random(94) + 33;
			SHA256_PassHash(inputtext, Player[playerid][Salt], Player[playerid][Password], 65);
			ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_PASSWORD, "Konfirmasi password anda", ""WHITE_E"Masukkan password yang anda masukkan di kolom sebelumnya:", "Konfirmasi", "Kembali");
		}
		case DIALOG_PASSWORD:
		{
			if (response)
			{
				if(strlen(inputtext) < 5 || strlen(inputtext) > 32) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", "Your password must be longer than 5 characters!\nPlease enter your password in the field below:", "Register", "Abort");
				// 16 random characters from 33 to 126 (in ASCII) for the salt
				new hashed_pass[65];
				SHA256_PassHash(inputtext, Player[playerid][Salt], hashed_pass, 65);

				if(strcmp(hashed_pass, Player[playerid][Password]))
                return ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_PASSWORD, "Konfirmasi password anda salah", ""WHITE_E"Masukkan password yang anda masukkan di kolom sebelumnya:\n\n"RED_E"ERROR"WHITE_E": Password tidak sesuai, masukkan ulang password atau anda dapat ...\n... mengubahnya dengan password baru dengan menekan opsi 'Kembali'", "Konfirmasi", "Kembali");
				new string[200], header[50];
				format(header, sizeof header, "Nama : {37DB45}%s", Player[playerid][Name]);
				format(string, sizeof string, "Jenis Kelamin\t ({37DB45}None{ffffff})\nTanggal Lahir\t ({37DB45}None{ffffff})\nAsal Karakter\t ({37DB45}None{ffffff})\nSelesai");
				ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Exit");
			}
			else ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Register", "Anda Membatalkan Proses Pendaftaran", "Exit", "");
			return 1;
		}

		case DIALOG_REGISTER_MENU:
		{
			if(response)
			{
				switch(listitem)
            	{
					case 0:
					{
						ShowPlayerDialog(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Jenis Kelamin", "Laki-laki\nPerempuan", "Select", "Cancel");
					}
					case 1:
					{
						ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
					}
					case 2:
					{
						ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Kota Asal", "Los Santos\nSan Fierro\nLas Venturas", "Select", "Cancel");
					}
					case 3:
					{
						if(strlen(Player[playerid][Gender]) < 1 || strlen(Player[playerid][Birth]) < 1 || strlen(Player[playerid][City]) < 1 ) return ShowPlayerDialog(playerid, DIALOG_RNULL, DIALOG_STYLE_MSGBOX, "Register", "Harap Isi Semua Data", "Exit", "");
						new query[512];
						Player[playerid][IsRegister] = 1;
						Player[playerid][TMPName] = Player[playerid][Name];
						mysql_format(gSQL, query, sizeof query, "INSERT INTO `players` (`username`, `password`, `salt`, `P_gender`, `P_birth`, `P_city`, `P_skin`, `IsRegister`) VALUES ('%e', '%s', '%e', '%d', '%s', '%d', '%d', %d)", Player[playerid][Name], Player[playerid][Password], Player[playerid][Salt], Player[playerid][Gender], Player[playerid][Birth], Player[playerid][City], Player[playerid][Skin], Player[playerid][IsRegister]);
						mysql_tquery(gSQL, query, "OnPlayerRegister", "d", playerid);
					}
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Register", "Anda Membatalkan Proses Pendaftaran", "Okay", "");
			return 1;
		}

		case DIALOG_GENDER:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Jenis Kelamin", "Laki-laki\nPerempuan", "Select", "Cancel");
			if(response)
			{
				Player[playerid][Gender] = listitem + 1;
				switch (listitem) {
					case 0: {
						SendClientMessage(playerid, -1, "Anda seorang laki-laki");
						Player[playerid][Gender] = 1;
						Player[playerid][Skin] = 230;
					}
					case 1: {
						SendClientMessage(playerid, -1, "Anda seorang perempuan");
						Player[playerid][Gender] = 2;
						Player[playerid][Skin] = 193;
					}
				}
				new string[200], header[50];
				format(header, sizeof header, "Nama : {37DB45}%s", Player[playerid][Name]);
				format(string, sizeof string, "Jenis Kelamin\t ({37DB45}%s{ffffff})\nTanggal Lahir\t ({37DB45}None{ffffff})\nAsal Karakter\t ({37DB45}None{ffffff})\nSelesai", Player[playerid][Gender] == 1 ? ("Laki-laki") : ("Perempuan"));
				update_player_int(playerid, "P_gender", Player[playerid][Gender]);
				ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Kembali");
			}
			else ShowPlayerDialog(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Jenis Kelamin", "Laki-laki\nPerempuan", "Select", "Cancel");
			return 1;
		}

		case DIALOG_DATEBIRTH:
		{
        	if(!response) return ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
        	if(response)
			{
				new
					iDay,
					iMonth,
					iYear,
					day,
					month,
					year;

				getdate(year, month, day);

				static const
						arrMonthDays[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

				if(sscanf(inputtext, "p</>ddd", iDay, iMonth, iYear)) {
					ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Error: Tidak sesuai format, gunakan / di setiap tanggal/bulan/tahun!\n\nMasukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
				}
				else if(iYear < 1900 || iYear > year) {
					ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Error: Takun tidak sesuai!\n\nMasukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
				}
				else if(iMonth < 1 || iMonth > 12) {
					ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Error: Bulan tidak sesuai!\n\nMasukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
				}
				else if(iDay < 1 || iDay > arrMonthDays[iMonth - 1]) {
					ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Error: Hari tidak sesuai!\n\nMasukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
				}
				else {
					format(Player[playerid][Birth], 24, inputtext);
					new string[200], header[50];
					format(header, sizeof header, "Nama : {37DB45}%s", Player[playerid][Name]);
					format(string, sizeof string, "Jenis Kelamin\t ({37DB45}%s{ffffff})\nTanggal Lahir\t ({37DB45}%s{ffffff})\nAsal Karakter\t ({37DB45}None{ffffff})\nSelesai", Player[playerid][Gender] == 1 ? ("Laki-laki") : ("Perempuan"), Player[playerid][Birth]);
					ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Kembali");
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_DATEBIRTH, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukkan tanggal lahir dengan mengikuti format (DD/MM/YYYY):", "Submit", "Cancel");
			return 1;
    	}

		case DIALOG_CITY:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Kota Asal", "Los Santos\nSan Fierro\nLas Venturas", "Select", "Cancel");
			if(response)
			{
				Player[playerid][City] = listitem + 1;
				switch (listitem) {
					case 0: {
						SendClientMessage(playerid, -1, "Kota Asal Los Santos");
						Player[playerid][City] = 1;
					}
					case 1: {
						SendClientMessage(playerid, -1, "Kota Asal San Fierro");
						Player[playerid][City] = 2;
					}
					case 2: {
						SendClientMessage(playerid, -1, "Kota Asal Las Venturas");
						Player[playerid][City] = 3;
					}
				}
				new kota[26];
				switch (Player[playerid][City])
				{
					case 1: kota = "Los Santos";
					case 2: kota = "San Fierro";
					case 3: kota = "Las Venturas";
				}
				new string[200], header[50];
				format(header, sizeof header, "Nama : {37DB45}%s", Player[playerid][Name]);
				format(string, sizeof string, "Jenis Kelamin\t ({37DB45}%s{ffffff})\nTanggal Lahir\t ({37DB45}%s{ffffff})\nAsal Karakter\t ({37DB45}%s{ffffff})\nSelesai", Player[playerid][Gender] == 1 ? ("Laki-laki") : ("Perempuan"), Player[playerid][Birth], kota);
				
				ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Kembali");
			}
			else ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Kota Asal", "Los Santos\nSan Fierro\nLas Venturas", "Select", "Cancel");
			return 1;
		}

		case DIALOG_RNULL:
        {
			new string[200], header[50];
			format(header, sizeof header, "Nama : {37DB45}%s", Player[playerid][Name]);
			format(string, sizeof string, "Jenis Kelamin\t ({37DB45}None{ffffff})\nTanggal Lahir\t ({37DB45}None{ffffff})\nAsal Karakter\t ({37DB45}None{ffffff})\nSelesai");
			ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Exit");
            if(!response) return ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Exit");
            return ShowPlayerDialog(playerid, DIALOG_REGISTER_MENU, DIALOG_STYLE_LIST, header, string,"select","Exit");
        }

		case DIALOG_CONTROL_GPS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						ShowPlayerDialog(playerid, DIALOG_GPS_CATEGORY, DIALOG_STYLE_TABLIST_HEADERS, "CCRP GPS ADMIN MENU", "\
						S.No\tInformation\n\
						1.\tPemerintahan\n\
						2.\tTempat Umum\n\
						3.\tPekerjaan\n\
						4.\tHiburan\n\
						5.\tLainnya", "ADD", "Cancel");
						return 1;
					}
					case 1:
					{
						NTD_INFOEx(playerid, "Masukan nama GPS~n~yang akan di hapus", 5000);
						ShowPlayerDialog(playerid, DIALOG_DEL_GLOC, DIALOG_STYLE_INPUT, "Delete GPS Location", "Please enter the location name to remove/delete the location in /gps.", "Delete", "Cancel");
					}
					case 2:
					{
						NTD_INFOEx(playerid, "Masukan nama GPS~n~yang akan kamu kunjungi", 5000);
						ShowPlayerDialog(playerid, DIALOG_TP_GLOC, DIALOG_STYLE_INPUT, "Teleport GPS Location", "Please enter the location name to teleport through /gps location.", "Teleport", "Cancel");
					}
					case 3:
					{
						ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_TABLIST_HEADERS, "CCRP GPS MENU", "\
						S.No\tInformation\n\
						1.\tPemerintahan\n\
						2.\tTempat Umum\n\
						3.\tPekerjaan\n\
						4.\tHiburan\n\
						5.\tShow GPS Locations\n\
						6.\tMatikan GPS", "Select", "Cancel");
					}
					case 4:
					{
						if (GPSMarker[playerid] == 0) return NTD_ERROREx(playerid, "GPS Sudah Di matikan", 5000);
						DestroyDynamicMapIcon(GPSMarker[playerid]);
						GPSMarker[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
        				gOnGPS[playerid] = false;
						NTD_SUCCESEx(playerid, "GPS Dimatikan", 5000);
					}
				}
			}
			return 1;
		}
		case DIALOG_GPS_CATEGORY:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						ShowPlayerDialog(playerid, DIALOG_ADD_PEMERINTAH, DIALOG_STYLE_INPUT, "Add GPS Location", "Nama Tempat", "Add", "Cancel");
					}
					case 1:
					{
						ShowPlayerDialog(playerid, DIALOG_ADD_UMUM, DIALOG_STYLE_INPUT, "Add GPS Location", "Nama Tempat", "Add", "Cancel");
					}
					case 2:
					{
						ShowPlayerDialog(playerid, DIALOG_ADD_PEKERJAAN, DIALOG_STYLE_INPUT, "Add GPS Location", "Nama Tempat", "Add", "Cancel");
					}
					case 3:
					{
						ShowPlayerDialog(playerid, DIALOG_ADD_HIBURAN, DIALOG_STYLE_INPUT, "Add GPS Location", "Nama Tempat", "Add", "Cancel");
					}
					case 4:
					{
						ShowPlayerDialog(playerid, DIALOG_ADD_LAINNYA, DIALOG_STYLE_INPUT, "Add GPS Location", "Nama Tempat", "Add", "Cancel");
					}
				}
			}
			return 1;
		}
		case DIALOG_DEL_GLOC:
		{
			if(response)
			{
				mysql_format(gSQL, Query, sizeof(Query),"DELETE FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);
				mysql_query(gSQL, Query, false);
				
				format(String, sizeof(String), "Menghapus GPS~n~Lokasi: {F3FF02}%s", inputtext);
				NTD_SUCCESEx(playerid, String, 5000);
			}
			return 1;
		}
		case DIALOG_TP_GLOC:
		{
			if(response)
			{
				mysql_format(gSQL, Query, sizeof(Query), "SELECT * FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);
				new Cache:result = mysql_query(gSQL, Query, true);
				if(cache_num_rows())
				{
					cache_get_value_name(0, "LocationName", gInfo[playerid][LocName]);
					cache_get_value_name_float(0, "PositionX", gInfo[playerid][Pos][0]);
					cache_get_value_name_float(0, "PositionY", gInfo[playerid][Pos][1]);
					cache_get_value_name_float(0, "PositionZ", gInfo[playerid][Pos][2]);
					cache_get_value_name_int(0, "InteriorID", gInfo[playerid][Interior]);
					SetPlayerPos(playerid, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2]);
					format(String, sizeof(String), "Berhasil Di Teleport~n~ke lokasi gps~n~dengan nama: {F3FF02}'%s'", gInfo[playerid][LocName]);
					NTD_SUCCESEx(playerid, String, 5000);
				}
				else NTD_ERROREx(playerid, "Lokasi Tidak Ditemukan~n~Atau GPS belum di set", 5000);
				cache_delete(result);
			}
			return 1;
		}
		case DIALOG_GPS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						new Cache:result = mysql_query(gSQL,"SELECT `LocationName`, `PositionX`, `PositionY`, `PositionZ`, `InteriorID`, `VirtualwordID` FROM `gpsdb` WHERE `Category` LIKE 'Pemerintahan'");
						if(!cache_num_rows())
						{
							cache_delete(result);
							NTD_ERROREx(playerid, "Lokasi Tidak Ditemukan~n~Atau GPS belum di set", 5000);
							return 1;
						}
							
						for(new i,j = cache_num_rows(); i< j; i++)
						{
							cache_get_value_name(i,"LocationName", gInfo[playerid][LocName]);
							cache_get_value_name_float(0, "PositionX", gInfo[playerid][Pos][0]);
							cache_get_value_name_float(0, "PositionY", gInfo[playerid][Pos][1]);
							cache_get_value_name_float(0, "PositionZ", gInfo[playerid][Pos][2]);
							format(String, sizeof(String), "%s%d\t%s\n", String, i, gInfo[playerid][LocName]);
						}
						format(String2, sizeof(String2), "S.No\tLocation Name\n%s", String);
							
						NTD_INFOEx(playerid, "Silahkan pilih lokasi~n~yang akan di tandai", 5000);
						ShowPlayerDialog(playerid, DIALOG_GPS_LOC, DIALOG_STYLE_TABLIST_HEADERS, "CCRP Lokasi Pemerintahan", String2, "Select", "Cancel");
						cache_delete(result);
					}
					case 1:
					{
						new Cache:result = mysql_query(gSQL,"SELECT `LocationName`, `PositionX`, `PositionY`, `PositionZ`, `InteriorID`, `VirtualwordID` FROM `gpsdb` WHERE `Category` LIKE 'Tempat Umum'");
						if(!cache_num_rows())
						{
							cache_delete(result);
							NTD_ERROREx(playerid, "Lokasi Tidak Ditemukan~n~Atau GPS belum di set", 5000);
							return 1;
						}
							
						for(new i,j = cache_num_rows(); i< j; i++)
						{
							cache_get_value_name(i,"LocationName", gInfo[playerid][LocName]);
							cache_get_value_name_float(0, "PositionX", gInfo[playerid][Pos][0]);
							cache_get_value_name_float(0, "PositionY", gInfo[playerid][Pos][1]);
							cache_get_value_name_float(0, "PositionZ", gInfo[playerid][Pos][2]);
							format(String, sizeof(String), "%s%d\t%s\n", String, i, gInfo[playerid][LocName]);
						}
						format(String2, sizeof(String2), "S.No\tLocation Name\n%s", String);
							
						NTD_INFOEx(playerid, "Silahkan pilih lokasi~n~yang akan di tandai", 5000);
						ShowPlayerDialog(playerid, DIALOG_GPS_LOC, DIALOG_STYLE_TABLIST_HEADERS, "CCRP Lokasi Tempat Umum", String2, "Select", "Cancel");
						cache_delete(result);
					}
					case 2:
					{
						new Cache:result = mysql_query(gSQL,"SELECT `LocationName`, `PositionX`, `PositionY`, `PositionZ`, `InteriorID`, `VirtualwordID` FROM `gpsdb` WHERE `Category` LIKE 'Pekerjaan'");
						if(!cache_num_rows())
						{
							cache_delete(result);
							NTD_ERROREx(playerid, "Lokasi Tidak Ditemukan~n~Atau GPS belum di set", 5000);
							return 1;
						}
							
						for(new i,j = cache_num_rows(); i< j; i++)
						{
							cache_get_value_name(i,"LocationName", gInfo[playerid][LocName]);
							cache_get_value_name_float(0, "PositionX", gInfo[playerid][Pos][0]);
							cache_get_value_name_float(0, "PositionY", gInfo[playerid][Pos][1]);
							cache_get_value_name_float(0, "PositionZ", gInfo[playerid][Pos][2]);
							format(String, sizeof(String), "%s%d\t%s\n", String, i, gInfo[playerid][LocName]);
						}
						format(String2, sizeof(String2), "S.No\tLocation Name\n%s", String);
							
						NTD_INFOEx(playerid, "Silahkan pilih lokasi~n~yang akan di tandai", 5000);
						ShowPlayerDialog(playerid, DIALOG_GPS_LOC, DIALOG_STYLE_TABLIST_HEADERS, "CCRP Lokasi Pekerjaan", String2, "Select", "Cancel");
						cache_delete(result);
					}
					case 3:
					{
						new Cache:result = mysql_query(gSQL,"SELECT `LocationName`, `PositionX`, `PositionY`, `PositionZ`, `InteriorID`, `VirtualwordID` FROM `gpsdb` WHERE `Category` LIKE 'Hiburan'");
						if(!cache_num_rows())
						{
							cache_delete(result);
							NTD_ERROREx(playerid, "Lokasi Tidak Ditemukan~n~Atau GPS belum di set", 5000);
							return 1;
						}
							
						for(new i,j = cache_num_rows(); i< j; i++)
						{
							cache_get_value_name(i,"LocationName", gInfo[playerid][LocName]);
							cache_get_value_name_float(0, "PositionX", gInfo[playerid][Pos][0]);
							cache_get_value_name_float(0, "PositionY", gInfo[playerid][Pos][1]);
							cache_get_value_name_float(0, "PositionZ", gInfo[playerid][Pos][2]);
							format(String, sizeof(String), "%s%d\t%s\n", String, i, gInfo[playerid][LocName]);
						}
						format(String2, sizeof(String2), "S.No\tLocation Name\n%s", String);
							
						NTD_INFOEx(playerid, "Silahkan pilih lokasi~n~yang akan di tandai", 5000);
						ShowPlayerDialog(playerid, DIALOG_GPS_LOC, DIALOG_STYLE_TABLIST_HEADERS, "CCRP Lokasi Hiburan", String2, "Select", "Cancel");
						cache_delete(result);
					}
					case 4:
					{
						new Cache:result = mysql_query(gSQL,"SELECT `LocationName`, `PositionX`, `PositionY`, `PositionZ`, `InteriorID`, `VirtualwordID` FROM `gpsdb` WHERE `Category` LIKE 'Hiburan'");
						if(!cache_num_rows())
						{
							cache_delete(result);
							NTD_ERROREx(playerid, "Lokasi Tidak Ditemukan~n~Atau GPS belum di set", 5000);
							return 1;
						}
							
						for(new i,j = cache_num_rows(); i< j; i++)
						{
							cache_get_value_name(i,"LocationName", gInfo[playerid][LocName]);
							cache_get_value_name_float(0, "PositionX", gInfo[playerid][Pos][0]);
							cache_get_value_name_float(0, "PositionY", gInfo[playerid][Pos][1]);
							cache_get_value_name_float(0, "PositionZ", gInfo[playerid][Pos][2]);
							format(String, sizeof(String), "%s%d\t%s\n", String, i, gInfo[playerid][LocName]);
						}
						format(String2, sizeof(String2), "S.No\tLocation Name\n%s", String);
							
						NTD_INFOEx(playerid, "Silahkan pilih lokasi~n~yang akan di tandai", 5000);
						ShowPlayerDialog(playerid, DIALOG_GPS_LOC, DIALOG_STYLE_TABLIST_HEADERS, "CCRP Lokasi Tempat Lainnya", String2, "Select", "Cancel");
						cache_delete(result);
					}
					case 5:
					{
						if (GPSMarker[playerid] == 0) return NTD_ERROREx(playerid, "GPS Sudah Di matikan", 5000);
						DestroyDynamicMapIcon(GPSMarker[playerid]);
						GPSMarker[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
        				gOnGPS[playerid] = false;
						NTD_SUCCESEx(playerid, "GPS Dimatikan", 5000);
					}
				}
			}
			return 1;
		}
		case DIALOG_GPS_LOC:
		{
			if(response)
			{
				if (GPSMarker[playerid] != 0) 
				{
					DestroyDynamicMapIcon(GPSMarker[playerid]);
				}
				GPSMarker[playerid] = SetPlayerCheckpoint(playerid, gInfo[listitem][Pos][0], gInfo[listitem][Pos][1], gInfo[listitem][Pos][2], 3.0);
				gOnGPS[playerid] = true;
				format(String, sizeof(String), "GPS: %s, ~n~Lokasi Ditandai Di Peta", gInfo[playerid][LocName]);
				NTD_SUCCESEx(playerid, String, 5000);
			}
			return 1;
		}
		case DIALOG_ADD_PEMERINTAH:
		{
			gInfo[playerid][Interior] = GetPlayerInterior(playerid);
			gInfo[playerid][Virtualword] = GetPlayerVirtualWorld(playerid);
			GetPlayerPos(playerid, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2]);
			mysql_format(gSQL, Query, sizeof(Query), "SELECT * FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);

			new Cache:result = mysql_query(gSQL, Query, true);
			mysql_escape_string(inputtext, gInfo[playerid][LocName]);
			if(cache_num_rows()) return NTD_ERROREx(playerid, "Lokasi ini sudah ada", 5000);
			mysql_format(gSQL, Query2, sizeof(Query2), "INSERT INTO `gpsdb` (`Category`, `LocationName`, `PositionX` , `PositionY` , `PositionZ`, `InteriorID`, `VirtualwordID`) VALUES ('Pemerintahan', '%s', '%f', '%f', '%f', '%d', '%d')",inputtext, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2], gInfo[playerid][Interior], gInfo[playerid][Virtualword]);
			mysql_query(gSQL, Query2, false);
				
			format(String, sizeof(String), "Berhasil menambahkan~n~Lokasi: %s~n~gunakan /gps untuk melihat", inputtext);
			NTD_SUCCESEx(playerid, String, 5000);
			cache_delete(result);
		}
		case DIALOG_ADD_UMUM:
		{
			gInfo[playerid][Interior] = GetPlayerInterior(playerid);
			gInfo[playerid][Virtualword] = GetPlayerVirtualWorld(playerid);
			GetPlayerPos(playerid, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2]);
			mysql_format(gSQL, Query, sizeof(Query), "SELECT * FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);

			new Cache:result = mysql_query(gSQL, Query, true);
			mysql_escape_string(inputtext, gInfo[playerid][LocName]);
			if(cache_num_rows()) return NTD_ERROREx(playerid, "Lokasi ini sudah ada", 5000);
			mysql_format(gSQL, Query2, sizeof(Query2), "INSERT INTO `gpsdb` (`Category`, `LocationName`, `PositionX` , `PositionY` , `PositionZ`, `InteriorID`, `VirtualwordID`) VALUES ('Tempat Umum', '%s', '%f', '%f', '%f', '%d', '%d')",inputtext, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2], gInfo[playerid][Interior], gInfo[playerid][Virtualword]);
			mysql_query(gSQL, Query2, false);
				
			format(String, sizeof(String), "Berhasil menambahkan~n~Lokasi: %s~n~gunakan /gps untuk melihat", inputtext);
			NTD_SUCCESEx(playerid, String, 5000);
			cache_delete(result);
		}
		case DIALOG_ADD_PEKERJAAN:
		{
			gInfo[playerid][Interior] = GetPlayerInterior(playerid);
			gInfo[playerid][Virtualword] = GetPlayerVirtualWorld(playerid);
			GetPlayerPos(playerid, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2]);
			mysql_format(gSQL, Query, sizeof(Query), "SELECT * FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);

			new Cache:result = mysql_query(gSQL, Query, true);
			mysql_escape_string(inputtext, gInfo[playerid][LocName]);
			if(cache_num_rows()) return NTD_ERROREx(playerid, "Lokasi ini sudah ada", 5000);
			mysql_format(gSQL, Query2, sizeof(Query2), "INSERT INTO `gpsdb` (`Category`, `LocationName`, `PositionX` , `PositionY` , `PositionZ`, `InteriorID`, `VirtualwordID`) VALUES ('Pekerjaan', '%s', '%f', '%f', '%f', '%d', '%d')",inputtext, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2], gInfo[playerid][Interior], gInfo[playerid][Virtualword]);
			mysql_query(gSQL, Query2, false);
				
			format(String, sizeof(String), "Berhasil menambahkan~n~Lokasi: %s~n~gunakan /gps untuk melihat", inputtext);
			NTD_SUCCESEx(playerid, String, 5000);
			cache_delete(result);
		}
		case DIALOG_ADD_HIBURAN:
		{
			gInfo[playerid][Interior] = GetPlayerInterior(playerid);
			gInfo[playerid][Virtualword] = GetPlayerVirtualWorld(playerid);
			GetPlayerPos(playerid, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2]);
			mysql_format(gSQL, Query, sizeof(Query), "SELECT * FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);

			new Cache:result = mysql_query(gSQL, Query, true);
			mysql_escape_string(inputtext, gInfo[playerid][LocName]);
			if(cache_num_rows()) return NTD_ERROREx(playerid, "Lokasi ini sudah ada", 5000);
			mysql_format(gSQL, Query2, sizeof(Query2), "INSERT INTO `gpsdb` (`Category`, `LocationName`, `PositionX` , `PositionY` , `PositionZ`, `InteriorID`, `VirtualwordID`) VALUES ('Hiburan', '%s', '%f', '%f', '%f', '%d', '%d')",inputtext, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2], gInfo[playerid][Interior], gInfo[playerid][Virtualword]);
			mysql_query(gSQL, Query2, false);
				
			format(String, sizeof(String), "Berhasil menambahkan~n~Lokasi: %s~n~gunakan /gps untuk melihat", inputtext);
			NTD_SUCCESEx(playerid, String, 5000);
			cache_delete(result);
		}
		case DIALOG_ADD_LAINNYA:
		{
			gInfo[playerid][Interior] = GetPlayerInterior(playerid);
			gInfo[playerid][Virtualword] = GetPlayerVirtualWorld(playerid);
			GetPlayerPos(playerid, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2]);
			mysql_format(gSQL, Query, sizeof(Query), "SELECT * FROM `gpsdb` WHERE `LocationName` = '%e'", inputtext);

			new Cache:result = mysql_query(gSQL, Query, true);
			mysql_escape_string(inputtext, gInfo[playerid][LocName]);
			if(cache_num_rows()) return NTD_ERROREx(playerid, "Lokasi ini sudah ada", 5000);
			mysql_format(gSQL, Query2, sizeof(Query2), "INSERT INTO `gpsdb` (`Category`, `LocationName`, `PositionX` , `PositionY` , `PositionZ`, `InteriorID`, `VirtualwordID`) VALUES ('Tempat Lainnya', '%s', '%f', '%f', '%f', '%d', '%d')",inputtext, gInfo[playerid][Pos][0], gInfo[playerid][Pos][1], gInfo[playerid][Pos][2], gInfo[playerid][Interior], gInfo[playerid][Virtualword]);
			mysql_query(gSQL, Query2, false);
				
			format(String, sizeof(String), "Berhasil menambahkan~n~Lokasi: %s~n~gunakan /gps untuk melihat", inputtext);
			NTD_SUCCESEx(playerid, String, 5000);
			cache_delete(result);
		}

		default: return 0; // dialog ID was not found, search in other scripts
	}
	return 1;
}