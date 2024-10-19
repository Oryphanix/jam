#To Add
extends State
class_name EnemyChasing

@export var enemy: CharacterBody2D
@export var moveSpeed := 10.0

var player: CharacterBody2D


func Enter():
	player = get_tree().get_first_node_in_group("Player")
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass
