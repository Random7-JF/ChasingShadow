extends Area2D

@export var label: Label 

func _on_body_entered(body):
	if body is Player:
		label.visible = true
		label.text = "Jump into a wall to grab on to it."


func _on_body_exited(body):
	if body is Player:
		label.visible = false
		label.text = ""
