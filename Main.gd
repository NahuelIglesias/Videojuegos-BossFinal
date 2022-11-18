extends Node


var musicTheme = load("res://assets/AUDIO 2/Battle of the Void.mp3")
var music = AudioStreamPlayer2D.new()

onready var mensaje = $Mensajes
onready var mensaje_timer = $MensajesTimer
onready var start_button = $Start1Button
onready var score_label = $StartLabel
onready var interface = $InterfaceUsuario
onready var win_label = $WinLabel
onready var win_label2 = $WinLabel2
onready var canvas = $CanvasLayer
onready var player = $Player
onready var player2 = $Player2
onready var environment = $Environment
onready var gui = $GUI

func _ready():
	randomize()
	player.initialize(self)
	player2.initialize(self)
	gui.visible = false
	canvas.visible = false
	environment.visible = false
	player.visible = false
	player2.visible = false	
	interface._initialize()
		
	
	
func _unhandled_input(event):
	if event.is_action("restart") && (PlayerData.current_health <= 0 || Player2Data.current_health <= 0):
		_restart_level()
	

func _restart_level():
	#interface._initialize()
	get_tree().reload_current_scene()
	



func _on_InterfaceUsuario__iniciar_juego():
	gui.visible = true
	canvas.visible = true
	environment.visible = true
	player.visible = true
	player2.visible = true
	score_label = 0
	music.stream = musicTheme
	music.volume_db = -20
	music.play()
	add_child(music) 
	
	
	 # Replace with function body.
