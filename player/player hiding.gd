extends Node2D

var hideAllowed
var hiding

func _ready():
	modulate.a8 = 0
# Called when the node enters the scene tree for the first time.
func _on_hiding_locations_hide_enable() -> void:
	hideAllowed = true

func _on_hiding_locations_hide_not_enable() -> void:
	hideAllowed = false

func _Input():
	if Input.is_action_just_pressed("ui_h") and hideAllowed:
	
		modulate.a8 = 255
		hiding = true
	if Input.is_action_just_pressed("ui_v") and hiding:
		modulate.a8 = 0
		hiding = false
