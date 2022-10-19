extends Node

onready var player = $Player
onready var player2 = $Player2

onready var aimsight = $Aimsights/Aimsight
onready var aimsight2 = $Aimsights/Aimsight2

func _ready():
	randomize()
	player.initialize(self, aimsight)
	player2.initialize(self, aimsight2)

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

