extends Node
class_name State

#Signal to Handle state transition
signal Transitioned(state: State, new_state_name: String)

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass

	
