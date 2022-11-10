extends Node2D

export (int) var speed = 10

export (String) var aim_right_input = "aim_right"
export (String) var aim_left_input = "aim_left"
export (String) var aim_down_input = "aim_down"
export (String) var aim_up_input = "aim_up"

func get_input():
	
	if Input.is_action_pressed(aim_right_input):
		position = Vector2(40,0)
	if Input.is_action_pressed(aim_left_input):
		position = Vector2(-40,0)
	if Input.is_action_pressed(aim_down_input):
		position = Vector2(0,40)
	if Input.is_action_pressed(aim_up_input):
		position = Vector2(0,-40)
		
	if Input.is_action_pressed(aim_right_input) && Input.is_action_pressed(aim_up_input):
		position = Vector2(40,-40)
	if Input.is_action_pressed(aim_right_input) && Input.is_action_pressed(aim_down_input):
		position = Vector2(40,40)
	if Input.is_action_pressed(aim_left_input) && Input.is_action_pressed(aim_up_input):
		position = Vector2(-40,-40)
	if Input.is_action_pressed(aim_left_input) && Input.is_action_pressed(aim_down_input):
		position = Vector2(-40,40)			

func _physics_process(delta):
	get_input()
