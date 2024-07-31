class_name PlayerDeath
extends State

@export var idle: PlayerIdle

@export var respawn_timer: float = 5
var dead_timer: float = 0

func enter() -> void:
	super()
	state_name = "Dead"

func exit() -> void:
	dead_timer = 0

func process(delta: float) -> State:
	dead_timer += delta
	if dead_timer >= respawn_timer:
		parent.fall_death(parent.respawn_coord)
		parent.health = 5
		parent.update_health.emit(5)
		parent.colision.disabled = false
		parent.dead = false
		parent.state_machine.change_state(idle)
	return null
	
func process_physics(_delta: float) -> State:
	return null
