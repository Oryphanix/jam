class_name enemy extends CharacterBody2D
@export var AGGRO: int = 0
@export var SPEED = 300.0

func _physics_process(delta: float) -> void:
	var enemyPosition: Vector2 = self.global_position
	var playerPosition: Vector2 = Vector2(2,2)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#var directionToPlayer = enemyPosition.direction_to(playerPosition)
	#Checks and Determines behaviour on var, "AGGRO"
	if  0 <= AGGRO and AGGRO <= 30:
		#Have it move towards towards player at slow rate
		#If player is looking, freeze and set opacity to ike 20%
		#If distance to player is > ARB_10 then move at slow rate
		pass
	elif 30 < AGGRO and AGGRO <= 70:
		pass
	elif 70 < AGGRO and AGGRO <= 100:
		pass

	
	
	move_and_slide()
func _on_player_position_change(player_new_pos) -> void:
	pass
