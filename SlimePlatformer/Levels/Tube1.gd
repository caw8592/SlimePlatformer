extends Node2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.change_tube()

func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		body.change_tube()
