extends State
class_name EnemyLurking

@export var en: CharacterBody2D
@export var sanityLoss := 500
var player: CharacterBody2D
var p 
var sop 

func randCirlePos() -> Vector2:
	var theta : float = randf() * 2 * PI
	return Vector2(cos(theta), sin(theta)) * sqrt(randf())


func Enter():
	GlobalSceneData.enemyStateName = "lurking"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	player = get_tree().get_first_node_in_group("Player")
	var randomPos: Vector2
	randomPos = (randCirlePos()*167.5)+Global.playerPosition
	while !(randomPos.y < 0 and randomPos.y > -92):
		randomPos = (randCirlePos()*Global.playerFOV)+Global.playerPosition
	en.global_position = randomPos
	p = get_parent()
	sop = p.get_node("../AnimatedSprite2D")
	sop.play("lurk")
	sop.frame = 1
	sop.stop()
	en.show()
	
	
func Update(_delta: float):
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()

	if Global.sanity <= (2*Global.maxSanity)/3 and Global.sanity > (Global.maxSanity)/3:
		SignalManager.transitioned.emit(self, "stalking")
	if distance > 167.5:

		SignalManager.transitioned.emit(self, "prelurking")
	elif distance < 44:
		sop.frame = 0 
		sop.play("lurk")
		Global.sanity -= sanityLoss
		SignalManager.transitioned.emit(self, "prelurking")
	
	#Check distance to player
		#if is more than 167 then set state to pre lurk
	#if is less than hitbox of monster, decrease sanity set state to prelurk
	
func Physics_Update(_delta: float):
	pass
