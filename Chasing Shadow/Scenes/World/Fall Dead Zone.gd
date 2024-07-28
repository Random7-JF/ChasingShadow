extends Area2D

@export var map_entrance_coord: Vector2 = Vector2.ZERO

func _on_body_entered(body):
	if body is Player:
		body.fall_death(map_entrance_coord)
