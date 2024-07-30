extends Area2D

@export var new_scene:String
@export var label_text:String

# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/Label.text = label_text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("interact") and $CenterContainer/Label.visible:
		if($Timer.is_stopped()):
			$"../../UI".show_screen = false
			$Timer.start()

func _on_timer_timeout():
	Globals.saved_data["last_scene"] = new_scene
	get_tree().change_scene_to_file(new_scene)
	$"../../UI".show_screen = true
	Globals.save()
	pass # Replace with function body.


func _on_body_entered(body):
	$CenterContainer/Label.visible = true


func _on_body_exited(body):
	$CenterContainer/Label.visible = false
