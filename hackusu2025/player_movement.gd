class_name PlayerMovement extends CharacterBody2D

var speed = 30000.0

func _physics_process(delta):
	move(delta)

func move(delta):
	var direction = Vector2.ZERO
	
	if(Input.is_action_pressed("down")):
		direction.y += 1
	if(Input.is_action_pressed("up")):
		direction.y -= 1
	if(Input.is_action_pressed("left")):
		direction.x -= 1
	if(Input.is_action_pressed("right")):
		direction.x += 1
	direction = direction.normalized()
		
	velocity.x = direction.x * speed * delta
	velocity.y = direction.y * speed * delta
	
	move_and_slide()
