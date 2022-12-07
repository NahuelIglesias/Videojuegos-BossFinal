extends "res://entities/enemies/states/AbstractEnemyState.gd"


func enter():
	parent.call_deferred("_remove")
	
