class_name PlayerJump
extends State

@export var walk: PlayerWalk
@export var run: PlayerRun
@export var idle: PlayerIdle
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
		pass
	#Air control
	var direction = Input.get_axis("move_left", "move_right") * parent.speed
	if direction != 0:
			parent.get_node("Sprite").flip_h = direction < 0
	parent.velocity.x = direction
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if direction != 0:
			return run
		return idle
	return null

func process_input(_event: InputEvent) -> State:
	return null
