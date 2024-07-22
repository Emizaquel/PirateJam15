extends Area2D

@onready var day_timer = $"../../../Scene Time" #replace with actual timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Collider.polygon = $"..".polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress = (1.0 + day_timer.progress)*PI
	$"..".rotation = progress
	$"..".skew = 0-progress
	pass
