extends Label


@export var player: Player

func _process(_delta):
	if player:
		text = "Attack Combo: " + str(player.in_combo) + "
		Attack finished " + str(player.attack_finished)
