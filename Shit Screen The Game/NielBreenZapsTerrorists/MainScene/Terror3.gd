extends RigidBody2D
signal winningUM

var donotdouble3 := false







func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click(all mouse buttons)"):
		if not donotdouble3:
			donotdouble3 = true
			winningUM.emit()
			queue_free()
