extends Node

var daytimer:Timer
var daytime:float

var money:float = 10.0
var health:float = 1.0
var pos_set:bool = false
var player_pos:Vector2 = Vector2.ZERO
var player_bodiez:float = 0.0
var player:CharacterBody2D
var saved_data:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	SaveFile.load()
	daytimer = Timer.new()
	daytimer.name = "daytimer"
	daytimer.set_wait_time(60.0)
	add_child(daytimer)
	await get_tree().process_frame
	daytimer.start()
	pass # Replace with function body.

func load_player(p:CharacterBody2D):
	player = p

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	daytime = (daytimer.time_left/daytimer.wait_time)*0.6+0.2
	if(health < 1.0):
		health += 0.1*delta
		if(health > 1.0):
			health = 1.0
	pass

func save():
	print("save!")
	SaveFile.new().save()
