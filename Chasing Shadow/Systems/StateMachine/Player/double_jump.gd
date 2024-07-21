class_name PlayerDoubleJump
extends State

@export var fall: PlayerFall
@export var idle: PlayerIdle
@export var wall_slide: PlayerWallSlide
@export var attack_1: PlayerAttack1

func enter() -> void:
	#super()
	state_name = "Double Jump"
	parent.velocity.y = -parent.jump_velocity

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	if parent.velocity.y > 0 :
		return fall
	parent.move_and_slide()
	if parent.is_on_wall() and parent.can_wall_slide:
		parent.can_wall_slide = false
		return wall_slide
	if parent.is_on_floor():
		return idle
	
	return null

func process_input(_event: InputEvent) -> State:
	return null
