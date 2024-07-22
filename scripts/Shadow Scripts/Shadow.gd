extends Area2D

@export var day_timer:Timer #route to global timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress = (1 + day_timer.progress)*PI
	$"Left Shadow".rotation = progress
	$"Left Shadow".skew = 0-progress
	$"Right Shadow".rotation = $"Left Shadow".rotation
	$"Right Shadow".skew = $"Left Shadow".skew
	$"Vertical Shadow".skew = (day_timer.progress - 0.5)*PI
	pass
