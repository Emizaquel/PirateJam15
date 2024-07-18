class_name StateMachine
extends Node

@onready var states = {}

signal state_changed(new_state: StringName)

@export var initial_state: State

var current_state: State
var previous_state: State

func initialize():
	for child in get_children():
		if (child is State):
			states[child.name.to_lower()] = child
			child.initialize(self)
	current_state = initial_state
	current_state.enter()

func process_frame(_delta):
	current_state.process_frame(_delta)

func process_physics(_delta):
	current_state.process_physics(_delta)

func change_state(new_state: String):
	new_state = new_state.to_lower()
	if (states.has(new_state)):
		previous_state = current_state
		current_state.exit()
		current_state = states[new_state]
		current_state.enter()
		state_changed.emit(new_state)
	else:
		print("State not found: " + new_state)
