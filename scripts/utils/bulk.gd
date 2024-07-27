extends StaticBody2D

@export var building_height:float

# Called when the node enters the scene tree for the first time.
func _ready():
	building_height = 0-building_height
	pass # Replace with function body.

var player: CharacterBody2D = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player != null):
		if(player.call("Get_Player_Z") < building_height):
			set_collision_layer_value(4, false)
		else:
			set_collision_layer_value(4, true)
	pass

func _on_body_entered(body):
	if(body.has_method("Get_Player_Z")):
		player = body


func _on_body_exited(body):
	if(body.has_method("Get_Player_Z")):
		player = null
		set_collision_layer_value(4, true)
