#tate where the enemy i hiding and about to appear
extends State
class_name prelurk

@export var minTime := 2.5
@export var maxTime := 12.5
@export var en: CharacterBody2D
var delayTimer: Timer

#Create timer and attatche it 
func wait():
	delayTimer = Timer.new()
	#Timer ha a random time between the two value
	delayTimer.wait_time = randf_range(minTime, maxTime)
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)

#When the enemy enter thi tate, thi happen
func Enter():
	#Udate Global Variable
	GlobalSceneData.enemyStateName = "prelurking"
	GlobalSceneData.enemyState = self
	print(GlobalSceneData.enemyStateName)
	#Hide and call the wait function
	en.hide()
	wait()

func Update(_delta: float):
	#If the anoty i in a range, et tate to talking
	if Global.sanity <= (2*Global.maxSanity)/3 and Global.sanity > (Global.maxSanity)/3:
		SignalManager.transitioned.emit(self, "stalking")

#When the timer i fnihed, et tate to lurking
func on_timer_finished():
	SignalManager.transitioned.emit(self,"lurking")

#Remove and free up memory from timer
func Exit():
	delayTimer.stop()
	delayTimer.timeout.disconnect(on_timer_finished)
	delayTimer.queue_free()
	delayTimer = null
