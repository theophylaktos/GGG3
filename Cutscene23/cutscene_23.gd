extends AnimatedSprite2D

var next_world = "res://World3/world3.tscn"

var current_scene = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("next_scene"):
		if current_scene < 1:
			current_scene += 1
		else:
			switch_scene.switch_scene(next_world)

		self.set_frame_and_progress(current_scene, 0.0)
