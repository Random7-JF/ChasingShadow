class_name EnemyDead
extends State



func enter() -> void:
	super()
	state_name = "Dead"

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	return null

func animation_ended() -> void:
	get_tree().change_scene_to_packed(parent.victor_scene)
