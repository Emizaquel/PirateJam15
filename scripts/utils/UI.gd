extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Margins/Health/Clip/Health Bar".size.x = 50.0*Globals.health
	pass

func _input(event):
	if(event.is_action_pressed("inventory")):
		$Inventory.visible = !$Inventory.visible
		get_tree().paused = !$Inventory.visible
		if($Inventory.visible):
			$Inventory/ColorRect/MarginContainer2/HBoxContainer/ScrollContainer/MarginContainer/GridContainer/Button.grab_focus()
