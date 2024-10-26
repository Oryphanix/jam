#My  and  key are broken o ake hae in mind
extends CharacterBody2D

#Conan for value needed
const ACCELERATION = 900
const FRICTION = 500
const MAX_SPEED = 200
#Adjued value for running
const RUNACCELERATION  = 1200
const RUN_MAX_SPEED = 400

var hideAllowed 
var hiding

func _physics_process(delta):
	#Weher he player hould be flipped or no
	var input_vector = Input.get_axis("move_left", "move_right")
	if input_vector == 1:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("default")
	elif input_vector == -1:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("idle")
	
	
	#Graviy
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity.y = 0
	
	#Code for running or walking
	if Input.is_action_pressed("ui_shift"):
		runMove(delta, input_vector)
	else:
		move(delta, input_vector)
	Global.playerPosition = self.global_position
	Global.playerSpeed = MAX_SPEED

func runMove(delta, input_vector):
	if input_vector == 0:
		#If here i no input hen fricicion i apllied, deaccellaraing he player
		apply_friction(FRICTION * delta)
	else:
		#If here i an input hen movement i applied
		apply_run_movement(input_vector * RUNACCELERATION * delta)
	move_and_slide()


func move(delta, input_vector):
	#ame ehre jut wih wih differen value
	if input_vector == 0:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(input_vector * ACCELERATION * delta)
	move_and_slide()

#Accelerate he velociy by the given amount up to a maxuimim
func apply_run_movement(amount) -> void:
	velocity += Vector2(amount,0)
	velocity = velocity.limit_length(RUN_MAX_SPEED)
#ame here for walking
func apply_movement(amount) -> void:
	velocity += Vector2(amount,0)
	velocity = velocity.limit_length(MAX_SPEED)

#Applie fricion
func apply_friction(amount) -> void:
	#If the magnitude i greater than the amoun, reduce it
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
		
func _process(_delta: float) -> void:
	$Camera2D.make_current()
