extends Node2D

var startPosition = Vector2()
@onready var part = $part

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	startPosition = position
	
	var tween = get_tree().create_tween()

	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($".", "position", startPosition + Vector2(0, -20), 1)
	tween.tween_property($".", "position", startPosition + Vector2(0, 20), 1)
