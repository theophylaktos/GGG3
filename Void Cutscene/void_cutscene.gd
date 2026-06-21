extends Node2D

var void_world = "res://Void World/void_world.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(5.0).timeout
	switch_scene.switch_scene(void_world)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
