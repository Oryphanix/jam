extends Node
var currentState: State
var states: Dictionary = {}
@export var initialState: State
@export var enemy: CharacterBody2D
# Called when the node enters the scene tree for the first time.
#Sets up states
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child 
			child.Transitioned.connect(change_state)
	if initialState:
		initialState.Enter()
		currentState = initialState

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentState:
		currentState.Update(delta)
		
func _physics_process(delta):
	if currentState and enemy.is_on_floor():
		currentState.Physics_Update(delta)
		
#Function for changing state
func change_state(state: State, newStateName: String):
	#Checking for state existence
	if state != currentState:
		return
	var newState = states.get(newStateName.to_lower())
	if !newState:
		print("new state empty")
		return
	#Transitions state
	if currentState:
		currentState.Exit()
	newState.Enter()
	currentState = newState



 	
