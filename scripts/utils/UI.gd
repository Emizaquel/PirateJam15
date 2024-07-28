extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var show_screen:bool = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(show_screen):
		if($"Fade IO".color.a > 0.0):
			$"Fade IO".color.a -= 0.5*delta
	else :
		if($"Fade IO".color.a < 1.0):
			$"Fade IO".color.a += 0.5*delta
	if(Globals.health < 0):
		$"Death Screen".visible = true
		if($"Death Screen".color.a < 0.8):
			$"Death Screen".color.a += delta*5
		else:
			$"Death Screen".color.a = 0.8
			$"Death Screen/CenterContainer/Label".visible = true
		if($"Death Screen/Respawn Timer".is_stopped()):
			get_tree().paused = true
			$"Death Screen/Respawn Timer".start()
	$"Margins/Health/Clip/Health Bar".size.x = 50.0*Globals.health
	pass

func _input(event):
	if(event.is_action_pressed("inventory")):
		$Inventory.visible = !$Inventory.visible
		get_tree().paused = $Inventory.visible
		if($Inventory.visible):
			$Inventory/ColorRect/MarginContainer2/HBoxContainer/ScrollContainer/MarginContainer/GridContainer/Button.grab_focus()


func _on_respawn_timer_timeout():
	Globals.health = 1.0
	get_tree().paused = false
	get_tree().reload_current_scene()
