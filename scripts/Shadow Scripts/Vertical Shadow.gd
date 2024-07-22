extends Area2D

@onready var day_timer = $"../../Scene Time" #replace with actual timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Collider.polygon = $"..".polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"..".skew = PI*day_timer.progress
	$"..".rotation = $"..".skew - (PI/2)
	pass
