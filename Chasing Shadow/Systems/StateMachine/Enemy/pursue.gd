class_name EnemyPursue
extends State

@export var idle: EnemyIdle
@export var attack: EnemyAttack

var player: Player
var player_pos: Vector2 = Vector2.ZERO

func enter() -> void:
	super()
	state_name = "Pursue"
	player = get_tree().get_first_node_in_group("player")
	print("Enter Pursue")

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.attack:
		return attack
	var direction = Vector2.ZERO
	if parent.player_found:
		direction = parent.position.direction_to(player.position)
	if direction == Vector2.ZERO:
		return idle
		
	## fall to ground
	parent.velocity.y += gravity * delta
	
	##Dirty get_node, maybe switch to a function
	parent.get_node("Sprite").flip_h = direction.x < 0
	parent.velocity.x = direction.x * parent.speed
	parent.move_and_slide()
	
	return null
