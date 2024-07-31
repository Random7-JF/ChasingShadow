class_name EnemyRun
extends State

func enter() -> void:
	super()
	state_name = "Run"
	parent.setup_run()

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.global_position.distance_to(parent.run_coord) <= 60:
		parent.disapear()
		
	var direction =  parent.global_position.direction_to(parent.run_coord)
	## fall to ground
	parent.velocity.y += gravity * delta
	parent.velocity.x = direction.x * parent.speed
	parent.flip_character(direction.x)
	parent.move_and_slide()
	

	return null
