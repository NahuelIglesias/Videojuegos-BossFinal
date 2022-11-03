extends "res://entities/AbstractStateMachine.gd"


func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"alert": $Alert,
		"dead": $Dead
	}


func notify_body_entered(body):
	current_state.notify_body_entered(body)


func notify_body_exited(body):
	current_state.notify_body_exited(body)


func notify_hit(amount):
	if current_state != $Dead:
		_change_state("dead")
