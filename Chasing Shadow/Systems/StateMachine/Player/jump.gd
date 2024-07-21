class_name PlayerJump
extends State

@export var run: PlayerRun
@export var idle: PlayerIdle
@export var fall: PlayerFall
@export var wall_slide: PlayerWallSlide
@export var double_jump: PlayerDoubleJump
@export var attack: State


func enter() -> void:
	super()
	#animator.stop()
	state_name = "Jump"
	parent.velocity.y += -parent.jump_velocity

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	if parent.velocity.y > 0 :
		return fall
	#Air control
	var direction = Input.get_axis("move_left", "move_right") * parent.speed
	if direction != 0:
			parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction
	parent.move_and_slide()
	
	if parent.is_on_wall() and parent.can_wall_slide:
		parent.can_wall_slide = false
		return wall_slide

	if parent.is_on_floor():
		if direction != 0:
			return run
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		parent.can_double_jump = false 
		return double_jump
	return null
