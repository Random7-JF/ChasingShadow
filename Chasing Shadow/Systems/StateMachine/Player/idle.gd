class_name PlayerIdle
extends State 

@export var player: Player
@export var animator: AnimationPlayer

func _enter_state() -> void:
	state_name = "Idle"
	animator.play("idle")

func _exit_state() -> void:
	pass

func _update_state() -> void:
	pass

func _process_state() -> void:
	if player.velocity != Vector2.ZERO:
		_exit_state()
