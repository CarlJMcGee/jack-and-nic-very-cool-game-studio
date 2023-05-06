extends RigidBody2D

signal winningBL


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click"):
		winningBL.emit()
		queue_free()
		#print("Why no delete?")

""" This was for testing
func _on_area_2d_mouse_entered():
	print("You have entered DA ZONE")


func _on_area_2d_mouse_exited():
	print("Now leaving DA ZONE BYE BYE")
"""
