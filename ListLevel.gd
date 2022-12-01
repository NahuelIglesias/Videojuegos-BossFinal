extends Control

export (PackedScene) var level_1
export (PackedScene) var level_2
onready var color_rect_level_1 = $ColorRectLevel1
onready var color_rect_level_2 = $ColorRectLevel2

var select_position = false

func _ready():
	color_rect_level_1.hide()

func _on_Start1Button_pressed():
	self.queue_free()
	get_tree().change_scene_to(level_1) 

func _on_Level_2_pressed():
	self.queue_free()
	get_tree().change_scene_to(level_2) 

func _process(delta):
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_left_2") or Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_right_2"):
		select_position = not select_position
		switch_selection()
	if Input.is_action_just_pressed("restart"):
		if select_position:
			self.queue_free()
			get_tree().change_scene_to(level_1)
		else:
			self.queue_free()
			get_tree().change_scene_to(level_2) 

func switch_selection():
	if select_position:
		color_rect_level_1.show()
		color_rect_level_2.hide()
	else:
		color_rect_level_1.hide()
		color_rect_level_2.show()
