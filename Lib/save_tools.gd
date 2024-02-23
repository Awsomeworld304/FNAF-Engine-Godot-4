extends Node

# STF - (Save To Function) 'Custom' (binary) save format, akin to JSON.
# 2024 - All rights reserved.

signal saving
signal saved
signal loading_save

var saveFile;
var modSaveFile;

# Version of the saves to prevent errored loads.
var saveVersion = 0.2;
var modSaveVersion = 0.1;

var save_vars = {
	"stf" : saveVersion,
	"curNight" : GameManager.curNight
}

var mod_save_vars = {
	"m-stf" : modSaveVersion,
	"mod_curNight" : GameManager.mod_curNight
}

func load_save():
	if not FileAccess.file_exists("user://main.stf"):
		return # Save doesn't exist.

	var save_game = FileAccess.open("user://main.stf", FileAccess.READ)
	var fileVer = save_game.get_var();
	
	if fileVer != saveVersion:
		print("INVALID FILE")
		return
		
	GameManager.curNight = save_game.get_var();
	pass

func save_game():
	# Setup main save.
	var save_game = FileAccess.open("user://main.stf", FileAccess.WRITE);
	
	# First is ALWAYS Save version.
	save_game.store_var(save_vars.get("stf"));
	save_game.store_var(save_vars.get("curNight"));

func load_save_custon(path):
	if not FileAccess.file_exists(path):
		return # Save doesn't exist.

	var save_game = FileAccess.open(path, FileAccess.READ)
	var fileVer = save_game.get_var();
	
	if fileVer != saveVersion:
		print("INVALID FILE")
		return
		
	GameManager.curNight = save_game.get_var();
	pass

# When using path, treat it like an auto ./ to the user folder.
func save_to_custom(fileName, path):
	# Setup save.
	var save_game : FileAccess;
	if path != null: save_game = FileAccess.open("user://" + path + fileName + ".stf", FileAccess.WRITE);
	else: save_game = FileAccess.open("user://" + fileName + ".stf", FileAccess.WRITE);
	save_game.store_var(save_vars.get("stf"));
	save_game.store_var(save_vars.get("curNight"));
	pass
