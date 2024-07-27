extends Area2D

@onready var floors = $Floors

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body:Node2D):
	if(body.has_method("recieve_floors")):
		floors.set_collision_layer_value(3,true)
		floors.reparent(body)
		await get_tree().process_frame
		floors.position = Vector2.ZERO


func _on_body_exited(body):
	if(body.has_method("recieve_floors")):
		floors.reparent($'.')
		await get_tree().process_frame
		floors.set_collision_layer_value(3,false)
