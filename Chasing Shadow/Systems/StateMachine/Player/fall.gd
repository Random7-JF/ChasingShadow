class_name PlayerFall
extends State

@export var idle: PlayerIdle
@export var double_jump: PlayerDoubleJump
@export var wall_slide: PlayerWallSlide
@export var attack_1: PlayerAttack1

func enter() -> void:
	state_name = "Fall"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.is_on_floor():
		parent.can_double_jump = true 
		parent.can_wall_slide = true
		return idle

	if parent.is_on_wall() and parent.can_wall_slide:
		parent.can_wall_slide = false
		return wall_slide

	var direction = Input.get_axis("move_left", "move_right") * parent.speed
	## Dirty get_node, maybe switch to a function
	parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction

	#fall to the ground
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.can_double_jump:
		parent.velocity.y = 0
		parent.can_double_jump = false 
		return double_jump
	return null
