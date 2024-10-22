extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	if !(GlobalSceneData.W2enemyPosition == null and GlobalSceneData.W2playerPosition == null):
		$Player/player.global_position = GlobalSceneData.W2stairPos - Vector2(20,0)
		SignalManager.transitioned.emit(GlobalSceneData.enemyState, "travelling")
		$Enemy.show()
		$Enemy.global_position = GlobalSceneData.W2stairPos
		print("loaded")
		
