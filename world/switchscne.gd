extends Area2D

signal Transitioned(state: State, new_state_name: String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var CSF = get_tree().current_scene.scene_file_path
		var NLN = CSF.to_int()+1
		var NLP = "res://world/world" + str(NLN) + ".tscn"
		GlobalSceneData.W1playerPosition = Global.playerPosition
		get_tree().change_scene_to_file(NLP)
