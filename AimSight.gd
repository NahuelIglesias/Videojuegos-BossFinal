extends Node2D

export (int) var speed = 7


func get_input():
	if Input.is_action_pressed("aim_right"):
		position.x += speed
	if Input.is_action_pressed("aim_left"):
		position.x -= speed
	if Input.is_action_pressed("aim_down"):
		position.y += speed
	if Input.is_action_pressed("aim_up"):
		position.y -= speed

func _physics_process(delta):
	get_input()
