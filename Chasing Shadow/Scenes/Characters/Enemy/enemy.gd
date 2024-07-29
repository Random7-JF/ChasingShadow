class_name Enemy
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animator: AnimationPlayer = $AnimationPlayer


@export var speed: float = 500
@export var wall_grip: float = 0.50
var can_wall_slide: bool = true
var attack_finished: bool = false
var player_found: bool = false
var attack: bool = false

@export var start_boundary: Marker2D
@export var end_boundary: Marker2D
@export var wander_delay: float = 190
var wander_time: float = 0
var wander_coord: Vector2



func _ready():
	state_machine.init(self, animator)

func _process(delta):
	state_machine.process(delta)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _unhandled_input(event):
	state_machine.process_input(event)

func setup_wander():
	wander_time = 0
	wander_coord = Vector2(randf_range(start_boundary.global_position.x, end_boundary.global_position.x), start_boundary.global_position.y)

func _on_aggro_range_body_entered(body):
	if body is Player:
		player_found = true

func _on_aggro_range_body_exited(body):
	if body is Player:
		player_found = false

func _on_attack_range_body_entered(body):
	if body is Player:
		attack = true

func _on_attack_range_body_exited(body):
	if body is Player:
		attack = false
