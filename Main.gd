extends Node

onready var player = $Player
onready var player2 = $Player2
var musicTheme = load("res://assets/AUDIO 2/Battle of the Void.mp3")

func _ready():
	var music = AudioStreamPlayer2D.new()
	music.stream = musicTheme
	music.volume_db = -100
	music.play()
	add_child(music) 
	randomize()
	player.initialize(self)
	player2.initialize(self)
	
	
	
	
	
func _unhandled_input(event):
	if event.is_action("restart") && (PlayerData.current_health <= 0 || Player2Data.current_health <= 0):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()
	$ThemeMusic.playing = true

