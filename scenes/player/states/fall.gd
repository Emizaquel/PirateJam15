extends PlayerState

@onready var coyote_timer: Timer = %CoyoteTimer

func enter():
	coyote_timer.connect("timeout", _on_coyote_timer_timeout)
	if player.state_machine.previous_state.name.to_lower() != "jump": # fix this later
		coyote_timer.start()

func process_physics(delta: float):
	player.apply_gravity(delta)
	player.move()

	var grounded: bool = player.is_on_floor()

	if grounded:
		player.state_machine.change_state("idle")

	if Input.is_action_just_pressed("dash") and player.can_dash:
		player.state_machine.change_state("dash")

	if Input.is_action_just_pressed("jump") and coyote_timer.time_left > 0:
		player.state_machine.change_state("jump")

func _on_coyote_timer_timeout():
	pass

func exit():
	coyote_timer.disconnect("timeout", _on_coyote_timer_timeout)
