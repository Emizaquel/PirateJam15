class_name PlayerState
extends State

var player: Player

func initialize(fsm: StateMachine):
	super(fsm)
	player = fsm.get_parent()
