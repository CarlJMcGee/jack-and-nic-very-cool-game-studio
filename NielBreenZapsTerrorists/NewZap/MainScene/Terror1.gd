extends RigidBody2D

signal winning


func _on_area_2d_input_event(viewport, event, shape_idx):
	winning.emit(winning)
	queue_free()
