extends Path2D

# Destroys entire Glock during victory. 
func _on_mask_music_stop():
	queue_free()
