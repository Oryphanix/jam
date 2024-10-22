extends State
class_name EnemyUberChasing

@export var enemy: CharacterBody2D
@export var moveSpeed: float

var player: CharacterBody2D


func Enter():
	GlobalSceneData.enemyStateName = "uberchasing"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	Global.enemySpeed = 1.4*Global.playerSpeed
	player = get_tree().get_first_node_in_group("Player")
	
func Update(_delta: float):
	pass
	
	
func Physics_Update(_delta: float):
	moveSpeed = 1.4*Global.playerSpeed
	#Vars for distance to player
	var direction = Global.playerPosition - Global.enemyPosition
	enemy.velocity = (direction.normalized() * moveSpeed)
