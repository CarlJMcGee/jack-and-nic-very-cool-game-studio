extends RigidBody2D


signal winningUR

var donotdouble4 := false


func _on_area_2d_input_event(viewport, event, shape_idx):
		if Input.is_action_just_pressed("click(all mouse buttons)"):
			if not donotdouble4:
				donotdouble4 = true
				winningUR.emit()
				queue_free()
