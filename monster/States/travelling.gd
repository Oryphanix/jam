extends State
class_name EnemyTravelling
var delayTimer: Timer
var time: float
var distance: float
var speed: float
@export var en: CharacterBody2D

func wait(timex):
	delayTimer = Timer.new()
	delayTimer.wait_time = timex
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)


func Enter():
	print("travelling")
	if !(GlobalSceneData.enemyStateName == "travelling" or GlobalSceneData.enemyStateName == "prelurking" or GlobalSceneData.enemyStateName == "lurking"):
		en.hide()
		time = calculate_time()
		wait(time)
	else:
		SignalManager.transitioned.emit(self, "prelurking")
		
func calculate_time():
	distance = GlobalSceneData.W1stairPos.x - GlobalSceneData.W1enemyPosition.x
	speed = Global.enemySpeed
	time = distance/speed
	return time

func on_timer_finished():
	SignalManager.transitioned.emit(self, GlobalSceneData.enemyStateName)




# Called when the node enters the scene tree for the first time.
