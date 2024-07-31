extends Area2D
@export var label: Label

func _on_body_exited(body):
	label.visible = false
