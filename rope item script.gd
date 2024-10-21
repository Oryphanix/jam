extends StaticBody2D


func _o_body_entered():
	if self.is_in_group("character_body_2D"):
		print("H")
