extends Label


@export var player: Player

func _process(_delta):
	if player:
		text = player.state_machine.current_state.state_name
