class_name SaveFile
extends Resource
const save_path := "user://save.tres"

@export var money:float
@export var saved_data:Dictionary
@export var actions:Dictionary

func save():
	money = Globals.money
	saved_data = Globals.saved_data
	actions = {}
	for action in InputMap.get_actions():
		actions[action] = InputMap.action_get_events(action)
	ResourceSaver.save(self, save_path)

static func load():
	if ResourceLoader.exists(save_path):
		var try_load = load(save_path)
		Globals.pos_set = true
		Globals.money = try_load.money
		Globals.saved_data = try_load.saved_data
		for action in try_load.actions.keys():
			if(action in ["ui_accept", "ui_select", "ui_focus_next", "ui_text_completion_replace", "ui_text_indent"]):
				continue
			InputMap.action_erase_events(action)
			for event in try_load.actions[action]:
				InputMap.action_add_event(action, event)
	var space = InputEventKey.new()
	space.keycode = KEY_SPACE
	space.pressed = true
	if not InputMap.event_is_action(space,"interact"):
		InputMap.action_add_event("interact", space)
	return false
