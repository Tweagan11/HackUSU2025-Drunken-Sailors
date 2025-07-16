extends Sprite2D

var hearts_4 = preload("res://Sprites/3_hearts.png")
var hearts_3 = preload("res://Sprites/3_hearts.png")
var hearts_2 = preload("res://Sprites/2_hearts.png")
var hearts_1 = preload("res://Sprites/1_heart.png")
var hearts_0 = preload("res://Sprites/0_hearts.png")

var hearts = [hearts_4, hearts_3, hearts_2, hearts_1, hearts_0]
var index = 0

func _on_ship_hit() -> void:
	index += 1
	if index > 4:
		index = 4
	texture = hearts[index]
