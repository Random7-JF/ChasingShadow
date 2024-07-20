class_name PlayerWalk
extends State

@export var idle: PlayerIdle
@export var run: PlayerRun
@export var jump: PlayerJump
@export var attack: State

func enter() -> void:
	super()
	state_name = "Walk"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to ground
	parent.velocity.y += gravity * delta

	var direction = Input.get_axis("move_left", "move_right") * (parent.speed * 0.50)
	if direction == 0:
		return idle
	##Dirty get_node, maybe switch to a function
	parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction
	parent.move_and_slide()
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("walk"):
		print("Tx to run")
		return run
	if Input.is_action_just_pressed("jump"):
		return jump
	return null
