extends Node

const END_VAL = 1

var is_active = false
var time_start
var duration_ms
var start_value

func start(duration = 0.4, strength = 0.9):
	time_start = Time.get_ticks_msec()
	duration_ms = duration * 1000
	start_value = 1 - strength
	Engine.time_scale = start_value
	is_active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active:
		var current_time = Time.get_ticks_msec() - time_start
		var value = circl_ease_in(current_time, start_value, END_VAL, duration_ms)
		if current_time >= duration_ms:
			is_active = false
			value = END_VAL
		Engine.time_scale = value


func circl_ease_in(t,b,c,d):
	t /= d
	return -c * (sqrt(1 - t * t) - 1) + b
