class_name State
extends Node

@export var animation_name: String
@export var speed: float = 500

var parent: CharacterBody2D
var animator: AnimationPlayer
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var state_name: String = "State"

func enter() -> void:
	animator.play(animation_name)

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	return null

func process_input(_event: InputEvent) -> State:
	return null
