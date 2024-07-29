class_name EnemyAttack
extends State

@export var idle: EnemyIdle
@export var chase: EnemyChase
@export var hit: EnemyHit


func enter() -> void:
	super()
	state_name = "Attack"
	parent.since_attack = 0

func exit() -> void:
	parent.attack_finished = false

func process(_delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if parent.attack_finished:
		return chase
	else:
		parent.since_attack += delta
	if parent.been_hit:
		return hit
	return null

func animation_action() -> void:
		var attack_zone: Area2D = parent.attack_hit
		for body in attack_zone.get_overlapping_bodies():
			if body is Player:
				body.take_hit()
	
func animation_ended() -> void:
	parent.attack_finished = true
