extends "res://entities/AbstractStateMachine.gd"


func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"jump": $Jump,
		"dead": $Dead,
		"dash": $Dash
	}


func notify_hit(amount):
	Player2Data.current_health += min(amount, Player2Data.max_health)
	print(Player2Data.current_health)
	if Player2Data.current_health == 0:
		_change_state("dead")
		GameState.notify_player1_won()
