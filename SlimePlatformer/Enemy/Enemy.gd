extends Area2D

@export var speed = 100
@export var dir : Vector2

var start : Vector2
var target : Vector2

func _ready():
	start = global_position
	target = start+dir
	$AnimationPlayer.play("IdleRight")

func _process(delta):
	global_position = global_position.move_toward(target, speed*delta)
	
	if target < global_position:
		$AnimationPlayer.play("WalkLeft")
	else:
		$AnimationPlayer.play("WalkRight")
	
	if global_position == target:
		if global_position == start:
			target = start + dir
		else:
			target = start

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.hit()
