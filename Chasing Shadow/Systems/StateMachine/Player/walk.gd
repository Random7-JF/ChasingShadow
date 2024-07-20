class_name PlayerWalk
extends State

@export var player: Player
@export var animator: AnimationPlayer

func _enter_state() -> void:
	state_name = "Walk"
	animator.play("walk")

func _exit_state() -> void:
	pass

func _update_state() -> void:
	pass

func _physics_state() -> void:
	if player.velocity == Vector2.ZERO:
		_exit_state()
