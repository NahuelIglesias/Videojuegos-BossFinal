extends KinematicBody2D
class_name Player2

signal hit()
signal dead()

onready var cannon = $Cannon
onready var state_machine = $StateMachine
onready var floor_raycasts:Array = $FloorRaycasts.get_children()
onready var animated_sprite = $AnimatedSprite
onready var animated_sprite_hit = $AnimatedSpriteHit
onready var aimsight = $Aimsight2
onready var playerhitsound = $PlayerHit
onready var player_teleport_sound = $PlayerTeleporter

onready var win_label2 = $WinLabel2

const FLOOR_NORMAL := Vector2.UP
const SNAP_DIRECTION := Vector2.DOWN
const SNAP_LENGTH := 32.0
const SLOPE_THRESHOLD := deg2rad(60)


export (int) var max_health = 3
export (float) var ACCELERATION:float = 30.0
export (float) var H_SPEED_LIMIT:float = 400.0
export (int) var jump_speed = 800
export (float) var FRICTION_WEIGHT:float = 0.1
export (int) var gravity = 30

export (String) var move_right_input = "move_right"
export (String) var move_left_input = "move_left"
export (String) var jump_input = "jump"
export (String) var fire_projectile_input = "fire_projectile"
export (String) var dash_input = "dash"

var projectile_container

var velocity:Vector2 = Vector2.ZERO
var snap_vector:Vector2 = SNAP_DIRECTION * SNAP_LENGTH
var move_direction:int = 0
var stop_on_slope:bool = true


func _ready():
	player_teleport_sound.volume_db = 10
	state_machine.set_parent(self)
	Player2Data.call_deferred("set_max_health", max_health)
	animated_sprite_hit.play("idle")


func initialize(projectile_container):
	self.projectile_container = projectile_container
	cannon.projectile_container = projectile_container
	 

func _handle_move_input():
	move_direction = int(Input.is_action_pressed(move_right_input)) - int(Input.is_action_pressed(move_left_input))
	if move_direction != 0:
		velocity.x = clamp(velocity.x + (move_direction * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	
	if move_direction < 0:
		animated_sprite.flip_h = true
	elif move_direction > 0:
		animated_sprite.flip_h = false


func _handle_deacceleration():
	velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0


func _handle_cannon_actions():
	var aimsight_position_normalized:Vector2 = (aimsight.global_position - cannon.global_position).normalized()
	cannon.rotation = aimsight_position_normalized.angle()


	if Input.is_action_just_pressed(fire_projectile_input):
		if projectile_container == null:
			projectile_container = get_parent()
			cannon.projectile_container = projectile_container
		cannon.fire()


func _apply_movement():
	velocity.y += gravity
	velocity = move_and_slide_with_snap(velocity, snap_vector, FLOOR_NORMAL, stop_on_slope, 4, SLOPE_THRESHOLD)
	if is_on_floor() && snap_vector == Vector2.ZERO:
		snap_vector = SNAP_DIRECTION * SNAP_LENGTH


func notify_hit(amount):
	playerhitsound.playing = true
	state_machine.notify_hit(amount)
	animated_sprite_hit.play("hit")
	

func _remove():
	hide()
	collision_layer = 0


func is_on_floor()->bool:
	var is_colliding:bool = .is_on_floor()
	for raycast in floor_raycasts:
		raycast.force_raycast_update()
		is_colliding = is_colliding || raycast.is_colliding()
	return is_colliding

func _on_VisibilityNotifier2D_screen_exited():
	if (position.y >= 768):
		position.y = 0
		player_teleport_sound.playing = true
		
	if (position.x <= 0):
		position.x = 1366
		player_teleport_sound.playing = true
	elif (position.x > 1366):
		position.x = 0
		player_teleport_sound.playing = true

func _on_AnimatedSpriteHit_animation_finished():
	animated_sprite_hit.play("idle")
