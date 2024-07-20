class_name PlayerIdle
extends State

@export var walk: PlayerWalk
@export var run: PlayerRun
@export var jump: PlayerJump
@export var attack: State

func enter() -> void:
	super()
	state_name = "Idle"
	#Stop all movement on the X axis
	parent.velocity.x = 0

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null

func process_input(_event: InputEvent) -> State:
	#Leave idle if any controls are pressed.
	if Input.is_action_just_pressed("walk"):
		return walk
	if Input.is_action_just_pressed("jump"):
		return jump
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return run

	return null
