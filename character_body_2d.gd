extends CharacterBody2D
var my_callable = Callable(self, " _on_item_picked_up")

@export var runSanity = false
@export var argument = false

const JUMP_VELOCITY = -600.0
@export var SPEED = 300.0
#variables

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_shift") or argument:
		SPEED = 1100
		runSanity = true
		
		var direction := Input.get_axis("ui_left", "ui_right")
#if shift key is held down, and left/right arrow is pressed, the character runs left/right

		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 300)
	
		
		move_and_slide()
		argument = true
		if Input.is_action_just_released("ui_shift"):
			argument = false
#code for if the shift key is released, the character will stop running
	else:
		SPEED = 300.0
		
		runSanity = false
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 300)
		#otherwise the character will walk left/right if the shift key is not held
		move_and_slide()
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# ui_left is left arrow, ui_right is right arrow, ui_accept is space bar, ui_shift is the shift key.
