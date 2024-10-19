extends State
class_name EnemyFollow

#PLACEHOLDER BEHAVIOUR

@export var enemy: CharacterBody2D
@export var moveSpeed := 40
@export var moveAway := 100
@export var bufferZone := 5.0
@export var minDistance := 250
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("entered follow")
	
func Physics_Update(_delta: float):
	#Modify
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	if distance < 500 and distance >= minDistance + bufferZone:
		enemy.velocity = (direction.normalized() * moveSpeed)
	elif distance > 500:
		print("too far away, wamdering")
		Transitioned.emit(self, "lurking")
	elif distance < minDistance - bufferZone:
		enemy.velocity = -(direction.normalized() * moveAway)
	else:
		enemy.velocity = Vector2.ZERO
	enemy.move_and_slide()
	print(enemy.velocity.length())
