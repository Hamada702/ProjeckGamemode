stock update_player_int(playerid, column[], value)
{
	new query[256];
	mysql_format(gSQL, query, sizeof query, "UPDATE players SET %s = '%d' WHERE id = '%d' LIMIT 1", column, value, Player[playerid][ID]);
	mysql_query(gSQL, query);
	return true;
}
stock update_player_float(playerid, column[], value)
{
	new query[256];
	mysql_format(gSQL, query, sizeof query, "UPDATE players SET %s = '%0.f' WHERE id = '%d' LIMIT 1", column, value, Player[playerid][ID]);
	mysql_query(gSQL, query);
	return true;
}
stock update_player_value(playerid, column[], value)
{
	new query[256];
	mysql_format(gSQL, query, sizeof query, "UPDATE players SET %s = '%s' WHERE id = '%d' LIMIT 1", column, value, Player[playerid][ID]);
	mysql_query(gSQL, query);
	return true;
}