class_name EnemyHit
extends State

@export var idle: EnemyIdle
@export var dead: EnemyDead

func enter() -> void:
	super()
	state_name = "Hit"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	if not parent.been_hit:
		return idle
	if parent.dead:
		return dead
	return null

func animation_ended() -> void:
	parent.been_hit = false
