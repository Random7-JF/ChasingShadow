extends Label

@export var enemy: Enemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		text = str(enemy.health)
