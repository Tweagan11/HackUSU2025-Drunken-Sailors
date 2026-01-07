extends Camera2D

@export var decay = 0.8
@export var max_offset = Vector2(100,75)
@export var max_roll = 0.1
@export var follow_node: Node2D


var trauma = 0.0
var trauma_pow = 2



func shake():
	var amount = pow(trauma, trauma_pow)
	rotation = max_roll * amount * randf_range(-1,1)
	offset.x = max_offset.x * amount * randf_range(-1,1)
	offset.y = max_offset.y * amount * randf_range(-1,1)
	
func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if follow_node:
		global_position = follow_node.global_position
	
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()


func _on_ship_death() -> void:
	trauma = 0.3
	shake() # Replace with function body.
