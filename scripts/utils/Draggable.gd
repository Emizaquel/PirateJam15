extends CharacterBody2D

var holder:CharacterBody2D = null
var mobile: bool = true
@onready var player = Globals.player #uniqe name doesn't seem to work for me, maybe you can fix it later Daniel
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (body == player):
		$Label.visible = true
		holder = player
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if (body == player):
		$Label.visible = false
		holder = null
	pass # Replace with function body.

func _input(event):
	if(holder != null):
		if event.is_action_pressed("interact"):
			$"State Machine".interact()
	if event.is_action_released("interact"):
		pass
