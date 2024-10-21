extends State
class_name EnemyStalk

#PLACEHOLDER BEHAVIOUR

@export var enemy: CharacterBody2D
@export var moveSpeed: float = 200
@export var moveAway: float
@export var playerFacing = false
var dirToGo: Vector2
var wallLeft: Marker2D

func Enter():
	wallLeft = get_tree().get_first_node_in_group("wallleft")
	dirToGo = Vector2(-1,0)
	print("entered stalk")
	
func Physics_Update(_delta: float):
	enemy.velocity = dirToGo * moveSpeed

func Update(_delta: float):
	pass


func _on_body_left_entered(body: Node2D) -> void:
	if body.name == "TileMapLayer":
		dirToGo = Vector2(1,0)





func _on_body_right_entered(body: Node2D) -> void:
	if body.name == "TileMapLayer":
		dirToGo = Vector2(-1,0)
