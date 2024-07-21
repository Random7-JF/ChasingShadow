class_name PlayerAttack
extends State

@export var jump: PlayerJump
@export var idle: PlayerIdle

func enter() -> void:
	super()
	state_name = "Attack"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("attack") and parent.attack_can_combo:
		parent.attack_combo += 1
	return null

func attack_finished():
	
	if parent.attack_combo == 0 and parent.attack_can_combo:
		animation_name = "attack_1"
	elif parent.attack_combo == 1 and parent.attack_can_combo:
		animation_name = "attack_2"
		animator.play(animation_name)
	elif parent.attack_combo == 2 and parent.attack_can_combo:
		animation_name = "attack_3"
		animator.play(animation_name)
		parent.attack_combo = 0
	else:
		animation_name = "attack_1"
		parent.attack_combo = 0
		
	parent.attack_can_combo = false
	print("attack finished")
	
func attack_hit():
	parent.attack_can_combo = true
	print("attack count", str(parent.attack_combo))
