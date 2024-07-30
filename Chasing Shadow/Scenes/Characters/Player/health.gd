extends Label

@export var player: Player
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "HP: " + str(player.health) +"
	State: " + str(player.state_machine.current_state.state_name)
