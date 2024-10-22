extends Area2D
 
var argument = true

func _ready():
	if argument:
		modulate.a8 = 0
		#hiding the battery inventory at the start


func _on_rope_rope_inventory() -> void:
	modulate.a8 = 255
	#revealing it when picked up
	argument = false
#stopping it from hiding again


func _on_open_window_escape_through_window() -> void:
	modulate.a8 = 0
	argument = true
	
