extends Area2D

@onready var part = $part_moving/part

const CUTSCENE_23 = "res://Cutscene23/cutscene23.tscn"
const CUTSCENE_34 = "res://Cutscene34/cutscene34.tscn"
const CUTSCENEFINAL = "res://Cutscene Final/cutscene_final.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_meta("part") == "one":
		part.play("part1")
	elif get_meta("part") == "two":
		part.play("part2")
	elif get_meta("part") == "three":
		part.play("part3")

	
func _on_body_entered(body):
	if get_meta("part") == "one":
		switch_scene.switch_scene(CUTSCENE_23)
		PlayerStats.world = "World2"
	if get_meta("part") == "two":
		switch_scene.switch_scene(CUTSCENE_34)
		PlayerStats.world = "World3"
	if get_meta("part") == "three":
		switch_scene.switch_scene(CUTSCENEFINAL)
