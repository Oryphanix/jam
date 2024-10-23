extends Node

var delayTimer: Timer

func _ready():
	wait()
	#RESET
	GlobalSceneData.enemyStateName = ""
	GlobalSceneData.playerSanity = null
	GlobalSceneData.W0playerPosition = null
	GlobalSceneData.W0enemyPosition = null
	GlobalSceneData.W0stairPos = null
	#World1
	GlobalSceneData.W1playerPosition = null
	GlobalSceneData.W1enemyPosition = null
	GlobalSceneData.W1stairPos = null
	#World2
	GlobalSceneData.W2playerPosition = null
	GlobalSceneData.W2enemyPosition = null
	GlobalSceneData.W2stairPos = null
	#World3
	GlobalSceneData.W3playerPosition = null
	GlobalSceneData.W3enemyPosition = null
	GlobalSceneData.W3stairPos = null
	Global.enemyPosition = Vector2.ZERO
	Global.enemySpeed =  0
	Global.playerPosition = Vector2.ZERO
	Global.playerFace = Vector2.ZERO
	Global.playerSpeed =  0
	Global.sanity = 0
	Global.maxSanity = 0
	Global.isPlayerhiding = false
	
	
	
func wait():
	delayTimer = Timer.new()
	delayTimer.wait_time = 2
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)
	

func on_timer_finished():
	get_tree().change_scene_to_file("res://thirdEscape/floor1.tscn")
	
