class_name PlayerAttack
extends State

@export var jump: PlayerJump
@export var idle: PlayerIdle

var attack_complete: bool = false

func enter() -> void:
	super()
	state_name = "Attack"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	parent.current_attack_combo_delay += delta
	if parent.attack_combo_count <= 3:
		parent.attack_combo_count =0
	if attack_complete:
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("attack") and parent.current_attack_combo_delay > parent.attack_combo_delay and parent.attack_combo:
		parent.attack_combo_count += 1
	else:
		parent.attack_combo = false
		parent.attack_combo_count = 0
	return null

func attack_finished():
	if parent.attack_combo_count == 1:
		animation_name = "attack_2"
		animator.play(animation_name)
	elif  parent.attack_combo_count == 2:
		animation_name = "attack_3"
		animator.play(animation_name)
		parent.attack_combo_count = 0
	else:
		attack_complete = true
		animation_name = "attack_1"

func attack_hit():
	print("attack hit")
