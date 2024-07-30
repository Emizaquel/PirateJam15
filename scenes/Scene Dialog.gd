extends Timer

@export var dialog:Array[String]
#"",
#"",
#""
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.is_night = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	if(dialog.size() < 1):
		stop()
		return
	$"../UI".text_box(dialog.pop_front())
	pass # Replace with function body.
