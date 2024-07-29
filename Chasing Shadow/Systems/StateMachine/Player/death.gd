class_name PlayerDeath
extends State

@export var idle: PlayerIdle

@export var respawn_timer: float = 5
var dead_timer: float = 0

func enter() -> void:
	super()
	state_name = "Dead"

func exit() -> void:
	pass

func process(delta: float) -> State:
	dead_timer += delta
	if dead_timer >= respawn_timer:
		parent.fall_death(parent.respawn_coord)
		parent.health = 10
		parent.colision.disabled = false
		parent.state_machine.change_state(idle)
	return null
	
func process_physics(delta: float) -> State:
	return null
