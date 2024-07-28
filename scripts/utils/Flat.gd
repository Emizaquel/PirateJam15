extends Node2D

@export var height:float
@export var width:float
@export var depth:float
@export var z_pos:float = 0.0
var under:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Bottom Shadow".position = Vector2(0, depth)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	under = Globals.player_bodiez < height
	pass
