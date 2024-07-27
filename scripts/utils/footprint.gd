extends StaticBody2D
@onready var clearance = $"..".height

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Globals.player_bodiez > clearance):
		set_collision_layer_value(4,false)
		$"..".under = false
	else:
		set_collision_layer_value(4,true)
		$"..".under = true
	pass
