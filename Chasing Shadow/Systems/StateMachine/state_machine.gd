class_name StateMachine
extends Node

@export var state: State

func _ready():
	change_state(state)

func change_state(new_state: State):
	if state is State:
		if state != new_state:
			state._exit_state()
	new_state._enter_state()
	state = new_state

func _process_state() -> void:
	state._update_state()

func _physics_state() -> void:
	state._physics_state()

func get_current_state() -> String:
	return state.state_name
