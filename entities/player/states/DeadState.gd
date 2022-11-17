extends "res://entities/AbstractState.gd"

var dead_sound = load("res://assets/AUDIO EFFECT/DEAD/death.wav") 
var sound_dead_Controller = AudioStreamPlayer2D.new()



func enter():
	sound_dead_Controller.stream = dead_sound
	sound_dead_Controller.volume_db = 24
	sound_dead_Controller.play()
	add_child(sound_dead_Controller)
	
	yield(get_tree().create_timer(0.5), "timeout")
	parent._remove()
	


func update(delta):
	parent._handle_deacceleration()
	parent._apply_movement()
