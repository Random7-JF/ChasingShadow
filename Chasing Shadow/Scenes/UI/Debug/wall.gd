extends Label


@export var player: Player

func _process(_delta):
	if player:
		text = "Wall slide: " + str(player.can_wall_slide)
