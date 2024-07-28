extends Node2D

var grabbable:bool = false
var grabbed:bool = false
var offset:Vector2
@onready var footprint = $"../footprint/Shape"
@onready var base_height = $"..".height
@onready var player_body = Globals.player.find_child("body")
@onready var save_id = $"..".save_id

func _ready():
	$Detector.position = Vector2(0, $"..".depth/2)
	var new_shape = RectangleShape2D.new()
	new_shape.size.x = $"..".width+2
	new_shape.size.y = $"..".depth+2
	$Detector/Shape.set_shape(new_shape)
	
func _on_detector_body_entered(body):
	if(player_body == body):
		grabbable = true
	pass # Replace with function body.


func _on_detector_body_exited(body):
	if(player_body == body):
		grabbable = false
	pass # Replace with function body.

func _physics_process(delta):
	if(grabbed):
		if(Globals.player.moving):
			if not ($"Drag Loop".playing or $"Drag Start".playing):
				$"Drag Start".play()
		if(player_body.is_on_floor()):
			if not Input.is_action_pressed("interact"):
				footprint.reparent($"../footprint")
				$"../Platform/Shape".disabled = false
				grabbed = false
				Globals.saved_data[save_id] = {"position":$"..".global_position}
		$"..".global_position = Globals.player.global_position - offset
		position.y = -Globals.player_bodiez
		$"..".z_pos = Globals.player_bodiez
		$"../Left Shadow"._ready()
		$"../Right Shadow"._ready()
		$"../Top Shadow"._ready()
		$"../Bottom Shadow"._ready()
		$"../Platform"._ready()
	if not Globals.player.moving:
		if($"Drag Loop".playing):
			$"Drag Loop".stop()
			$"Drag End".play()

func _input(event):
	if(event.is_action_pressed("interact") && grabbable):
		$"../Platform/Shape".disabled = true
		offset = Globals.player.global_position - $"..".global_position
		footprint.reparent(Globals.player)
		grabbed = true


func _on_drag_start_finished():
	$"Drag Loop".play()
	pass # Replace with function body.
