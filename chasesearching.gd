extends State
class_name EnemyChaseSearching

@export var enemy: CharacterBody2D
@export var moveSpeed: float
var player: CharacterBody2D
var delayTimer: Timer

func wait():
	delayTimer = Timer.new()
	delayTimer.wait_time = 5
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)
	
	
func Enter():
	GlobalSceneData.enemyStateName = "chasesearching"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyState)
	Global.enemySpeed = 1.1*Global.playerSpeed
	moveSpeed = 1.1*Global.playerSpeed
	player = get_tree().get_first_node_in_group("Player")
	
func Update(_delta: float):
	var direction = Global.playerPosition - Global.enemyPosition
	var distance := direction.length()
	if distance < 140 and not Global.isPlayerhiding:
		SignalManager.transitioned.emit(self, "chasing")
	
func Physics_Update(_delta: float):
	var random_direction = round(randf()) * 2 - 1
	enemy.velocity = Vector2(random_direction, 0) * moveSpeed

func on_timer_finished():
	SignalManager.transitioned.emit(self, "stalking")
