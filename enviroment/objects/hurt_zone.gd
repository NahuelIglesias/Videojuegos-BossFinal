extends Area2D


func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body is Player:
		body.notify_hit(-PlayerData.current_health)
			  
	elif body is Player2:
		body.notify_hit(-Player2Data.current_health)
		
