extends RigidBody2D
signal winningBR





func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click"):
		winningBR.emit()
		queue_free()
