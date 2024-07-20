extends Label


@onready var statemachine = $"../StateMachine"

func _process(_delta):
	text = statemachine.current_state.state_name
