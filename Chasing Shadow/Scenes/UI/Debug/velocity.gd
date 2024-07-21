extends Label


@export var player: Player

func _process(_delta):
	if player:
		var message = "Velocity X: " + str(player.velocity.x) + "
		Velocity Y: " + str(player.velocity.y)
		text = message
