extends Control

@onready var w: Button = $P1_UI/W
@onready var a: Button = $P1_UI/A
@onready var s: Button = $P1_UI/S
@onready var d: Button = $P1_UI/D
@onready var up: Button = $P2_UI/Up
@onready var left: Button = $P2_UI/Left
@onready var down: Button = $P2_UI/Down
@onready var right: Button = $P2_UI/Right

var p1_buttons
var p2_buttons
var button_dict

func _ready() -> void:
	p1_buttons = [w, a, s, d]
	p2_buttons = [up, left, down, right]
	
	button_dict = {Vector2(0, -1) : 0, Vector2(-1, 0) : 1, Vector2(0, 1) : 2, Vector2(1, 0) : 3}

func set_buttons(p1:Vector2, p2:Vector2):
	reset_buttons()
	if p1 != Vector2.ZERO:
		p1_buttons[button_dict[p1]].set_pressed_no_signal(true)
	if p2 != Vector2.ZERO:
		p2_buttons[button_dict[p2]].set_pressed_no_signal(true)
	
func reset_buttons():
	for button in p1_buttons:
		button.set_pressed_no_signal(false)
	for button in p2_buttons:
		button.set_pressed_no_signal(false)
