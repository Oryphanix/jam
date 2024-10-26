extends State
class_name EnemyTravelling
var delayTimer: Timer
var time: float
var distance: float
var speed: float
@export var en: CharacterBody2D
#tate for beween level

#et up a timer
func wait(timex):
	delayTimer = Timer.new()
	delayTimer.wait_time = timex
	delayTimer.timeout.connect(on_timer_finished)
	delayTimer.autostart = true
	add_child(delayTimer)


func Enter():
	print("travelling")
	#If in talking or chaing tate, wait
	if !(GlobalSceneData.enemyStateName == "travelling" or GlobalSceneData.enemyStateName == "prelurking" or GlobalSceneData.enemyStateName == "lurking"):
		en.hide()
		#Hide it
		time = calculate_time()
		#Wait
		wait(time)
	else:
		#if in lurking or other, then jut go to prelurking
		SignalManager.transitioned.emit(self, "prelurking")
		
func calculate_time():
	#get the ditance to travel
	distance = GlobalSceneData.W1stairPos.x - GlobalSceneData.W1enemyPosition.x
	speed = Global.enemySpeed
	#idot
	#t=d/
	time = distance/speed
	#Return the time
	return time

func on_timer_finished():
	#When the time i done, revert to previou tate
	SignalManager.transitioned.emit(self, GlobalSceneData.enemyStateName)




# Called when the node enters the scene tree for the first time.
