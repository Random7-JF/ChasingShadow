class_name PlayerAttack3
extends State

@export var jump: PlayerJump
@export var run: PlayerRun
@export var idle: PlayerIdle

func enter() -> void:
	print("----Enter attack 3")
	super()
	state_name = "Attack 3"

func exit() -> void:
	print("----Exit attack 3")
	parent.next_attack = false
	parent.attack_finished = false
	parent.in_combo = false

func process(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	if parent.attack_finished:
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	return null
	
func animation_action() -> void:
	parent.in_combo = true
	print("Attack 3 animation action")

func animation_ended() -> void:
	parent.in_combo = false
	parent.attack_finished = true
	print("Attack 3 animation ended")
