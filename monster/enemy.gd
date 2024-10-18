class_name enemy extends CharacterBody2D
@export var AGGRO: int = 0
@export var SPEED = 300.0
var playerPosition: Vector2
var enemyPosition: Vector2
func _physics_process(delta: float):
	playerPosition = Global.playerPosition
	Global.enemyPosition = self.global_position
	enemyPosition = Global.enemyPosition
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var directionToPlayer = (enemyPosition).direction_to(playerPosition)
	var distanceToPlayer = ((enemyPosition)*delta-(playerPosition*delta)).length()
	print("enemypos", enemyPosition)
	print("player pos", playerPosition)
	print(distanceToPlayer)
	#Checks and Determines behaviour on var, "AGGRO"
	if  0 <= AGGRO and AGGRO <= 30:
		if distanceToPlayer > 100:
			pass
		#Have it move towards towards player at slow rate
		#If player is looking, freeze and set opacity to ike 20%
		#If distance to player is > ARB_10 then move at slow rate
		pass
	elif 30 < AGGRO and AGGRO <= 70:
		pass
	elif 70 < AGGRO and AGGRO <= 100:
		pass

	
	
	move_and_slide()
