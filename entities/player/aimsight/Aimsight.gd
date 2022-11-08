extends Node2D

export (int) var speed = 10

export (String) var aim_right_input = "aim_right"
export (String) var aim_left_input = "aim_left"
export (String) var aim_down_input = "aim_down"
export (String) var aim_up_input = "aim_up"

var parent_player

func get_input():
	if Input.is_action_pressed(aim_right_input) && !global_position.x > 1358 && !position.x > 70:
		position.x += speed
	if Input.is_action_pressed(aim_left_input) && !global_position.x <= 8 && !position.x <= -70:
		position.x -= speed
	if Input.is_action_pressed(aim_down_input) && !global_position.y >= 760 && !position.y >= 70:
		position.y += speed
	if Input.is_action_pressed(aim_up_input) && !global_position.y <= 8 && !position.y <= -70:
		position.y -= speed

func set_parent_player(parent_player):
	self.parent_player = parent_player

func _physics_process(delta):
	get_input()
