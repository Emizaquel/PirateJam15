extends CharacterBody2D


const SPEED = 100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up","move_down"))
	if direction:
		velocity = velocity.lerp(direction.normalized()*SPEED, 0.2)
		Face_Heading(velocity)
	else:
		velocity = velocity.lerp(Vector2.ZERO, 0.2)
	
	move_and_slide()

func Face_Heading(velocity):
	var heading = velocity.angle()
	if(abs(heading) < (PI*0.25) ):
		$Sprite.region_rect = Rect2(0,32,32,32)
		return
	if(abs(heading) > (PI*0.75) ):
		$Sprite.region_rect = Rect2(0,96,32,32)
		return
	if(heading > 0):
		$Sprite.region_rect = Rect2(0,0,32,32)
		return
	$Sprite.region_rect = Rect2(0,64,32,32)
