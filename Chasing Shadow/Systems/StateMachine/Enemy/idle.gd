class_name EnemyIdle
extends State

@export var hit: EnemyHit
@export var attack: EnemyAttack
@export var chase: EnemyChase
@export var wander: EnemyWander




func enter() -> void:
	super()
	state_name = "Idle"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	parent.wander_time += delta
	if parent.wander_time > parent.wander_delay:
		return wander
	if parent.player_found:
		return chase
	if parent.been_hit:
		return hit
	## fall to ground
	parent.velocity.y += gravity * delta
	parent.velocity.x = 0
	parent.move_and_slide()
	return null
