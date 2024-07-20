extends Area2D

@onready var collider = $collider
@onready var polygon = $visual
@export var daylight:Timer # update this to the actual timer object
@export var verticies:Array[Vector2] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	collider.polygon = verticies
	polygon.polygon = verticies


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress = (1 + (daylight.time_left/daylight.wait_time))*PI
	rotation = progress
	skew = 0-progress
	pass
