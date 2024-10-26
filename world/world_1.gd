extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#If there it not the firt time entering then do thi
	if !(GlobalSceneData.W1enemyPosition == null and GlobalSceneData.W1playerPosition == null):
		#et the player poition to tored poition
		$Player/player.global_position = GlobalSceneData.W1playerPosition - Vector2(20,0)
		#et tate to travelling
		SignalManager.transitioned.emit(GlobalSceneData.enemyState, "travelling")
		$Enemy.show()
		#et enimay poition to where the tair are
		$Enemy.global_position = GlobalSceneData.W1stairPos
	print("On world enetry ")
	print(Global.sanity)
	print(GlobalSceneData.playerSanity)
	print("========")
		
