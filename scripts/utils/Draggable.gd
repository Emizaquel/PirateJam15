extends CharacterBody2D

var holder:CharacterBody2D = null
@onready var player = $"../Player" #uniqe name doesn't seem to work for me, maybe you can fix it later Daniel
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var airspeed:float = 0.0
func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO, 200.0)
	if($Area2D.has_overlapping_areas()):
		airspeed = 0
	else:
		airspeed += gravity
	velocity.y = airspeed
	if(holder != null && Input.is_action_pressed("interact")):
		velocity = holder.velocity
	move_and_slide()


func _on_area_2d_body_entered(body):
	if (body == player):
		$Label.visible = true
		holder = player
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if (body == player):
		$Label.visible = false
		holder = null
	pass # Replace with function body.
