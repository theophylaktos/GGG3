extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ABILITY_VELOCITY = -200.0

var world = preload("uid://hgy67euwbl1n")
@onready var sprite = $Sprite

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction
	if Input.is_action_pressed("right"):
		direction = 1
		sprite.flip_h = true
		sprite.play()
		
	elif Input.is_action_pressed("left"):
		direction = -1
		sprite.flip_h = false
		sprite.play()
		
	else:
		direction = 0
		sprite.pause()

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_pressed("ability"):
		velocity.y = ABILITY_VELOCITY

	move_and_slide()
	
