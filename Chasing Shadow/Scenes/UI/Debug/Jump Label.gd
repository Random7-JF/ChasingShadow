extends Label


@export var player: Player

func _process(_delta):
	if player:
		text = "Double jump: " + str(player.can_double_jump)
