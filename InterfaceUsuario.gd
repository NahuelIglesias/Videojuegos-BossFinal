extends CanvasLayer


onready var mensaje = $Mensajes
onready var mensaje2 = $Mensajes2
onready var mensaje3 = $Mensajes3
onready var mensaje4 = $Mensajes4
onready var mensaje_timer = $MensajesTimer
onready var start_button = $Start1Button
onready var score_label = $StartLabel

var musicTheme = load("res://assets/AUDIO 2/Battle of the Void.mp3")
var music = AudioStreamPlayer2D.new()


signal _iniciar_juego

func _initialize():
		
	mensaje.show()
	mensaje3.show()
	mensaje2.show()
	mensaje4.show()	
	yield(mensaje_timer, "timeout")
	start_button.show()	

func mostrar_mensaje(texto):
	mensaje.text= texto
	score_label.show()
	mensaje.show()
	mensaje3.show()
	mensaje2.show()
	mensaje4.show()
	mensaje_timer.start()
	yield(mensaje_timer, "timeout")
	start_button.show()
		
		
func game_over():
	mostrar_mensaje("GAME OVER")
	yield(mensaje_timer, "timeout")
	start_button.show()
	mensaje.text= ("ICE")
	mensaje.font=("ICE")
	mensaje3.font=("2")
	mensaje.show()
	mensaje3.show()
	mensaje2.show()
	mensaje4.show()
	
	

func update_score(Puntos):
	score_label.text= str(Puntos)	

	


func _on_MensajesTimer_timeout():
	mensaje.hide()
	 # Replace with function body.


func _on_Start1Button_pressed():
	start_button.hide()
	score_label.hide()
	mensaje.hide()
	mensaje3.hide()
	mensaje2.hide()
	mensaje4.hide()
	#music.stream = musicTheme
	#music.volume_db = -20
	#music.play()
	#add_child(music) 
	emit_signal("_iniciar_juego")	 # Replace with function body.
