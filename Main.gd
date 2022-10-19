extends Node

onready var player = $Environment/Player
onready var player2 = $Environment/Player2

func _ready():
	randomize()
	player.initialize(self)
	player2.initialize(self)

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

