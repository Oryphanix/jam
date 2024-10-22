extends CharacterBody2D

const ACCELERATION = 900
const FRICTION = 500
const MAX_SPEED = 200

const RUNACCELERATION  = 1200
const RUN_MAX_SPEED = 400



extends CharacterBody2D

const ACCELERATION = 900
const FRICTION = 500
const MAX_SPEED = 200

const RUNACCELERATION  = 1200
const RUN_MAX_SPEED = 400





func _physics_process(delta):
	var input_vector = Input.get_axis("move_left", "move_right")
	if input_vector == 1:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("default")
	elif input_vector == -1:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("idle")
	
	
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity.y = 0
		
	if Input.is_action_pressed("ui_shift"):
		runMove(delta, input_vector)
	else:
		move(delta, input_vector)
	Global.playerPosition = self.global_position
	Global.playerSpeed = MAX_SPEED

func runMove(delta, input_vector):
	if input_vector == 0:
		apply_friction(FRICTION * delta)
	else:
		apply_run_movement(input_vector * RUNACCELERATION * delta)
	move_and_slide()


func move(delta, input_vector):
	if input_vector == 0:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(input_vector * ACCELERATION * delta)
	move_and_slide()

func apply_run_movement(amount) -> void:
	velocity += Vector2(amount,0)
	velocity = velocity.limit_length(RUN_MAX_SPEED)
	
func apply_movement(amount) -> void:
	velocity += Vector2(amount,0)
	velocity = velocity.limit_length(MAX_SPEED)

func apply_friction(amount) -> void:
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
		
func _process(_delta: float) -> void:
	$Camera2D.make_current()

