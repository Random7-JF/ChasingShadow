extends Label

@export var enemy: Enemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		text = enemy.state_machine.current_state.state_name
