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
	GlobalSceneData.enemyStateName = "prelurking"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyStateName)
	en.hide()
	wait()

func Update(_delta: float):
	if Global.sanity <= (2*Global.maxSanity)/3 and Global.sanity > (Global.maxSanity)/3:
		SignalManager.transitioned.emit(self, "stalking")

func on_timer_finished():
	SignalManager.transitioned.emit(self,"lurking")
	
func Exit():
	delayTimer.stop()
	delayTimer.timeout.disconnect(on_timer_finished)
	delayTimer.queue_free()
	delayTimer = null
