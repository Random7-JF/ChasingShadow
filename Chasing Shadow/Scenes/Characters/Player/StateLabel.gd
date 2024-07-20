extends Label


@onready var statemachine = $"../StateMachine"

func _process(_delta):
	text = statemachine.get_current_state()
