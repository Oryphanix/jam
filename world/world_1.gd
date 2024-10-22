extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !(GlobalSceneData.W1enemyPosition == null and GlobalSceneData.W1playerPosition == null):
		$Player/player.global_position = GlobalSceneData.W1playerPosition - Vector2(10,0)
	print(get_tree_string_pretty())
