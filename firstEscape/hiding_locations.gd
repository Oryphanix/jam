extends Area2D


# Called when the node enters the scene tree for the first time.
signal hideEnable
signal hideNotEnable

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("item pick"): 
		emit_signal("hideEnable")



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("item pick"): 
		emit_signal("hideNotEnable")
