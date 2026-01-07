extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	text = "SCORE: " + str(GameManager.score)
	GameManager.score = 0
