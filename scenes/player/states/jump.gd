extends PlayerState

@export var jump_speed: float = 300

func enter():
	if player.jump_count >= player.max_jumps:
		player.state_machine.change_state("fall")
	else:
		player.jump_count += 1
		player.velocity.y = -jump_speed

func process_physics(delta: float):
	player.apply_gravity(delta)
	player.move()

	if player.velocity.y > 0:
		player.state_machine.change_state("fall")
	
	if Input.is_action_just_pressed("dash") and player.can_dash:
		player.state_machine.change_state("dash")

	if !player.is_on_floor():
		player.state_machine.change_state("idle")
