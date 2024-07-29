class_name PlayerHit
extends State

@export var idle: PlayerIdle


func enter() -> void:
	super()
	state_name = "Hit"
	parent.hit = true
	parent.health -= 1

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	if not parent.hit:
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	return null

func animation_action() -> void:
	pass

func animation_ended() -> void:
	parent.hit = false
