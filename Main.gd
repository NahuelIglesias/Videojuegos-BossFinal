extends Node


var musicTheme = load("res://assets/AUDIO 2/Battle of the Void.mp3")
var music = AudioStreamPlayer2D.new()

onready var mensaje = $Mensajes
onready var mensaje_timer = $MensajesTimer
onready var start_button = $Start1Button
onready var score_label = $StartLabel
onready var win_label = $WinLabel
onready var win_label2 = $WinLabel2
onready var canvas = $CanvasLayer
onready var player = $Player
onready var player2 = $Player2


func _ready():
	randomize()
	music.stream = musicTheme
	music.volume_db = 1
	music.play()
	add_child(music) 
	
	
func _unhandled_input(event):
	if event.is_action("restart") && (PlayerData.current_health <= 0 || Player2Data.current_health <= 0):
		_restart_level()
	

func _restart_level():
	#self.queue_free()
	#if ResourceLoader.exists("res://ListLevel.tscn"):
	#	get_tree().change_scene("res://ListLevel.tscn")
	#get_tree().change_scene("res://ListLevel.tscn")
	get_tree().reload_current_scene()
