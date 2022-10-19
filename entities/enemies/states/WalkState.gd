extends "res://entities/enemies/states/AbstractEnemyState.gd"

export (Vector2) var wander_radius
export (float) var speed
export (float) var max_h_speed

var path:Array = []


func notify_body_entered(body):
	.notify_body_entered(body)
	if parent._can_see_target():
		emit_signal("finished", "alert")


func enter():
	var random_point:Vector2 = parent.global_position + Vector2(rand_range(-wander_radius.x, wander_radius.x), rand_range(-wander_radius.y, wander_radius.y))
	path = parent.pathfinding.get_simple_path(parent.global_position, random_point)
	if path.empty():
		emit_signal("finished", "idle")
		return


func exit():
	path = []


func update(delta):
	if path.empty():
		emit_signal("finished", "idle")
		return
	var next_point:Vector2 = path.front()
	while parent.global_position.distance_to(next_point) < 32:
		path.pop_front()
		if path.empty():
			emit_signal("finished", "idle")
			return
		else:
			next_point = path.front()
	parent.velocity.x = clamp((parent.velocity.x + parent.global_position.direction_to(next_point).x * speed), -max_h_speed, max_h_speed)
	parent.apply_movement()
	
