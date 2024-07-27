extends Node2D

@export var height:float
@export var width:float
@export var depth:float
var under:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Side Shadow".position = Vector2(-width/2, depth/2)
	$"Side Shadow2".position = Vector2(width/2, depth/2)
	$Platform.position = Vector2(0, depth/2)
	$footprint.position = Vector2(0, depth/2)
	var new_shape = RectangleShape2D.new()
	new_shape.size.x = width
	new_shape.size.y = depth
	$footprint/Shape.set_shape(new_shape)
	$footprint/Shape.queue_redraw()
	$footprint.queue_redraw()
	$Platform/Shape.set_shape(new_shape)
	$Platform/Shape.queue_redraw()
	$Platform.queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
