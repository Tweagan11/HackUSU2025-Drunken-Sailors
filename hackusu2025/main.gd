extends Node

@export var rock_scene: PackedScene
@export var rock_scene2: PackedScene
@export var rock_scene3: PackedScene
@export var rock_scene4: PackedScene
@export var rock_scene5: PackedScene
@export var rock_scene6: PackedScene
var rock_list = []
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var expl_sound: AudioStreamPlayer2D = $ExplosionSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rock_list = [rock_scene, rock_scene2, rock_scene3, rock_scene4, rock_scene5, rock_scene6]
	spawn_rock()
	audio_stream_player_2d.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_rock() :
	var rock = rock_list.pick_random().instantiate()
	add_child(rock)

func _on_timer_timeout() -> void:
	spawn_rock() # Replace with function body.

func _on_ship_death() -> void:
	audio_stream_player_2d.stop()
	expl_sound.play()
