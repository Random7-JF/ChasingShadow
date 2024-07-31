class_name Enemy
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var attack_hit: Area2D = $AttackHit
@onready var attack_area: CollisionShape2D = $AttackHit/AttackArea
@onready var colision: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite

@export var dead_state: EnemyDead
@export var run_state: EnemyRun
@export var health: int = 3
@export var speed: float = 500
@export var wall_grip: float = 0.50
@export var start_boundary: Marker2D
@export var end_boundary: Marker2D
@export var wander_delay: float = 5
@export var attack_delay: float = 0.5
@export var running: bool = false

var since_attack: float = attack_delay
var attack_finished: bool = false
var player_found: bool = false
var attack: bool = false
var been_hit: bool = false
var dead: bool = false

var wander_time: float = 0
var wander_coord: Vector2
var run_coord: Vector2

func _ready():
	state_machine.init(self, animator)
	if running:
		state_machine.change_state(run_state)

func _process(delta):
	state_machine.process(delta)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _unhandled_input(event):
	state_machine.process_input(event)

func setup_wander():
	wander_time = 0
	wander_coord = Vector2(randf_range(start_boundary.global_position.x, end_boundary.global_position.x), start_boundary.global_position.y)
	
func setup_run():
	run_coord = end_boundary.global_position
	
func disapear():
	sprite.visible = false
	queue_free()

func take_hit():
	been_hit = true
	health -= 1
	if health <= 0:
		state_machine.change_state(dead_state)
		colision.disabled = true
		
func flip_character(direction: float):
	sprite.flip_h = direction < 0
	if direction < 0:
		attack_area.position.x = -50
	else:
		attack_area.position.x = 50

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
