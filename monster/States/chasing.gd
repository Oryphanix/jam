#To Add
extends State
class_name EnemyChasing

@export var enemy: CharacterBody2D
@export var moveSpeed: float

var player: CharacterBody2D


func Enter():
	GlobalSceneData.enemyState = "chasing"
	player = get_tree().get_first_node_in_group("Player")
	print("chasing")
	
func Update(_delta: float):
	#Add detection whether the player is hidden, and if so new state "chase search"
	pass
	
func Physics_Update(_delta: float):
	moveSpeed = 1.1*Global.playerSpeed
	#Vars for distance to player
	var direction = Global.playerPosition - Global.enemyPosition
	enemy.velocity = (direction.normalized() * moveSpeed)
