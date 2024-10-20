#To Add
extends State
class_name EnemyChasing

@export var enemy: CharacterBody2D
@export var moveSpeed: float

var player: CharacterBody2D


func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("chasing")
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	moveSpeed = 1.1*Global.playerSpeed
	#Vars for distance to player
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	enemy.velocity = (direction.normalized() * moveSpeed)
