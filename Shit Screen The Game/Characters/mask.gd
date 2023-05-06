extends Area2D
# Export var : PackedScene makes an empty box in editor you can drag a scene to.
#This lets you store a scene you want to make later.
@export var Victory : PackedScene

# Signals is how you get seperate scripts to talk to each other.
signal Music_stop


# When Mask's hitbox collides with any other hitbox,
# emit() is how you send a signal to any script it is connected to.
# Play victory song.
# Create stored victory image.
func _on_area_entered(area):
	Music_stop.emit()
	$VictorySong.play()
	var win = Victory.instantiate()
	get_parent().add_child(win)
	

# Quit game when song finishes.
"""
# NOTE: REMEMBER TO CHANGE THIS IF WE EVER CONNECT THIS GAME TO OTHER MINI GAMES 
"""
func _on_victory_song_finished():
	get_tree().quit()
