extends CenterContainer

@export var action_label:String
@export var action:String
var listening = false
var current_key

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Label.text = action_label
	for ev in InputMap.action_get_events(action):
		if ev is InputEventKey:
			current_key = ev
			$HBoxContainer/Button.text = ev.as_text_physical_keycode()
			return
	print("action not found")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if(listening && event is InputEventKey):
		var actions = []
		for action in InputMap.get_actions():
			if(action in ["ui_accept", "ui_select", "ui_focus_next", "ui_text_completion_replace", "ui_text_indent"]):
				continue
			if(event.is_action(action)):
				$"../../../ColorRect2/Timer".start()
				listening = false
				print(action)
				return
			if(current_key.is_action(action)):
				actions.append(action)
		print(current_key)
		print(InputMap.action_get_events(action))
		print(actions)
		for action in actions:
			InputMap.action_erase_event(action, current_key)
			InputMap.action_add_event(action, event)
		current_key = event
		$HBoxContainer/Button.text = event.as_text()
		listening = false

func _on_button_pressed():
	listening = true
	pass # Replace with function body.
