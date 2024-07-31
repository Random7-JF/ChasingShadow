extends ProgressBar

@export var shadow:Enemy

func _ready():
	shadow.connect("update_health", update_bar)

func update_bar(health):
	value = health
