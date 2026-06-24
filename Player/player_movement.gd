extends CharacterBody2D

@onready var hearts_ui = $"../CanvasLayer/hearts UI"

const MAIN_MENU = "res://Main Menu/main_menu.tscn"

const TARGET_VELOCITY = 300.0
const ACCELERATION = 3000.0
const DECELLERATION = 3000.0

const JUMP_VELOCITY = -700.0
const ABILITY_VELOCITY = -200.0

var state = "idle"

var health = 3

var was_on_floor = true

var initialPosition = Vector2(-334,-139.0)

@onready var sprite = $Sprite

@onready var walking = $Walking
@onready var jetpack = $Jetpack

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
	
	var is_on_floor_before_move = is_on_floor()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
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

	#if direction: 
		#walking.playing = true
	#else:
		#walking.playing = false

	if direction: 
		velocity.x = move_toward(velocity.x, TARGET_VELOCITY * direction, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, DECELLERATION * delta)

	if Input.is_action_pressed("ability") && PlayerStats.disableAbility == false:
		velocity.y = ABILITY_VELOCITY
		state = "ability"

	move_and_slide()
	
	var is_on_floor_after_move = is_on_floor()
		
	if velocity.x > 0:
		sprite.flip_h = true
	elif velocity.x < 0:
		sprite.flip_h = false
		
	#if state == "ability":
		#jetpack.playing = true
	#else:
		#jetpack.playing = false
		
	if state == "ability":
		sprite.play("ability")

	elif not is_on_floor_before_move and is_on_floor_after_move:
		sprite.play("jump_fall")

	elif sprite.animation == "jump_fall" and sprite.is_playing():
		pass

	elif is_on_floor_before_move and not is_on_floor_after_move:
		sprite.play("jump_windup")

	elif not is_on_floor_after_move:
		if sprite.animation == "jump_windup" and sprite.is_playing():
			pass
		else:
			sprite.play("jump_hold") 
			
	elif state == "run left":
		sprite.play("run")
		
	elif state == "run right":
		sprite.play("run")
		
	elif state == "idle":
		sprite.play("idle")
		
	if Input.is_action_just_pressed("reset"):
		takedamage()
		
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
