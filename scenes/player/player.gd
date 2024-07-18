class_name Player
extends CharacterBody2D

@export var previous_direction: float = 1

# Get Nodes
@onready var state_machine: StateMachine = %StateMachine
@onready var sprite: Sprite2D = %Sprite
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var hurtbox: Area2D = %Hurtbox
@onready var hitbox = %Hitbox # needed?
@onready var jump_buffer: Timer = %JumpBuffer

var move_input: float = 0

# Movement 
var move_speed = 180
var jump_count: int = 0
var max_jumps: int = 1

var can_dash: bool = true

var gravity: float = 980
var max_gravity: float = 240

func _ready():
	state_machine.initialize()
	state_machine.connect("state_changed", _on_state_changed)

func _process(_delta):
	print(state_machine.current_state.name)
	state_machine.process_frame(_delta)

func _physics_process(_delta):
	move_input = Input.get_axis("move_left", "move_right")
	if (Input.is_action_just_pressed("jump")):
		jump_buffer.start();
	state_machine.process_physics(_delta)

func apply_gravity(delta: float):
	if !is_on_floor():
		if velocity.y <= max_gravity:
			velocity += Vector2(0, gravity * delta)

func move():
	if move_input != 0:
		previous_direction = move_input
		
	velocity.x = move_speed * move_input
	move_and_slide();

func _on_state_changed(new_state: String):
	print("State changed: " + new_state)
