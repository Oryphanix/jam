extends CharacterBody2D

@export var SPEED = 200.0
const JUMP_VELOCITY = -400.0
#Variable for globalisation of player position
var playerPosition: Vector2
var sanity: float

func _physics_process(delta: float) -> void:	
	#Sets the global player position to the position
	Global.playerPosition = self.global_position
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity.y = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practie, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	playerPosition = self.global_position


func _process(delta: float) -> void:
	#Add sanity here using, please update Global.sanity 
	pass
