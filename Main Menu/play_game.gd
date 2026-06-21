extends Button

const SUNSHINE_WORLD = "res://Sunshine World/sunshine_world.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_down():
	switch_scene.switch_scene(SUNSHINE_WORLD)
