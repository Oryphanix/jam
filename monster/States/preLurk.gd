extends State
class_name prelurk

@export var minTime := 2.5
@export var maxTime := 12.5
@export var en: CharacterBody2D
var delayTimer: Timer

func wait():
	delayTimer = Timer.new()
	delayTimer.wait_time = randf_range(minTime, maxTime)
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)

func Enter():
	print("prelurk")
	GlobalSceneData.enemyState = "prelurking"
	en.hide()
	wait()
	
func on_timer_finished():
	SignalManager.transitioned.emit(self,"lurking")
	
func Exit():
	delayTimer.stop()
	delayTimer.timeout.disconnect(on_timer_finished)
	delayTimer.queue_free()
	delayTimer = null
