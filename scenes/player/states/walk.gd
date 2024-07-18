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
	
	if player.velocity == Vector2.ZERO and player.is_on_floor():
		player.state_machine.change_state("idle")

	if Input.is_action_just_pressed("jump"):
		player.state_machine.change_state("jump")
	
	if Input.is_action_just_pressed("dash") and player.can_dash:
		player.state_machine.change_state("dash")
