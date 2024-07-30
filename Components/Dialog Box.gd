extends Label

var to_say:String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact"):
		if(to_say.length() > 0):
			text += to_say
			to_say = ""
			visible = true
			get_tree().paused = true
		else:
			text = ""
			visible = false
			get_tree().paused = false
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
		if(to_say.length() > 0):
			text += to_say[0]
			to_say = to_say.right(to_say.length() - 1)
			visible = true
			get_tree().paused = true
