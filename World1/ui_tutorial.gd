extends Node2D
@onready var ui_directions = $"ui-directions"
@onready var ui_ability = $"ui-ability"
# Called when the node enters the scene tree for the first time.
func _ready():
	ui_directions.visible = true
	ui_ability.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ability_tutorial_ui_activate_body_entered(_body):
	ui_directions.visible = false
	ui_ability.visible = true
