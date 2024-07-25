extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body:Node2D):
	if(body.has_method("recieve_floors")):
		$"../Floors".set_collision_layer_value(3,true)
		body.call("recieve_floors",$"../Floors")


func _on_body_exited(body):
	if(body.has_method("return_floors")):
		body.call("return_floors",$"..")
	await get_tree().process_frame
	$"../Floors".set_collision_layer_value(3,false)
	$"../Floors".position = Vector2.ZERO
