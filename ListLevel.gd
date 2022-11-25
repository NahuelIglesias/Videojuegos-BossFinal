extends Control

export (PackedScene) var level_1
export (PackedScene) var level_2

func _on_Start1Button_pressed():
	self.queue_free()
	get_tree().change_scene_to(level_1) 
	

func _on_Level_2_pressed():
	self.queue_free()
	get_tree().change_scene_to(level_2) 
