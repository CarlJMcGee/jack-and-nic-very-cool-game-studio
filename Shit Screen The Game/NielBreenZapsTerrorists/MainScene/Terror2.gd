extends RigidBody2D
signal winningBR

var donotdouble2 := false



func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click(all mouse buttons)"):
		if not donotdouble2:
			donotdouble2 = true
			winningBR.emit()
			queue_free()
