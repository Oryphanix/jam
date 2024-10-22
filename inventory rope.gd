extends Area2D
 
var argument = true

func _ready():
	if argument:
		modulate.a8 = 0
		#hiding the rope inventory at the start




func _on_rope_rope_inventory() -> void:
	modulate.a8 = 255
	#revealing it when it is picked up
	argument = false
	#stopping it from hiding again
