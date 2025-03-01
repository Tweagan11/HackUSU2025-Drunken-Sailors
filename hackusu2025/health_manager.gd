extends Node

@export var hp = 3

func lose_hp():
	hp -= 1
	if hp == 0:
		$"../".queue_free()
