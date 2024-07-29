extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Button.grab_focus()
	pass # Replace with function body.

func set_movement_controls():
	$CanvasLayer/Cross.text = "ASIGN MOVEMENT"
	$"CanvasLayer/Left Stick".text = "ASIGN MOVEMENT"
	$"CanvasLayer/Right Stick".text = "ASIGN MOVEMENT"
	for ev in InputMap.action_get_events("move_up"):
		if(ev is InputEventJoypadMotion):
			match ev.axis:
				1:
					$"CanvasLayer/Left Stick".text = "MOVMENT"
					return
				3:
					$"CanvasLayer/Right Stick".text = "MOVMENT"
					return
	$CanvasLayer/Cross.text = "MOVEMENT"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Title Screen.tscn")
	pass # Replace with function body.
