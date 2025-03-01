extends Node2D

var ROCK_SPEED = 50
var ROCK_SIZE = 32
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screenSizeX = get_viewport().get_visible_rect().size.x
	var pos_x = rng.randi_range(0, screenSizeX)
	var pos_y = rng.randi_range(-32, -48)
	position = Vector2(pos_x, pos_y)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += ROCK_SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	# Check if Ship is Lower or Higher Than Rock
	if (abs(position.y - body.position.y) < ROCK_SIZE):
		body.velocity.y *= -1
		
	# Else Ship is Left or Right of the Rock
	else:
		body.velocity.x *= -1
	
