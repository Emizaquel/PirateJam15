extends Node

var daytimer:Timer
var daytime:float

# Called when the node enters the scene tree for the first time.
func _ready():
	daytimer = Timer.new()
	daytimer.name = "daytimer"
	daytimer.set_wait_time(600.0)
	add_child(daytimer)
	await get_tree().process_frame
	daytimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	daytime = daytimer.time_left/daytimer.wait_time
	pass
