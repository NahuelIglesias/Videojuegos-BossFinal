extends "res://entities/AbstractState.gd"
var walk_sound = load("res://assets/AUDIO EFFECT/EFFECTS/08_Step_rock_02.wav") 
var soundController = AudioStreamPlayer2D.new()

func handle_input(event:InputEvent):
	if event.is_action_pressed(parent.jump_input) && parent.is_on_floor():
		emit_signal("finished", "jump")
	elif event.is_action_pressed(parent.dash_input):
		emit_signal("finished", "dash")

func update(delta):
	parent.animated_sprite.play("walk")
	soundController.stream = walk_sound
	soundController.volume_db = 24
	soundController.play()
	add_child(soundController)
	
	parent._handle_cannon_actions()
	parent._handle_move_input()
	parent._apply_movement()
	if parent.move_direction == 0:
		parent.animated_sprite.stop()
		emit_signal("finished", "idle")
