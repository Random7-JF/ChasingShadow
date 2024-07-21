class_name PlayerAttack
extends State

@export var jump: PlayerJump
@export var idle: PlayerIdle

func enter() -> void:
	super()
	state_name = "Attack"
	parent.attacking = true
	parent.attack_time_since = 0

func exit() -> void:
	parent.attacking = false
	parent.attack_combo = 0

func process(delta: float) -> State:
	parent.attack_time_since += delta
	return null
	
func process_physics(delta: float) -> State:
	if not parent.attacking:
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("attack") and parent.attack_can_combo and can_attack():
		parent.attack_combo = clampi(parent.attack_combo + 1 , 0, 2)
		parent.attacking = true
	return null

func attack_finished():
	if parent.attack_can_combo and parent.attack_combo <= 2:
		if parent.attack_combo == 0:
			animation_name = "attack_1"
			parent.attack_time_since = 0
		elif parent.attack_combo == 1:
			animation_name = "attack_2"
			animator.play(animation_name)
			parent.attack_time_since = 0
		elif parent.attack_combo >= 2:
			animation_name = "attack_3"
			animator.play(animation_name)
			parent.attack_combo = 0
			parent.attack_time_since = 0
	parent.attacking = false
	parent.attack_can_combo = false
	
func attack_hit():
	parent.attack_can_combo = true
	print("attack count ", str(parent.attack_combo))

func can_attack() -> bool:
	if parent.attack_time_since > parent.attack_delay:
		return true
	return false
