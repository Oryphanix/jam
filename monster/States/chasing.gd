extends State
class_name EnemyChasing

@export var enemy: CharacterBody2D
@export var moveSpeed: float
var p 
var sop 

var player: CharacterBody2D


func Enter():
	#Animation
	p = get_parent()
	sop = p.get_node("../AnimatedSprite2D")
	#Update Global Var
	GlobalSceneData.enemyStateName = "chasing"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	Global.enemySpeed = 1.1*Global.playerSpeed
	player = get_tree().get_first_node_in_group("Player")
	sop.play("uber")
	
func Update(_delta: float):
	#If the player i hidhing then et tate to earching
	if Global.isPlayerhiding:
		SignalManager.transitioned.emit(self, "chasesearching")
	#if Global.sanity < (Global.maxSanity)/3:
	#	SignalManager.transitioned.emit(self, "uberchase")
	
func Physics_Update(_delta: float):
	moveSpeed = 1.1*Global.playerSpeed
	#Vars for distance to player
	var direction = Global.playerPosition - Global.enemyPosition
	#Move toward the player
	enemy.velocity = (direction.normalized() * moveSpeed)
	#Animation flipping
	if direction > Vector2(1,0):
		sop.flip_h = false
	else:
		sop.flip_h = true
