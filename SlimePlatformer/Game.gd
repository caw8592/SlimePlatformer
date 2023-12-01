extends Node2D

var level = 1
var menu_timer = 0

var start = Vector2(550,550)
var back1 = Vector2(5424,494)

func _physics_process(delta):
	if menu_timer > 0:
		menu_timer -= 1;
	
	if $Player.get_tube() and Input.is_key_pressed(KEY_S):
		if level == 1:
			load_tube_scene1()
		elif level == 50:
			level = 1
			ret_scene()
		
	if Input.is_key_pressed(KEY_ESCAPE) and menu_timer == 0:
		var pause = load("res://Pause.tscn").instantiate()
		get_node("/root/Game/Player").add_child(pause)
		
func load_next_scene():
	$Level.queue_free()
	get_node("/root/Game").remove_child($Level)
	level += 1
	var next_level_path = "res://Levels/Level" + str(level) + ".tscn"
	var next_level = load(next_level_path).instantiate()
	get_node("/root/Game").add_child(next_level)
	next_level.set_name("Level")
	get_node("/root/Game").move_child(next_level, 0)
	$Player.position = start
	
func load_tube_scene1():
	$Level.queue_free()
	get_node("/root/Game").remove_child($Level)
	var next_level_path = "res://Levels/Tube" + str(level) + ".tscn"
	var next_level = load(next_level_path).instantiate()
	get_node("/root/Game").add_child(next_level)
	next_level.set_name("Level")
	get_node("/root/Game").move_child(next_level, 0)
	$Player.position = Vector2(130,498)
	$Player.change_camera(1468)
	level = 50
	
func ret_scene():
	level -= 1
	load_next_scene() 
	$Player.position = back1
	$Player.change_camera(6015)

func set_timer():
	menu_timer = 50;
