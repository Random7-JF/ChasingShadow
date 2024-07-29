class_name PlayerAttack2
extends State

@export var jump: PlayerJump
@export var run: PlayerRun
@export var idle: PlayerIdle
@export var attack_3: PlayerAttack3
@export var hit: PlayerHit

func enter() -> void:
	super()
	state_name = "Attack 2"

func exit() -> void:
	parent.next_attack = false
	parent.attack_finished = false
	parent.in_combo = false

func process(_delta: float) -> State:
	return null
	
func process_physics( delta: float) -> State:
	if parent.been_hit:
		return hit
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
	var attack_zone: Area2D = parent.attack_zone
	for body in attack_zone.get_overlapping_bodies():
		if body is Enemy:
			body.take_hit()

func animation_ended() -> void:
	parent.in_combo = false
	parent.attack_finished = true
