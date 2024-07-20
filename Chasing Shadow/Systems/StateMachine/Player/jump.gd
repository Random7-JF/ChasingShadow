class_name PlayerJump
extends State

@export var walk: PlayerWalk
@export var idle: PlayerIdle
@export var attack: State
@export var jump_velocity: float

func enter() -> void:
	super()
	state_name = "Jump"
	parent.velocity.y += -jump_velocity

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	#fall to the ground
	parent.velocity.y += gravity * delta
	if parent.velocity.y > 0 :
		pass
	#Air control
	var direction = Input.get_axis("move_left", "move_right") * speed
	if direction != 0:
			parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if direction != 0:
			return walk
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	#Leave idle if any controls are pressed.
	if Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("move_right"):
		return walk
	return null
