extends Sprite2D

var temp
var vignette
var run = false
var argument = false
var narwhal = false
var argumentNarwhal = false
@export var sanity = 3300.0
@export var totalExponential = 1
@export var runExponential = 1
@export var narwhalExponential = 1
@export var time = 0.0
@export var narwhalIncrease = 20.0

func _ready() -> void:
	if GlobalSceneData.playerSanity == null:
		Global.maxSanity = sanity
		Global.sanity = Global.maxSanity
		sanity = Global.sanity
	else:
		sanity = GlobalSceneData.playerSanity

func _process(delta):
	temp = sanity / 13
	vignette = 255 - temp
	#using the sanity variable to work out vignette opacity. sanity /13 will ensure vignette opacity is between 0 and 
	#255. since opacity is inverse to sanity, temp is used to subtract it from 255.
	modulate.a8 = vignette  
	#changing the opacity of the vignette
	#print(vignette)

	if Input.is_action_just_pressed("ui_n") or argument:
		argumentNarwhal = true
		narwhal = true
		#if n key is pressed, the player uses the narwhal
	if Input.is_action_just_released("ui_n"):
		argumentNarwhal = false
		narwhal = false
		#if n key is released, the player stops using the narwhal
	if Input.is_action_just_pressed("ui_shift") or argument:
		argument = true
		run = true
		#if the shift key is pressed, the player starts running.
	if Input.is_action_just_released("ui_shift"):
		argument = false
		run = false
		#if the shift key is released, the player stops running.

	time += delta
	#creating a timer
	if time >= 1.0:
		sanity -= 11
		time = 0.0
		#if no other keys are pressed, when the timer hits 1 second, 11 sanity points are deducted. this results in the 
		if run:
			runExponential *= 1.1
			sanity -= runExponential
			#if the character is running, sanity decreases by an exponential of 1.1
		if narwhal:
			narwhalExponential *= 1.11
			narwhalIncrease *= 0.9
			sanity -= narwhalExponential
			sanity += narwhalIncrease
			#if the character is holding the narwhal, the sanity decreases by an exponential of 1.11, but increases by an exponential of 0.9. 
		if run and narwhal:
			totalExponential *= 1.2
			narwhalIncrease += 0.85
			sanity -= totalExponential
			sanity +- narwhalIncrease
	if sanity < 0:
		pass
			#if the character is holding the narwhal and running, sanity decreases by an exponential of 1.2, but increases by an exponential of 0.85
	Global.sanity = sanity
