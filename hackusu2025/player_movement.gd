class_name PlayerMovement extends CharacterBody2D
signal death
signal hit

var speed = 3000.0
@onready var direction = Vector2.ZERO
@onready var timer: Timer = $"../Timer"
@onready var ui_manager: Control = $"../UI_Manager"
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hf_anim: AnimationPlayer = $AnimationPlayer
@onready var score_timer: Timer = $"../Score_Timer"

var ROCK_SIZE = 50

var hit_bool = false

var p1_move = Vector2.ZERO
var p2_move = Vector2.ZERO

var global_delta

func _physics_process(delta):
	global_delta = delta
	set_move()
	move_and_slide()
	update_sprite()
	
	position.x = wrapf(position.x, 0 - sprite_2d.texture.get_size().x / 2, get_viewport_rect().size.x + sprite_2d.texture.get_size().x / 2)
	position.y = wrapf(position.y, 0 - sprite_2d.texture.get_size().y / 2, get_viewport_rect().size.y + sprite_2d.texture.get_size().y / 2)
	
func update_sprite():
	look_at(global_position + direction.rotated(PI / 2))

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
	
	ui_manager.set_buttons(p1_move.normalized(), p2_move.normalized())

func move(delta):
	if p1_move == p2_move:
		p1_move *= 2
	direction = p1_move + p2_move
	velocity.x = direction.x * speed * delta
	velocity.y = direction.y * speed * delta
	p1_move = p1_move.normalized()
	p2_move = p2_move.normalized()
	ui_manager.reset_buttons()

func _on_timer_timeout() -> void:
	move(global_delta)

func bounce_ship(body):
	if (abs(velocity.x) == 1 || velocity.y == 1):
		if (abs(velocity.x) == 1):
			velocity.y = velocity.x
			velocity = velocity.normalized()
			move_and_slide()
			
		else:
			velocity.x == velocity.y
			velocity = velocity.normalized()
			move_and_slide()
		return
	
	# Check if Ship is Lower or Higher Than Rock
	if (abs(body.position.y - position.y) < ROCK_SIZE):
		velocity.y *= -1
		move_and_slide()
		
	# Else Ship is Left or Right of the Rock
	else:
		velocity.y *= -1
		move_and_slide()


func _on_hit_detector_body_entered(body: Node2D) -> void:
	if body.name != "Ship" or hit_bool == false:
		hit_bool = true
		hit.emit()
		$HealthManager.hp -= 1
		bounce_ship(body)
		hf_anim.play("hit_flash")
		if ($HealthManager.hp <= 0):
			print("emitting death!")
			death.emit()

func _on_death() -> void:
	#Shake Screen
	print("death emitted!")
	hf_anim.play("hit_flash")
	hf_anim.play("hit_flash")
	hf_anim.play("hit_flash")
	score_timer.stop()
	await get_tree().create_timer(2.0).timeout
	velocity.x *= .1
	velocity.y *= .1
	GameManager.load_scene("res://game_over.tscn")
