extends "res://entities/AbstractState.gd"


func handle_input(event:InputEvent):
	if event.is_action_pressed(parent.jump_input) && parent.is_on_floor():
		emit_signal("finished", "jump")
	elif event.is_action_pressed(parent.dash_input):
		emit_signal("finished", "dash")

func update(delta):
	parent._handle_cannon_actions()
	parent._handle_move_input()
	parent._apply_movement()
	if parent.move_direction == 0:
		emit_signal("finished", "idle")
