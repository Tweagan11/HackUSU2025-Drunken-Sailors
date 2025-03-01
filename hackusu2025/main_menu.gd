extends Control

@onready var water_sound: AudioStreamPlayer2D = $water_sounds


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	water_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
