extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -100.0
@export var sprite:Sprite2D
@export var jump_timer:Timer
@export var floor:Area2D
@export var feet:Area2D
@export var eyes:Array[RayCast2D]
@onready var day_timer = $"../../Scene Time"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var held:Array[Node2D]


func _ready():
	Eye_Time()

func _physics_process(delta):
	# Add the gravity.
	Caclulate_Velocity()
	velocity.y += Handle_Jump(delta)
	
	move_and_slide()

func _process(_delta):
	Sun_Thing(Detect_Sky())
	Eye_Time()

func Detect_Sky():
	for eye in eyes:
		if(eye.get_collider() == null):
			return true
	return false

func Sun_Thing(detected:bool):
	if(detected):
		$"sun sign".visible = true
	else:
		$"sun sign".visible = false
	
func Eye_Time():
	var angle = (day_timer.progress-0.5)*PI
	for eye in eyes:
		eye.rotation = angle

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
