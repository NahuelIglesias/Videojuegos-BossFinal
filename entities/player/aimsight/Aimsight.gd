extends Node2D

export (int) var speed = 7

export (String) var aim_right_input = "aim_right"
export (String) var aim_left_input = "aim_left"
export (String) var aim_down_input = "aim_down"
export (String) var aim_up_input = "aim_up"

func get_input():
	if Input.is_action_pressed(aim_right_input) && !position.x > 1358:
		position.x += speed
	if Input.is_action_pressed(aim_left_input) && !position.x <= 8:
		position.x -= speed
	if Input.is_action_pressed(aim_down_input) && !position.y >= 760:
		position.y += speed
	if Input.is_action_pressed(aim_up_input) && !position.y <= 8:
		position.y -= speed

func _physics_process(delta):
	get_input()
