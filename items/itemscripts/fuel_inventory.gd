extends Area2D
 
var argument = true

func _ready():
	if argument:
		modulate.a8 = 0
		#hiding the battery inventory at the start

func _on_fuel_fuel_inventory():
	modulate.a8 = 255
	#revealing it when picked up
	argument = false
#stopping it from hiding again


func _on_fire_location_fire_area_reached() -> void:
	modulate.a8 = 0
	
