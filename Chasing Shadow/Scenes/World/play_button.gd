extends Button

@export var level_1: PackedScene

func _on_pressed():
	get_tree().change_scene_to_packed(level_1)
