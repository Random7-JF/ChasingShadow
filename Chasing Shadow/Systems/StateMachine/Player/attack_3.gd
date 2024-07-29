class_name PlayerAttack3
extends State

@export var jump: PlayerJump
@export var run: PlayerRun
@export var idle: PlayerIdle

func enter() -> void:
	super()
	state_name = "Attack 3"

func exit() -> void:
	parent.next_attack = false
	parent.attack_finished = false
	parent.in_combo = false

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	parent.move_and_slide()

	if parent.attack_finished:
		return idle
	return null

func process_input(_event: InputEvent) -> State:
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
