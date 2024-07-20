class_name State
extends Node

var state_machine: StateMachine

func initialize(fsm: StateMachine):
	state_machine = fsm

func enter():
	pass
	
func process_frame(_delta):
	pass
	
func process_physics(_delta):
	pass

func exit():
	pass
