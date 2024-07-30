class_name Player
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var colision: CollisionShape2D = $CollisionShape2D
@onready var attack_zone: Area2D = $AttackZone
@onready var attack_area: CollisionShape2D = $"AttackZone/AttackArea"
@onready var sprite: Sprite2D = $Sprite

@export var death_state: State
@export var respawn_coord: Vector2

@export var speed: float = 500
@export var wall_grip: float = 0.50
var can_wall_slide: bool = true

@export var jump_velocity: float = 400
var can_double_jump: bool = true

var in_combo: bool = false
var attack_finished: bool = false
var next_attack: bool = false

var been_hit: bool = false
@export var health: int = 5
var dead: bool = false

func _ready():
	state_machine.init(self, animator)

func _process(delta):
	state_machine.process(delta)

func _physics_process(delta):
	if health <= 0 and not dead:
		dead = true
		state_machine.change_state(death_state)
		colision.disabled = true
	state_machine.process_physics(delta)

func _unhandled_input(event):
	state_machine.process_input(event)

func fall_death(coord: Vector2):
	position = coord

func take_hit():
	health -= 1
	been_hit = true

func flip_character(direction: float):
	sprite.flip_h = direction < 0
	if direction < 0:
		attack_area.position.x = -50
	else:
		attack_area.position.x = 50
	


func _on_movement_body_entered(body):
	pass # Replace with function body.
