class_name StateMachine
extends Node

@export var starting_state: State
var current_state: State

func init(new_parent: CharacterBody2D, new_animator: AnimationPlayer):
	for child in get_children():
		child.parent = new_parent
		child.animator = new_animator
	change_state(starting_state)
	
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

## Pass through functions called by parent of state machine
## If the return a new State, the change_state function is called
## This allows the old state to cleanup and then enter the new state.
func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func animation_action() -> void:
	current_state.animation_action()

func animation_ended() -> void:
	current_state.animation_ended()
