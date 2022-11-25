extends Control

export (PackedScene) var scene_play

func _on_Start1Button_pressed():
	self.queue_free()
	get_tree().change_scene_to(scene_play) 
