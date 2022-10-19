extends "res://entities/AbstractState.gd"

export (float) var dash_time:float = 1.0
export (float) var speed_multiplier:float = 1.0

var dash_timer:Timer

func _ready():
	dash_timer = Timer.new()
	add_child(dash_timer)
	dash_timer.one_shot = true
	dash_timer.connect("timeout", self, "_on_dash_timer_timeout")


func enter():
	dash_timer.start(dash_time)


func exit():
	dash_timer.stop()


func update(delta):
	parent._handle_cannon_actions()
	parent.velocity.x = clamp(parent.velocity.x + (parent.move_direction * parent.ACCELERATION * speed_multiplier), -parent.H_SPEED_LIMIT * speed_multiplier, parent.H_SPEED_LIMIT * speed_multiplier)
	parent._apply_movement()


func _on_dash_timer_timeout():
	parent._handle_move_input()
	if parent.move_direction == 0:
		emit_signal("finished", "idle")
	else:
		emit_signal("finished", "walk")
