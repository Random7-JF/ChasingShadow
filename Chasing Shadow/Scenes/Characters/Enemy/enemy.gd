class_name Enemy
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animator: AnimationPlayer = $AnimationPlayer


@export var speed: float = 500
@export var wall_grip: float = 0.50
var can_wall_slide: bool = true

@export var jump_velocity: float = 400
var can_double_jump: bool = true

var in_combo: bool = false
var attack_finished: bool = false
var next_attack: bool = false

var hit: bool = false

var player_found: bool = false
var attack: bool = false

func _ready():
	state_machine.init(self, animator)

func _process(delta):
	state_machine.process(delta)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _unhandled_input(event):
	state_machine.process_input(event)


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
