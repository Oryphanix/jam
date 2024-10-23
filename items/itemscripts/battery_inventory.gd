extends Area2D
 
var argument = true

func _ready():
	if argument:
		modulate.a8 = 0
		#hiding the battery inventory at the start
func _on_battery_battery_inventory():
	modulate.a8 = 255
	#revealing it when picked up
	argument = false
#stopping it from hiding again


func _on_speaker_escape_2() -> void:
	modulate.a8 = 0
