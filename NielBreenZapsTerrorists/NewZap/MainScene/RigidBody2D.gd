extends RigidBody2D

signal youlose



func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventAction:
		if Input.is_action_just_pressed("click"):
			print("game over time")
	
