#My  and  key are broken and omeime my o key
class_name enemy extends CharacterBody2D

var playerPosition: Vector2
var enemyPosition: Vector2

#Update he global funcion
func _process(_delta: float):
	Global.enemyPosition = self.global_position
#Applie graviy
func _physics_process(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
