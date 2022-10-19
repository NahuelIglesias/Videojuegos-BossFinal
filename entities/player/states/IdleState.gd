extends "res://entities/AbstractState.gd"


func handle_input(event:InputEvent):
	if event.is_action_pressed(parent.move_left_input) || event.is_action_pressed(parent.move_right_input):
		emit_signal("finished", "walk")
	if event.is_action_pressed(parent.jump_input) && parent.is_on_floor():
		emit_signal("finished", "jump")


func update(delta:float):
	parent._handle_cannon_actions()
	parent._handle_deacceleration()
	parent._apply_movement()
