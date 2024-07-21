class_name PlayerRun
extends State

@export var idle: PlayerIdle
@export var walk: PlayerWalk
@export var jump: PlayerJump
@export var attack: PlayerAttack

func enter() -> void:
	super()
	state_name = "Run"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to ground
	parent.velocity.y += gravity * delta

	var direction = Input.get_axis("move_left", "move_right") * parent.speed
	if direction == 0:
		return idle
	##Dirty get_node, maybe switch to a function
	parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction
	parent.move_and_slide()
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_pressed("walk"):
		return walk
	if Input.is_action_just_pressed("jump"):
		return jump
	return null
