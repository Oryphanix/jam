extends Sprite2D
var temp
var sanityValue = 3300
var vignette 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a8 = 0



func _on_v_ignette_sanity_value(sanity):
	sanityValue = sanity

	
func _on_v_ignette_vignette_but_red():
	temp = sanityValue/ 13
	vignette = 255 - temp
	modulate.a8 = vignette
