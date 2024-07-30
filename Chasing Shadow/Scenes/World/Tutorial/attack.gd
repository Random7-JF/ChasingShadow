extends Area2D

@export var label: Label 

func _on_body_entered(body):
	if body is Player:
		label.visible = true
		label.text = "Use Shift to Attack, or Avoid enemies if you wish."


func _on_body_exited(body):
	if body is Player:
		label.visible = false
		label.text = ""

