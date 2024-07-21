class_name PlayerHit
extends State

@export var jump: PlayerJump
@export var idle: PlayerIdle

func enter() -> void:
	super()
	state_name = "Hit"
	print("Hit")

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	return null

func process_input(_event: InputEvent) -> State:
	return null
