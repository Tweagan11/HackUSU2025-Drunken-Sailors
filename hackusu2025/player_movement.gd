class_name PlayerMovement extends CharacterBody2D

var speed = 3000.0
@onready var direction = Vector2.ZERO
@onready var timer: Timer = $"../Timer"
@onready var ui_manager: Control = $"../UI_Manager"
@onready var sprite_2d: Sprite2D = $Sprite2D

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
