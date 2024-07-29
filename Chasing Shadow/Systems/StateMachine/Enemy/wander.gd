class_name EnemyWander
extends State

@export var idle: EnemyIdle
@export var attack: EnemyAttack
@export var chase: EnemyChase
@export var hit: EnemyHit


func enter() -> void:
	super()
	state_name = "Wander"
	parent.setup_wander()

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.attack:
		return attack
	if parent.player_found:
		return chase
	if parent.global_position.distance_to(parent.wander_coord) < 100:
		return idle
	if parent.been_hit:
		return hit
	## fall to ground
	parent.velocity.y += gravity * delta
	
	var direction =  parent.global_position.direction_to(parent.wander_coord) * (parent.speed * 0.50)
	##Dirty get_node, maybe switch to a function
	parent.flip_character(direction.x)
	parent.velocity.x = direction.x
	
	parent.move_and_slide()
	return null
