extends Sprite

onready var cannon_tip = $CannonTip
var dash_sound = load("res://assets/AUDIO EFFECT/THROW/sfx_throw.wav")  
var sound_dash_Controller = AudioStreamPlayer2D.new()

export (PackedScene) var projectile_scene:PackedScene

var projectile_container
var proj_instance 

func fire():
	proj_instance = projectile_scene.instance()
	proj_instance.initialize(projectile_container, cannon_tip.global_position, global_position.direction_to(cannon_tip.global_position))
	sound_dash_Controller.stream = dash_sound
	sound_dash_Controller.volume_db = 24
	sound_dash_Controller.play()
	add_child(sound_dash_Controller)

func add_collision_exception_to_projectile(object):
	proj_instance.add_collision_exception_to_projectile(object)
