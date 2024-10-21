extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var CSF = get_tree().current_scene.scene_file_path
		var NLN = CSF.to_int() - 1
		var NLP = "res://world/world" + str(NLN) + ".tscn"
		print(CSF)
		print(NLN)
		print(NLP)
		get_tree().change_scene_to_file(NLP)
	else:
		print(body.name)
