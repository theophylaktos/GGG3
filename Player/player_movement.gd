extends CharacterBody2D

@onready var hearts_ui = $"../CanvasLayer/hearts UI"

const MAIN_MENU = "res://Main Menu/main_menu.tscn"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ABILITY_VELOCITY = -200.0

var state = "idle"

var health = 3



var initialPosition = Vector2(-334,-384)

@onready var sprite = $Sprite

func _ready():
	if PlayerStats.world == "World1":
		hearts_ui.play("World1_Health3")
	if PlayerStats.world == "World2":
		hearts_ui.play("World2_Health3")
	if PlayerStats.world == "World3":
		hearts_ui.play("World3_Health3")
	if PlayerStats.world == "World4":
		hearts_ui.play("World4_Health3")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		state = "jump"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction
	if Input.is_action_pressed("right"):
		direction = 1
		state = "run right"
		
	elif Input.is_action_pressed("left"):
		direction = -1
		state = "run left"
		
	else:
		direction = 0
		state = "idle"

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_pressed("ability") && PlayerStats.disableAbility == false:
		velocity.y = ABILITY_VELOCITY
		state = "ability"

	move_and_slide()
	
	if state == "ability":
		pass
	elif state == "jump":
		sprite.play("jump")
	elif state == "run left":
		sprite.play("run")
		sprite.flip_h = false
	elif state == "run right":
		sprite.play("run")
		sprite.flip_h = true
	elif state == "idle":
		sprite.play("idle")
	
func takedamage():
	print(health)
	position = initialPosition
	health -= 1
	if PlayerStats.world == "World1":
		if health <= 0:
			die()
		elif health == 2:
			hearts_ui.play("World1_Health2")
		elif health == 1: 
			hearts_ui.play("World1_Health1")
			
	if PlayerStats.world == "World2":
		if health <= 0:
			die()
		elif health == 2:
			hearts_ui.play("World2_Health2")
		elif health == 1: 
			hearts_ui.play("World2_Health1")
			
	if PlayerStats.world == "World3":
		if health <= 0:
			die()
		elif health == 2:
			hearts_ui.play("World3_Health2")
		elif health == 1: 
			hearts_ui.play("World3_Health1")
			
	if PlayerStats.world == "World4":
		if health <= 0:
			die()
		elif health == 2:
			hearts_ui.play("World4_Health2")
		elif health == 1: 
			hearts_ui.play("World4_Health1")

	
func die():
	switch_scene.switch_scene(MAIN_MENU)


func _on_death_body_entered(_body):
	takedamage()


func _on_hurtbox_body_entered(body):
	takedamage()

func funcDisableAbility():
	PlayerStats.disableAbility = true
