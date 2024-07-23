extends Area2D

@onready var collider = $"collider shape"
@onready var polygon = $".."
@onready var daylight:Timer = polygon.daylight # update this to the actual timer object

# Called when the node enters the scene tree for the first time.
func _ready():
	collider.polygon = polygon.polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress = (1 + (daylight.time_left/daylight.wait_time))*PI
	polygon.rotation = progress
	polygon.skew = 0-progress
	pass
