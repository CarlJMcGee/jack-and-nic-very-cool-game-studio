extends RigidBody2D

signal youlose



func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click(all mouse buttons)"):
		print("game over time")

