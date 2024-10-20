extends CharacterBody2D

@export var SPEED = 200.0
@export var argument = false

const JUMP_VELOCITY = -400.0

#Variable for globalisation of player position
var playerPosition: Vector2
var sanity: float

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down") or argument:
		SPEED = 1100
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 300)
		print (SPEED)
		move_and_slide()
		argument = true
		if Input.is_action_just_released("ui_down"):
			argument = false
	else:
		SPEED = 200
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 200)
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity.y = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	move_and_slide()
	Global.playerPosition = self.global_position


func _process(delta: float) -> void:
	#Add sanity here using, please update Global.sanity 
	pass
