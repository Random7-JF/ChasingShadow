class_name EnemyChase
extends State

@export var idle: EnemyIdle
@export var attack: EnemyAttack
@export var hit: EnemyHit

var player: Player
var player_pos: Vector2 = Vector2.ZERO

func enter() -> void:
	super()
	state_name = "Pursue"
	player = get_tree().get_first_node_in_group("player")

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.attack and parent.since_attack >= parent.attack_delay:
		return attack
	if parent.been_hit:
		return hit
	var direction = Vector2.ZERO
	if parent.player_found:
		direction = parent.position.direction_to(player.position)
	if direction == Vector2.ZERO:
		return idle
		
	## fall to ground
	parent.velocity.y += gravity * delta
	
	parent.flip_character(direction.x)
	parent.velocity.x = direction.x * parent.speed
	parent.move_and_slide()
	parent.since_attack += delta
	return null
