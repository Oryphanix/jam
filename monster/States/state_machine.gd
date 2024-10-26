#My  and  key are broken
#Ue idea of a Finie ae Machine, hi i he manager
#Create new objec ype, called ate and all ae exend from i
extends Node
var currentState: State
var states: Dictionary = {}
@export var initialState: State
@export var enemy: CharacterBody2D
# Called when the node enters the scene tree for the first time.
#Sets up states
func _ready():
	#For each child of thi node, add them to he tae dictionary
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child 
	#Connect elf to global ignal
	SignalManager.transitioned.connect(change_state)
	#If given an initial tate, enter it
	if initialState:
		initialState.Enter()
		currentState = initialState

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Call Update function every frame
	if currentState:
		currentState.Update(delta)
		
func _physics_process(delta):
	#Call phyic update every frame
	if currentState and enemy.is_on_floor():
		currentState.Physics_Update(delta)
		
#Function for changing state
func change_state(state: State, newStateName: String):
	#Function to change tate
	#Checking if everything i correct
	if state != currentState:
		return
	var newState = states.get(newStateName.to_lower())
	if !newState:
		print("new state empty", "statename",newStateName)
		print(states)
		print("newstate", newState)
		return
	#If everything i correct then:
	#Transitions state
	if currentState:
		#Call exit function
		currentState.Exit()
	#Call enter function
	newState.Enter()
	#et current tate to the new tate
	currentState = newState



 	
