extends "res://entities/AbstractState.gd"

export (int) var jumps_limit:int = 0

var jumps:int = 0


func enter():
	parent.snap_vector = Vector2.ZERO
	parent.velocity.y = -parent.jump_speed


func exit():
	jumps = 0


func handle_input(event:InputEvent):
	if event.is_action_pressed(parent.dash_input) && parent.move_direction != 0:
		emit_signal("finished", "dash")
	elif event.is_action_pressed(parent.jump_input) && jumps < jumps_limit:
		jumps += 1
		parent.velocity.y = -parent.jump_speed


func update(delta):
	parent.animated_sprite.play("jump")
	parent._handle_cannon_actions()
	parent._handle_move_input()
	if parent.move_direction == 0:
		parent._handle_deacceleration()
	parent._apply_movement()
	if parent.is_on_floor():
		parent.animated_sprite.stop()
		if parent.move_direction == 0:
			emit_signal("finished", "idle")
		else:
			emit_signal("finished", "walk")
