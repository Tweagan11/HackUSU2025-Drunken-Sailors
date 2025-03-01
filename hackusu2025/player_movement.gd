class_name PlayerMovement extends CharacterBody2D

var speed = 3000.0
@onready var direction = Vector2.ZERO
@onready var timer: Timer = $"../Timer"

var p1_move = Vector2.ZERO
var p2_move = Vector2.ZERO

var global_delta

func _physics_process(delta):
	global_delta = delta
	set_move()
	move_and_slide()



func set_move():
	if(Input.is_action_pressed("p1_down")):
		p1_move = Vector2(0, 1)
	elif(Input.is_action_pressed("p1_up")):
		p1_move = Vector2(0, -1)
	elif(Input.is_action_pressed("p1_left")):
		p1_move = Vector2(-1, 0)
	elif(Input.is_action_pressed("p1_right")):
		p1_move = Vector2(1, 0)
		
	if(Input.is_action_pressed("p2_down")):
		p2_move = Vector2(0, 1)
	elif(Input.is_action_pressed("p2_up")):
		p2_move = Vector2(0, -1)
	elif(Input.is_action_pressed("p2_left")):
		p2_move = Vector2(-1, 0)
	elif(Input.is_action_pressed("p2_right")):
		p2_move = Vector2(1, 0)
	

func move(delta):
	if p1_move == p2_move:
		p1_move *= 3
	direction = p1_move + p2_move
	velocity.x = direction.x * speed * delta
	velocity.y = direction.y * speed * delta


func _on_timer_timeout() -> void:
	print("timeout")
	move(global_delta)
