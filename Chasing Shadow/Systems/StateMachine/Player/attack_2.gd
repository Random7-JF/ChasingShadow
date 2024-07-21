class_name PlayerAttack2
extends State

@export var jump: PlayerJump
@export var run: PlayerRun
@export var idle: PlayerIdle
@export var attack_3: PlayerAttack3

func enter() -> void:
	print("----Enter attack 2")
	super()
	state_name = "Attack 2"

func exit() -> void:
	print("----Exit attack 2")
	parent.next_attack = false
	parent.attack_finished = false
	parent.in_combo = false

func process(_delta: float) -> State:
	return null
	
func process_physics( delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	parent.move_and_slide()

	if parent.next_attack and parent.attack_finished:
		return attack_3
	elif parent.attack_finished:
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("attack") and parent.in_combo:
		parent.next_attack = true
	return null
	
func animation_action() -> void:
	parent.in_combo = true
	print("Attack 2 animation action")

func animation_ended() -> void:
	parent.in_combo = false
	parent.attack_finished = true
	print("Attack 2 animation ended")
