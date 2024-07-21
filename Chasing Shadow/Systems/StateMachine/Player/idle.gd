class_name PlayerIdle
extends State

@export var walk: PlayerWalk
@export var run: PlayerRun
@export var jump: PlayerJump
@export var attack: PlayerAttack

func enter() -> void:
	super()
	state_name = "Idle"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	
	## get the direction in idle, incase the keys are being held.
	## send to run state if they are
	var direction = Input.get_axis("move_left", "move_right") * parent.speed
	if direction != 0:
		return run
	## Dirty get_node, maybe switch to a function
	parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction

	parent.move_and_slide()

	return null

func process_input(_event: InputEvent) -> State:
	#Leave idle if any controls are pressed.
	if Input.is_action_just_pressed("walk"):
		return walk
	if Input.is_action_just_pressed("jump"):
		return jump
	## checking if the key is pressed and returning to run state if pressed,
	## this is to combat pressting move_left and move right at the same time and then letting go
	## of one and not move at all until you let go of both.
	## needs more testing.
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return run
	
	if Input.is_action_just_pressed("attack"):
		return attack

	return null
