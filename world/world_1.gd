extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if !(GlobalSceneData.W1enemyPosition == null and GlobalSceneData.W1playerPosition == null):
		$Player/player.global_position = GlobalSceneData.W1playerPosition - Vector2(20,0)
		SignalManager.transitioned.emit(GlobalSceneData.enemyState, "travelling")
		$Enemy.show()
		$Enemy.global_position = GlobalSceneData.W1stairPos
	print("On world enetry ")
	print(Global.sanity)
	print(GlobalSceneData.playerSanity)
	print("========")
		
