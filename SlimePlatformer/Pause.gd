extends Control

var timer = 50

func _ready():
	get_tree().paused = true
	
func _process(delta):
	if timer > 0:
		timer -= 1;
	
	if Input.is_key_pressed(KEY_ESCAPE) and timer == 0:
		_on_resume_pressed()

func _on_resume_pressed():
	get_node("/root/Game").set_timer()
	get_tree().paused = false
	queue_free()

func _on_quit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
