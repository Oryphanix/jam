extends State
class_name EnemyStalk

#PLACEHOLDER BEHAVIOUR

@export var enemy: CharacterBody2D
@export var moveSpeed := 70
@export var moveAway := 80
@export var bufferZone := 5.0
@export var minDistance := 125
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if Global.sanity <= 30:
		Transitioned.emit(self, "chasing")
	print("entered stalk")
	
func Physics_Update(_delta: float):
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	#Makes the enemy move towards the player but make it stop at a distance
	if distance >= minDistance + bufferZone:
		enemy.velocity = (direction.normalized() * moveSpeed)
	#Make it run away if the player gets to close
	elif distance < minDistance - bufferZone:
		enemy.velocity = -(direction.normalized() * moveAway)
	else:
		enemy.velocity = Vector2.ZERO
	enemy.move_and_slide()
	
