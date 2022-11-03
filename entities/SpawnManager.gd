tool
extends Node

export (PackedScene) var element_scene:PackedScene setget set_element_scene
export (bool) var spawn_element:bool = false setget set_spawn_element

export (PackedScene) var pathfind_scene:PackedScene setget set_pathfind_scene
export (bool) var generate_pathfind setget set_generate_pathfind

export (NodePath) var pathfind_path:NodePath


func set_element_scene(value:PackedScene):
	element_scene = value


func set_spawn_element(value:bool):
	spawn_element = false
	if value && Engine.editor_hint:
		_spawn_element(element_scene)


func set_pathfind_scene(value:PackedScene):
	pathfind_scene = value


func set_generate_pathfind(value:bool):
	generate_pathfind = false
	if value && Engine.editor_hint:
		_spawn_element(pathfind_scene)


func _spawn_element(scene:PackedScene):
	var new_element = scene.instance()
	add_child(new_element)
	new_element.set_owner(get_tree().get_edited_scene_root())


## Execution on runtime
func _ready():
	if !Engine.editor_hint:
		call_deferred("_initialize")

func _initialize():
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	var pathfind = get_node(pathfind_path)
	for child in get_children():
		if child is Turret:
			child.pathfinding = pathfind
