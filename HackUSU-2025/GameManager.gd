extends Node
var score_timer: Timer
var score = 0
var audio_stream_player_2d: AudioStreamPlayer2D
var timer: Timer
var animated_sprite_2d: AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func load_scene(game_scene_path):
	get_tree().change_scene_to_file(game_scene_path)
	if game_scene_path == "res://main.tscn":
		audio_stream_player_2d = $AudioStreamPlayer2D
		score_timer = $Score_Timer
		timer = $Timer
