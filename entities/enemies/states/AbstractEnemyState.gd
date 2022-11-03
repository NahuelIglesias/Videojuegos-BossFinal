extends "res://entities/AbstractState.gd"


func notify_body_entered(body):
	if parent.target == null:
		parent.target = body


func notify_body_exited(body):
	if body == parent.target:
		parent.target = null

