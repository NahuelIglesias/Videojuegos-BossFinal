extends Node

signal player1_won()
signal player2_won()

func notify_player1_won():
	emit_signal("player1_won")

func notify_player2_won():
	emit_signal("player2_won")
