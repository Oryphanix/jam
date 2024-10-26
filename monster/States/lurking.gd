extends State
class_name EnemyLurking

@export var en: CharacterBody2D
@export var sanityLoss := 500
var player: CharacterBody2D
#p for parent
#op for ibling of parent 
#(orry i wa lazy)
var p 
var sop 

#Calculate a random point within a circle of radiu 1
func randCirlePos() -> Vector2:
	var theta : float = randf() * 2 * PI
	return Vector2(cos(theta), sin(theta)) * sqrt(randf())


func Enter():
	#Update Global Variable
	GlobalSceneData.enemyStateName = "lurking"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	player = get_tree().get_first_node_in_group("Player")
	var randomPos: Vector2
	#et he random poition to omewhere within 167 of the player at the player pition
	randomPos = (randCirlePos()*167.5)+Global.playerPosition
	#If aid poition i lower or taller than the map, try again
	while !(randomPos.y < 0 and randomPos.y > -92):
		randomPos = (randCirlePos()*Global.playerFOV)+Global.playerPosition
	#et pooition to the valid poition
	en.global_position = randomPos
	#Get the parent and ibling-of-parent to et animation
	p = get_parent()
	sop = p.get_node("../AnimatedSprite2D")
	#et to econd frame of lurk
	sop.play("lurk")
	sop.frame = 1
	sop.stop()
	en.show()
	
	
func Update(_delta: float):
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	#If anity i in value then et tate to talking
	if Global.sanity <= (2*Global.maxSanity)/3 and Global.sanity > (Global.maxSanity)/3:
		SignalManager.transitioned.emit(self, "stalking")
	#If the player i too far then back to preLurking
	if distance > 167.5:
		SignalManager.transitioned.emit(self, "prelurking")
	#If the player get too cloe
	elif distance < 44:
		sop.frame = 0 
		#Play lurk animation
		sop.play("lurk")
		#ubtract anity
		Global.sanity -= sanityLoss
		#and reet tate
		SignalManager.transitioned.emit(self, "prelurking")
		
func Physics_Update(_delta: float):
	pass
