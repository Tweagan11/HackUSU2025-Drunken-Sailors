extends Node

@export var rock_scene: PackedScene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_rock() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit(damage):
	pass

func spawn_rock() :
	var rock = rock_scene.instantiate()
	add_child(rock)


func _on_timer_timeout() -> void:
	spawn_rock() # Replace with function body.
