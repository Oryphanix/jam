extends State
class_name EnemyStalkChase


@export var enemy: CharacterBody2D
@export var moveSpeed := 600
var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("dead")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Physics_Update(_delta: float):
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	enemy.velocity = (direction.normalized() * moveSpeed)
