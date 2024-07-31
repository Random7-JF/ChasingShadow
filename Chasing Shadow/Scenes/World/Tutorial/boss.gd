extends Area2D
@export var label: Label

func _on_body_exited(body):
	if body is Player:
		label.visible = false
