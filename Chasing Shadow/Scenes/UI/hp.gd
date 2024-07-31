extends VBoxContainer

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("update_health", update_bar)


func update_bar(health):
	$MarginContainer/ProgressBar.value = health
