extends CharacterBody2D


const SPEED = 200.0
@onready var sprite:Sprite2D = $body/Sprite
@onready var state_machine = $"State Machine"
@onready var feet:Area2D = $feet
@onready var eyes:Array[RayCast2D] = [$Eyes/RayCast2D, $Eyes/RayCast2D2, $Eyes/RayCast2D3, $Eyes/RayCast2D4, $Eyes/RayCast2D5, $Eyes/RayCast2D6, $Eyes/RayCast2D7, $Eyes/RayCast2D8, $Eyes/RayCast2D9, $Eyes/RayCast2D10]
var floors:StaticBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var held:Array[Node2D]

func _ready():
	Eye_Time()

func _physics_process(delta):
	Caclulate_Velocity()
	move_and_slide()

func _process(_delta):
	#Sun_Thing(Detect_Sky())
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
	var angle = (Globals.daytime-0.5)*PI
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

var front
var walls

func recieve_floors(new_floors:StaticBody2D):
	floors = new_floors
	floors.reparent($".")
	await get_tree().process_frame
	floors.position = Vector2.ZERO
	pass

func return_floors(building:Node2D):
	floors.reparent(building)
