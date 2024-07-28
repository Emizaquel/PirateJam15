class_name SaveFile
extends Resource
const save_path := "user://save.tres"

@export var money:float
@export var saved_data:Dictionary

func save():
	money = Globals.money
	saved_data = Globals.saved_data
	ResourceSaver.save(self, save_path)

static func load():
	if ResourceLoader.exists(save_path):
		var try_load = load(save_path)
		Globals.pos_set = true
		Globals.money = try_load.money
		Globals.saved_data = try_load.saved_data
	return false
