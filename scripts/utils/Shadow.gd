extends Area2D

@export var height:float
var base_data:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_collision_layer_value(9,$"../..".under)
	pass
