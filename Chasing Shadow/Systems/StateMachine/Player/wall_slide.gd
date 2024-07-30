class_name PlayerWallSlide
extends State

@export var jump: PlayerJump
@export var idle: PlayerIdle
@export var attack_1: PlayerAttack1
@export var hit: PlayerHit

func enter() -> void:
	super()
	state_name = "Wall Slide"

func exit() -> void:
	parent.can_wall_slide = true

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.been_hit:
		return hit
	#fall to the ground
	parent.velocity.y += (gravity * parent.wall_grip) * delta
	parent.move_and_slide()
	if parent.is_on_floor() or not parent.is_on_wall():
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		parent.velocity.y = 0
		return jump
	return null
