extends CharacterBody2D


const SPEED = 100.0
@onready var sprite:AnimatedSprite2D = $body/Sprite
@onready var state_machine = $"State Machine"
@onready var feet:Area2D = $feet
var floors:StaticBody2D
var moving = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var held:Array[Node2D]

func _ready():
	Globals.load_player($".")

var seen_sky = false
@onready var last_shadow:Node2D = $"."
func _physics_process(delta):
	if(Detect_Sky()):
		velocity *=-5
		position += (last_shadow.global_position - global_position).normalized()*5
		move_and_slide()
		Globals.health -= 0.2
		return
	Caclulate_Velocity()
	move_and_slide()
	if(moving && !$"Steps Dirt".playing):
		$"Steps Dirt".play()

func Detect_Sky():
	var shadows:Array = $"True Shadow".get_overlapping_areas()
	if(shadows.size() > 0):
		last_shadow = shadows[0]
		return false
	return true

func Caclulate_Velocity():
	var direction = Vector2(Input.get_axis("move_left","move_right"), Input.get_axis("move_up","move_down"))
	if(direction):
		if(direction.x < 0):
			sprite.scale.x = -1.0
		else:
			sprite.scale.x = 1.0
		if($body.is_on_floor()):
			if(sprite.animation == "Stand"):
				sprite.play("Run Start")
			else:
				if(sprite.animation_finished):
					sprite.play("Run")
					moving = true
		direction = direction.normalized()*SPEED
		direction.y *= 0.5
		velocity = velocity.lerp(direction, 0.2)
	else:
		if($body.is_on_floor()):
			if(sprite.animation == "Run"):
				sprite.play_backwards("Run Start")
			else:
				if(sprite.animation_finished):
					moving = false
					sprite.play("Stand")
		velocity = velocity.lerp(Vector2.ZERO, 0.2)

var front
var walls

func recieve_floors(new_floors:StaticBody2D):
	pass

func return_floors(building:Node2D):
	floors.reparent(building)
	floors.position = Vector2.ZERO

func Get_Player_Z():
	return $body.position.y
