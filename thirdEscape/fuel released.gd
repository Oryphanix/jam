extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a8 = 0
	



func _on_fire_location_fire_area_reached() -> void:
	modulate.a8 = 255
