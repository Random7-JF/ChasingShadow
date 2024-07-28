class_name EnemyIdle
extends State

@export var attack: EnemyAttack
@export var pursue: EnemyPursue



func enter() -> void:
	super()
	state_name = "Idle"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.player_found:
		return pursue
	## fall to ground
	parent.velocity.y += gravity * delta
	parent.velocity.x = 0
	parent.move_and_slide()
	return null
