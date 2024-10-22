extends State
class_name EnemyStalk


@export var enemy: CharacterBody2D
@export var moveSpeed: float = 200
@export var moveAway: float
@export var playerFacing = false
var player: CharacterBody2D
var dirToGo: Vector2


func Enter():
	enemy.show()
	GlobalSceneData.enemyStateName = "stalking"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	Global.enemySpeed = moveSpeed
	player = get_tree().get_first_node_in_group("Player")
	dirToGo = Vector2(-1,0)
	
func Physics_Update(_delta: float):
	enemy.velocity = dirToGo * moveSpeed

func Update(_delta: float):
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	#if distance < 140:
	#	SignalManager.transitioned.emit(self, "chasing")
	


func _on_body_left_entered(body: Node2D) -> void:
	if body.name == "TileMapLayer":
		dirToGo = Vector2(1,0)

func _on_body_right_entered(body: Node2D) -> void:
	if body.name == "TileMapLayer":
		dirToGo = Vector2(-1,0)
