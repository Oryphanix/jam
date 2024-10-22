#To Add
extends State
class_name EnemyChasing

@export var enemy: CharacterBody2D
@export var moveSpeed: float

var player: CharacterBody2D


func Enter():
	GlobalSceneData.enemyStateName = "chasing"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	Global.enemySpeed = 1.1*Global.playerSpeed
	player = get_tree().get_first_node_in_group("Player")
	
func Update(_delta: float):
	if Global.isPlayerhiding:
		SignalManager.transitioned.emit(self, "chasesearching")
	if Global.sanity < (Global.maxSanity)/3:
		SignalManager.transitioned.emit(self, "uberchase")
	
func Physics_Update(_delta: float):
	moveSpeed = 1.1*Global.playerSpeed
	#Vars for distance to player
	var direction = Global.playerPosition - Global.enemyPosition
	enemy.velocity = (direction.normalized() * moveSpeed)
