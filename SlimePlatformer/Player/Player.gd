extends CharacterBody2D

@export var speed = 200
@export var jump = 700
@export var gravity = 1200
@export var invincable = 100
@export var coins_to_lives = 20

var lives = 3
var coins = 0
var tube = false
var canHit = true
var time = 0

func _ready():
	$AnimationPlayer.play("Idle")
	
func _physics_process(delta):
	$CanvasLayer/Lives.text = str("Lives: ", lives)
	$CanvasLayer/Coins.text = str("Coins: ", coins)
	
	if not canHit:
		if time == 0:
			time = invincable
		if time == 1:
			canHit = true
		time -= 1
	
	if not is_on_floor():
		velocity.y += gravity*delta;
		if velocity.y > 2000:
			velocity.y = 2000
	
	if Input.is_key_pressed(KEY_D):
		if is_on_floor():
			$AnimationPlayer.play("Walk");
		velocity.x = speed;
	elif Input.is_key_pressed(KEY_A):
		if is_on_floor():
			$AnimationPlayer.play("Walk");
		velocity.x = -speed;
	elif is_on_floor():
		$AnimationPlayer.play("Idle")
		velocity.x = 0
	else:
		velocity.x = 0
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		$AnimationPlayer.play("Jump")
		velocity.y = -jump
		
	move_and_slide();
	
func add_coin():
	coins += 1
	if coins >= coins_to_lives:
		coins = 0
		lives += 1

func hit():
	if lives > 0 and canHit:
		lives -= 1
		canHit = false
	if lives <= 0:
		gameOver()
		
func gameOver():
	get_tree().reload_current_scene()
	
func change_tube():
	tube = !tube

func get_tube():
	return tube

func change_camera(amt):
	$Camera.limit_right = amt
