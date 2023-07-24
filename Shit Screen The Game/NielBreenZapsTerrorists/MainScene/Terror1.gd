extends RigidBody2D

signal winningBL

var donotdouble1 := false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click(all mouse buttons)"):
		if not donotdouble1:
			donotdouble1 = true
			winningBL.emit()
			queue_free()
		#print("Why no delete?")

""" This was for testing
func _on_area_2d_mouse_entered():
	print("You have entered DA ZONE")


func _on_area_2d_mouse_exited():
	print("Now leaving DA ZONE BYE BYE")
"""
