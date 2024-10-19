extends Node
var currentState: State
var states: Dictionary = {}
@export var initialState: State

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child # Replace with function body.
			child.Transitioned.connect(on_child_transition)
			
	if initialState:
		initialState.Enter()
		currentState = initialState

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentState:
		currentState.Update(delta)

	
	
	
func _physics_process(delta):
	if currentState:
		currentState.Physics_Update(delta)

func on_child_transition(state, newStateName):
	if state != currentState:
		return
	var newState = states.get(newStateName.tolower())
	if !newState:
		return
	if currentState:
		currentState.Exit()
	newState.Enter()
	currentState = newState



 	
