extends Node2D

var ROCK_SPEED = 30
var ROCK_SIZE = 32
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screenSizeX = get_viewport().get_visible_rect().size.x
	var pos_x = rng.randi_range(0, screenSizeX)
	var pos_y = rng.randi_range(-32, -48)
	position = Vector2(pos_x, pos_y)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += ROCK_SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
