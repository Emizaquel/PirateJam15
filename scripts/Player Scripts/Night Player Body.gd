extends CharacterBody2D

const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var on_floor:bool
var airtime:float = 0.0

func _process(delta):
	if(position.y > 2):
		position.y = 0
	Globals.player_bodiez = 0-position.y

func _input(event):
	if(event.is_action("drop")):
		Handle_Drop(event)

func Handle_Drop(event:InputEvent):
	if(event.is_pressed()):
		set_collision_mask_value(3,false)
		velocity.y = 10.0
	if(event.is_released()):
		set_collision_mask_value(3,true)

func _physics_process(delta):
	if($Shadowcaster.is_colliding()):
		$Shadow.global_position = $Shadowcaster.get_collision_point()
	else:
		$Shadow.global_position = $"..".global_position
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if(position.y < -2):
		if(velocity.y > 0):
			if($Sprite.animation == "Up"):
				print(position.y)
				$Sprite.play("Peak")
			else:
				$Sprite.play("Down")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sprite.play("Up")
		$"..".moving = false
	move_and_slide()
