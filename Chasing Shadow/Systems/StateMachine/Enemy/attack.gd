class_name EnemyAttack
extends State

@export var idle: EnemyIdle
@export var pursue: EnemyPursue


func enter() -> void:
	super()
	state_name = "Attack"
	print("Entering attack")

func exit() -> void:
	parent.attack_finished = false

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.attack_finished:
		return pursue
	return null

func animation_action() -> void:
	print("animation started")

func animation_ended() -> void:
	print("Animation ended")
	parent.attack_finished = true
