extends Area2D

const VOID_CUTSCENE = "res://Void Cutscene/void_cutscene.tscn"

@onready var player = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	player.funcDisableAbility()
	PlayerStats.world = "World2"
	switch_scene.switch_scene(VOID_CUTSCENE)
	
