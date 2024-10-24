extends State
class_name stalkarchive

#PLACEHOLDER BEHAVIOUR

@export var enemy: CharacterBody2D
@export var moveSpeed: float
@export var moveAway: float
@export var bufferZone := 5.0
@export var minDistance := 125
@export var playerFacing = false
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("entered stalk")
	
func Physics_Update(_delta: float):
	moveSpeed = 7*Global.playerSpeed/20
	moveAway = 9*Global.playerSpeed/20
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

func Update(_delta: float):
	var playerDir  = Global.playerPosition.direction_to(Global.enemyPosition)
	if Global.sanity <= Global.maxSanity/3:
		Transitioned.emit(self, "chasing")
	if playerDir.dot(Global.playerFace) > 0:
		playerFacing = true
	else:
		playerFacing = false
	
	if playerFacing and $Timer.is_stopped():
		print("timer started")
		$Timer.start()
	elif not playerFacing:
		print("timer stopped")
		$Timer.stop()


func _on_timer_timeout():
	print("timer")
	Transitioned.emit(self, "stalkchase")
