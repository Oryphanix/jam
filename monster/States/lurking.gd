extends State
class_name EnemyLurking

@export var enemy: CharacterBody2D
@export var moveSpeed: float
@export var moveAway: float
@export var bufferZone := 5.0
@export var minDistance := 250
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("lurking")
	
func Update(_delta: float):
	if Global.sanity <= (2*Global.maxSanity)/3 and Global.sanity > (Global.maxSanity)/3:
		Transitioned.emit(self, "stalking") 
	
func Physics_Update(_delta: float):
	moveSpeed = Global.playerSpeed/5
	moveAway = Global.playerSpeed/2
	#Vars for distance to player
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
