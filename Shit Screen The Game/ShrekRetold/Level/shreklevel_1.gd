extends Node2D


#Replace print() with actual victory stuff
func _on_exit_body_entered(body):
	if body.is_in_group("Player"):
		print("You win!")
		
