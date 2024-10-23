extends Area2D

signal escape3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a8 = 0

func _on_burnt_match_burn() -> void:
	modulate.a8 = 255
	emit_signal("escape3")
