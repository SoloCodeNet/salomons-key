extends KinematicBody2D

onready var cursor = $cursor 
var dir: Vector2
var vel: Vector2
var speed: = 50
var action1: = false
var action2: = false
var jump:  = false
var down:  = false

signal action_1(posi)
	
func _process(delta: float) -> void:
	input_loop()
	anim_loop()
	vel.x = dir.x * speed
	if jump && is_on_floor():
		vel.y = -150
	vel.y += 10
	if !action1:
		vel = move_and_slide(vel, Vector2.UP)
	else: 
		emit_signal("action_1", cursor.global_position)
		
func input_loop():
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left") # left right
	action1 = Input.is_action_just_pressed("action1") # touche x
	action2 = Input.is_action_just_pressed("action2") # touche c
	jump  = Input.is_action_just_pressed("up") #touche up
	down  = Input.is_action_pressed("down") #touche down
	
func anim_loop():
	if dir != Vector2.ZERO:
		cursor.position.x = dir.x * 16
	cursor.position.y =16 if down else 0
	if dir.x == -1:
		$Sprite.flip_h = true
	if dir.x == 1:
		$Sprite.flip_h = false
	$Sprite.frame = 4 if down else 0
