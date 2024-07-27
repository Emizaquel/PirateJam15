class_name SaveFile
extends Resource
const save_path := "user://save.tres"

@export var money:float
@export var player_pos:Vector2
@export var looted:Array

func save():
	money = Globals.money
	player_pos = Globals.player.global_position
	looted = Globals.looted
	ResourceSaver.save(self, save_path)

static func load():
	if ResourceLoader.exists(save_path):
		var try_load = load(save_path)
		Globals.player_pos = try_load.player_pos
		Globals.pos_set = true
		Globals.money = try_load.money
		Globals.looted = try_load.looted
	return false
