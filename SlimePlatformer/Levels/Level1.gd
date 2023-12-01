extends Node2D

func _on_tube_1_body_entered(body):
	if body.is_in_group("Player"):
		body.change_tube()

func _on_tube_1_body_exited(body):
	if body.is_in_group("Player"):
		body.change_tube()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.gameOver()

func _on_fall_2_body_entered(body):
	if body.is_in_group("Player"):
		body.gameOver()

func _on_finish_body_entered(body):
	if body.is_in_group("Player"):
		get_node("/root/Game").load_next_scene()
