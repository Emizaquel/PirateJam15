extends Node2D

@export var height:float
@export var width:float
@export var depth:float
@export var z_pos:float = 0.0
var under:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Left Shadow".position = Vector2(-width/2, depth/2)
	$"Right Shadow".position = Vector2(width/2, depth/2)
	$"Top Shadow".position = Vector2(0, 0)
	$"Bottom Shadow".position = Vector2(0, depth)
	$Platform.position = Vector2(0, depth/2)
	$footprint.position = Vector2(0, depth/2)
	var new_shape = RectangleShape2D.new()
	new_shape.size.x = width
	new_shape.size.y = depth
	$footprint/Shape.set_shape(new_shape)
	$Platform/Shape.set_shape(new_shape)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
