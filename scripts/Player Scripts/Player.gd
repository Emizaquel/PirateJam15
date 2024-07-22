extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -100.0
@export var sprite:Sprite2D
@export var jump_timer:Timer
@export var floor:Area2D
@export var feet:Area2D
@export var horizontal_eyes:Array[RayCast2D]
@export var vertical_eyes:Array[RayCast2D]

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	Caclulate_Velocity()
	velocity.y += Handle_Jump(delta)
	
	move_and_slide()

func _process(_delta):
	Detect_Sky()

func Detect_Sky():
	for eye in horizontal_eyes:
		if(eye.get_collider() != null):
			$"sun sign".visible = false
			return
	for eye in vertical_eyes:
		if(eye.get_collider() != null):
			$"sun sign".visible = false
			return
	$"sun sign".visible = true

func Caclulate_Velocity():
	var direction = Vector2(Input.get_axis("move_left","move_right"), Input.get_axis("move_up","move_down"))
	if(direction):
		if(direction.x < 0):
			sprite.scale.x = -1.0
		else:
			sprite.scale.x = 1.0
		direction = direction.normalized()*SPEED
		direction.y *= 0.3
		velocity = velocity.lerp(direction, 0.2)
	else:
		velocity = velocity.lerp(Vector2.ZERO, 0.2)

var airspeed:float
var on_ground:bool
func Handle_Jump(delta):
	if(Input.is_action_just_pressed("jump") && feet.has_overlapping_areas() && jump_timer.is_stopped()):
		set_collision_mask_value(2,false)
		jump_timer.start()
		airspeed = JUMP_VELOCITY
		return airspeed
	if(jump_timer.time_left):
		airspeed += gravity*delta
		return airspeed
	if(feet.has_overlapping_areas()):
		airspeed = 0.0
		return 0.0
	airspeed += gravity*delta
	return airspeed

func _input(event):
	if(event.is_action("drop")):
		Handle_Drop(event)

func Handle_Drop(event:InputEvent):
	if(event.is_pressed()):
		set_collision_mask_value(3,false)
		velocity.y = 300.0
	if(event.is_released()):
		set_collision_mask_value(3,true)

func _on_jump_timeout():
	set_collision_mask_value(2,true)
	pass # Replace with function body.
