extends AnimatedSprite2D

var void_world = "res://World2/world2.tscn"

var current_scene = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("next_scene"):
		if current_scene < 9:
			current_scene += 1
		else:
			switch_scene.switch_scene(void_world)

		self.set_frame_and_progress(current_scene, 0.0)
