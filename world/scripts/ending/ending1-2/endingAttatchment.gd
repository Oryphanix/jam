extends Node

var delayTimer: Timer

func _ready():
	GlobalSceneData.enemyStateName = ""
	GlobalSceneData.playerSanity = null
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

	pass
	
	
	
	
func wait():
	delayTimer = Timer.new()
	delayTimer.wait_time = 2
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)
	

func on_timer_finished():
	get_tree().change_scene_to_file("res://secondEscape/floor1")
	
