extends Node
var score_timer: Timer
var score = 0

# Called when the node enters the scene tree for the first time.
func load_scene(game_scene_path):
	get_tree().change_scene_to_file(game_scene_path)
	score_timer = $Score_Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
