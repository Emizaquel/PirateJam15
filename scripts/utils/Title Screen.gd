extends Node2D

var last_scene = "res://scenes/Tutorial.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	var saved_scene = Globals.saved_data.get("last_scene")
	if(saved_scene != null):
		last_scene = saved_scene
	$"CanvasLayer/ColorRect/CenterContainer/VBoxContainer/HBoxContainer/Game Start".grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_start_pressed():
	get_tree().change_scene_to_file("res://scenes/Tutorial.tscn")
	get_tree().change_scene_to_file(last_scene)
	pass # Replace with function body.
