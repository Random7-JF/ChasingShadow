class_name Player
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animator: AnimationPlayer = $AnimationPlayer


@export var speed: float = 500
@export var wall_grip: float = 0.50
var can_wall_slide: bool = true

@export var jump_velocity: float = 400
var can_double_jump: bool = true

var attack_can_combo: bool = false
var attack_combo: int = 0
var attacking: bool = false
var attack_time_since: float = 0
@export var attack_delay: float = 0.3

func _ready():
	state_machine.init(self, animator)

func _process(delta):
	state_machine.process(delta)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _unhandled_input(event):
	state_machine.process_input(event)
