extends CanvasLayer

export (PackedScene) var hearth_scene

onready var fade_tween = $Fade/Tween
onready var fade = $Fade/ScreenCover
onready var hearths_container = $HearthsContainer
onready var hearths_container_player2 = $HearthsContainer2
onready var win_label = $WinLabel
onready var win_label2 = $WinLabel2
onready var x_button = $XButton
onready var restart_label = $RestartLabel
onready var circle_button = $CircleButton
onready var change_map_label = $ChangeMapLabel


func _ready():
	fade.color.a = 0
	fade.hide()
	win_label.hide()
	win_label2.hide()
	hide_inputs()
	
	PlayerData.connect("max_health_updated", self, "_on_player_max_health_updated")
	PlayerData.connect("health_updated", self, "_on_player_health_updated")
	GameState.connect("player1_won", self, "_on_player1_won")
	GameState.connect("player2_won", self, "_on_player2_won")
	
	Player2Data.connect("max_health_updated", self, "_on_player_max_health_updated2")
	Player2Data.connect("health_updated", self, "_on_player_health_updated2")



func fade_to_black():
	fade.show()
	fade_tween.interpolate_property(fade, "color", fade.color, Color.black, 1)
	fade_tween.start()


func _reset_hearths():
	var children:Array = hearths_container.get_children()
	for child in children:
		hearths_container.remove_child(child)
		child.queue_free()
		
		
func _reset_hearths2():
	var children:Array = hearths_container_player2.get_children()
	for child in children:
		hearths_container_player2.remove_child(child)
		child.queue_free()


func _on_player_max_health_updated(amount:int, current_health:int):
	_reset_hearths()
	for i in amount:
		var new_hearth = hearth_scene.instance()
		hearths_container.add_child(new_hearth)
		new_hearth.id = i+1
	_on_player_health_updated(current_health, amount)
	
func _on_player_max_health_updated2(amount:int, current_health:int):
	_reset_hearths2()
	for i in amount:
		var new_hearth = hearth_scene.instance()
		hearths_container_player2.add_child(new_hearth)
		new_hearth.id = i+1
	_on_player_health_updated2(current_health, amount)


func _on_player_health_updated(amount:int, max_health:int):
	for hearth in hearths_container.get_children():
		hearth.update_hearth(amount, max_health)
	if amount <= 0:
		fade_to_black()


func _on_player_health_updated2(amount:int, max_health:int):
	for hearth in hearths_container_player2.get_children():
		hearth.update_hearth(amount, max_health)
	if amount <= 0:
		fade_to_black()

func _on_player1_won():
	win_label.show()
	fade_to_black()
	show_inputs()
	
func _on_player2_won():
	win_label2.show()
	fade_to_black()
	show_inputs()

func hide_inputs():
	x_button.hide()
	restart_label.hide()
	circle_button.hide()
	change_map_label.hide()

func show_inputs():
	x_button.show()
	restart_label.show()
	circle_button.show()
	change_map_label.show()
