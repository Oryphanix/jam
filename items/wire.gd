extends Area2D
signal wireInventory
#creating a signal that can be emitted.
func _on_body_entered(body):
	#signal generation
	if body.is_in_group("item pick"): 
		#item pick is the group where the characer is located. 
		#this is the only reason that it works. the character must be in that group, 
		#and the item must be attached to a "body entered (body node2d) signal (which connects to itself) in order for everything to work as it should. 
	#checking for a collision
		modulate.a8 = 0
		#making the opacity of the object 0, and thus hiding it.
		emit_signal ("wireInventory")
		#emitting the signal when picked up by the player


#
