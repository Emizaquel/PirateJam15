extends PlayerState

@onready var dash_timer: Timer = %DashTimer

@export var dash_speed: float = 300

var dash_direction: Vector2 = Vector2.ZERO
var is_dashing: bool = false

func enter():
	is_dashing = true

	dash_timer.connect("timeout", _on_dash_timer_timeout)
	dash_timer.start()

	player.can_dash = false

	# messed up earlier and made movement input an int, so that it only tracks left and right
	# will change to a Vector2 later so that we can have dash in orthogonal directions
	# too tired now

	if player.move_input != 0:
		dash_direction = Vector2(player.move_input, 0)
	else:
		dash_direction = Vector2(player.previous_direction, 0)
	
	player.velocity = dash_direction.normalized() * dash_speed

func process_physics(_delta: float):
	player.move_and_slide()

	if is_dashing:
		if player.get_slide_collision_count() != 0: # fix this later, stops from dashing on ground at the moment
			is_dashing = false
	else:
		player.state_machine.change_state("fall")

func exit():
	is_dashing = false

	dash_timer.disconnect("timeout", _on_dash_timer_timeout)

func _on_dash_timer_timeout():
	is_dashing = false
