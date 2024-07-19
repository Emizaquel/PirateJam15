extends PlayerState

func enter():
	if player.is_on_floor():
		player.jump_count = 0
		player.can_dash = true

func process_physics(delta: float):
	player.apply_gravity(delta)
	player.move()
	
	if player.velocity.y > 0:
		player.state_machine.change_state("fall")
	
	if Input.is_action_just_pressed("jump") or player.jump_buffer.time_left > 0:
		player.state_machine.change_state("jump")
	
	if player.move_input != 0:
		player.state_machine.change_state("walk")
	
	if Input.is_action_just_pressed("dash") and player.can_dash:
		player.state_machine.change_state("dash")
