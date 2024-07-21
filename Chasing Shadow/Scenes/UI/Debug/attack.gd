extends Label


@export var player: Player

func _process(_delta):
	if player:
		text = "Attack Combo: " + str(player.attack_combo) + "
		Attack # " + str(player.attack_combo_count)
