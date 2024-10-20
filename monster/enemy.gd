class_name enemy extends CharacterBody2D

var playerPosition: Vector2
var enemyPosition: Vector2


func _process(_delta: float):
	Global.enemyPosition = self.global_position
func _physics_process(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
